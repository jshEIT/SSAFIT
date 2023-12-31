package com.ssafit.user.controller;

import com.ssafit.user.model.dto.request.*;
import com.ssafit.user.model.dto.response.UserCheckResponse;
import com.ssafit.user.model.dto.response.UserResponse;
import com.ssafit.user.model.entity.Mail;
import com.ssafit.user.model.entity.User;
import com.ssafit.user.service.UserService;
import com.ssafit.util.JwtUtil;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
@Api(tags="사용자 관리 컨트롤러")
@CrossOrigin("http://localhost:5173/")
public class UserController {
	
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";
	
	private final UserService userService;

	@Autowired
	public UserController(UserService userService) {
		this.userService = userService;
	}
	
	@Autowired
	private JwtUtil jwtUtil;

	@PostMapping("/login")
	@ApiOperation(value="로그인을 합니다.", notes="bindingResult 추후 추가 예정")
	public ResponseEntity<Map<String, Object>> login(@RequestBody UserLoginRequest loginRequest, HttpSession session) {
		Map<String, Object> result = new HashMap<String, Object>();
		UserResponse loginUser = userService.login(loginRequest);
		
		HttpStatus status = null;
		
		if (loginUser != null) {
			try {
				result.put("access-token", jwtUtil.createToken("userSeq", ""+loginUser.getUserSeq()));
				result.put("userSeq",loginUser.getUserSeq());
				result.put("message", SUCCESS);
				status = HttpStatus.ACCEPTED;
				String token = (String)result.get("access-token");
				Jws<Claims> claims = jwtUtil.getClaims(token);
			} catch (Exception e) {
				result.put("message", FAIL);
				status = HttpStatus.NO_CONTENT;
			}
		} else {
			result.put("message", FAIL);
			status = HttpStatus.NO_CONTENT;
		}
		return new ResponseEntity<Map<String, Object>>(result, status);
	}
	
	@GetMapping("/logout")
	@ApiOperation(value="로그아웃", notes="로그아웃 기능 구현")
	public ResponseEntity<Void> logout(HttpSession session) {
		session.invalidate();
		return ResponseEntity.ok().build();
	}

	@GetMapping
	@ApiOperation(value="회원 리스트 가져오기")
	public ResponseEntity<List<UserResponse>> getUsers() {
		return new ResponseEntity<List<UserResponse>>(userService.getUserList(),HttpStatus.OK);
	}
	
	@GetMapping("/userInfo")
	@ApiOperation(value="단일 회원 가져오기")
	public ResponseEntity<UserResponse> getUserInfo(HttpServletRequest request) {
		String token = (String)request.getHeader("access-token");
		System.out.println(token);
		try {
			Jws<Claims> claims = jwtUtil.getClaims(token);
			System.out.println((String)claims.getBody().get("userSeq"));
			return new ResponseEntity<UserResponse>(userService.searchByUserSeq(Integer.parseInt((String)claims.getBody().get("userSeq"))),HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	@GetMapping("/{userSeq}")
	@ApiOperation(value="단일 회원 가져오기")
	public ResponseEntity<UserResponse> getUser(@PathVariable int userSeq) {
		return new ResponseEntity<UserResponse>(userService.searchByUserSeq(userSeq),HttpStatus.OK);
	}
	
	@PostMapping("/signup")
	@ApiOperation(value="회원가입", notes="bindingResult 조건 추후 추가 예정")
	public ResponseEntity<String> regist(@RequestBody UserRegistRequest userRegistRequest) {
		String message = "회원가입 성공!";
		
		if(!userService.validateEmail(userRegistRequest).getIsValid()) {
			message = "이미 사용 중인 이메일입니다. 다른 이메일을 입력해주세요.";
			return new ResponseEntity<String>(message,HttpStatus.OK);
		} else if(!userService.validateNickName(userRegistRequest).getIsValid()) {
			message = "이미 사용 중인 닉네임입니다. 다른 닉네임을 입력해주세요.";
			return new ResponseEntity<String>(message,HttpStatus.OK);
		} else {
			userService.registUser(userRegistRequest);
			return new ResponseEntity<String>(message,HttpStatus.OK);
		}
	}

	@PutMapping("/update/{userSeq}")
	@ApiOperation(value="유저 정보 갱신", notes="로그인 유저만 접근 가능합니다.")
	public ResponseEntity<Boolean> updateUser(@PathVariable int userSeq, @RequestBody UserModifyRequest userModifyRequest) {
		boolean isModified = userService.modifyUser(userModifyRequest,userSeq);
		if(!isModified)
			return new ResponseEntity<Boolean>(isModified,HttpStatus.BAD_REQUEST);
		return new ResponseEntity<Boolean>(isModified,HttpStatus.OK);
	}

	@DeleteMapping("/delete/{userSeq}")
	@ApiOperation(value="유저 삭제", notes="관리자 계정만 접근 가능합니다.")
	public ResponseEntity<Boolean> removeUser(@PathVariable int userSeq) {
		boolean isRemoved = userService.removeUser(userSeq);
		if(!isRemoved)
			return new ResponseEntity<Boolean>(isRemoved,HttpStatus.BAD_REQUEST);
		return new ResponseEntity<Boolean>(isRemoved,HttpStatus.OK);
	}

	
	@PostMapping("/sendMail")
	@ApiOperation(value="비밀번호 찾기", notes="userId와 userEmail 유효성 검증 이후 이메일로 임시비밀번호 발급")
	public ResponseEntity<String> sendMail(@RequestBody FindPwRequest FindPwRequest) {
		String message = "이메일로 임시비밀번호가 발급되었습니다.";
		
		String userId = FindPwRequest.getUserId();
		String email = FindPwRequest.getEmail();
		
		User user = userService.searchByUserId(userId);
		if(user == null) {	// 아이디 유효 검증
			message = "존재하지 않는 아이디입니다.";
		} else {
			if(user.getEmail().equals(email)) {	// 이메일 유효 검증
				Mail mail = userService.createMailAndChangePwd(userId, email);
				userService.sendMail(mail);
			} else {
				message = "이메일을 확인해주세요.";
			}
		}

		return new ResponseEntity<String>(message,HttpStatus.OK);
	}


	@PostMapping("/validateId")
	@ApiOperation(value="아이디 중복 검사")
	public ResponseEntity<UserCheckResponse> validateId(@RequestBody UserCheckRequest request){
		return new ResponseEntity<UserCheckResponse>(userService.validateId(request),HttpStatus.OK);
	}
}
