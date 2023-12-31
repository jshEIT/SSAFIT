package com.ssafit.article.controller;

import com.ssafit.article.model.dto.request.ArticleModifyRequest;
import com.ssafit.article.model.dto.request.ArticleRegistRequest;
import com.ssafit.article.model.dto.response.ArticleResponse;
import com.ssafit.article.service.ArticleService;
import com.ssafit.comment.service.CommentService;
import com.ssafit.user.model.dto.response.UserResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.List;

/**
 * Handles requests for the application home page.
 */
@RestController
@RequestMapping("/article")
@Api(tags="게시글 컨트롤러")
@CrossOrigin("http://localhost:5173/")
public class ArticleController {
	
	private final ArticleService articleService;
	private final CommentService commentService;

	@Autowired
	public ArticleController(ArticleService articleService, CommentService commentService) {
		this.articleService = articleService;
		this.commentService = commentService;
	}

	@GetMapping
	@ApiOperation(value="게시글 전체 조회", notes="모든 게시글을 보여줍니다.")
	public ResponseEntity<List<ArticleResponse>> getAllArticles() {
		List<ArticleResponse> articleList = articleService.getArticleList();
		return new ResponseEntity<List<ArticleResponse>>(articleList,HttpStatus.OK);
	}
	
	@GetMapping("/{articleId}")
	@ApiOperation(value="게시글 조회", notes="게시글과 댓글을 보여줍니다.")
	public ResponseEntity<ArticleResponse> getArticle(@PathVariable int articleId) {

		ArticleResponse articleResponse = articleService.readArticle(articleId);
		return new ResponseEntity<ArticleResponse>(articleResponse, HttpStatus.OK);
	}

	@GetMapping("/myArticleList")
	@ApiOperation(value="유저가 쓴 게시글 조회")
	public ResponseEntity<List<ArticleResponse>> getArticleList(HttpServletRequest request) {
		int userSeq = Integer.parseInt(request.getHeader("userSeq"));
		return new ResponseEntity<List<ArticleResponse>>(articleService.getArticleListByUser(userSeq),HttpStatus.OK);
	}

	@GetMapping("/articleLikeList")
	@ApiOperation(value="좋아요한 게시글 목록 조회")
	public ResponseEntity<List<ArticleResponse>> getArticleLikeList(HttpServletRequest request) {
		int userSeq = Integer.parseInt(request.getHeader("userSeq"));
		return new ResponseEntity<List<ArticleResponse>>(articleService.getArticleLikeList(userSeq),HttpStatus.OK);
	}
	

	@PostMapping("/write")
	@ApiOperation(value="게시글 등록", notes="로그인 계정만 사용가능합니다.")
	public ResponseEntity<Boolean> writeArticle(
			@RequestBody ArticleRegistRequest articleRegistRequest,
			HttpServletRequest request) {
		int userSeq = Integer.parseInt(request.getHeader("userSeq"));
		
		boolean isRegistered = articleService.writeArticle(articleRegistRequest, userSeq);
		if (!isRegistered)
			return new ResponseEntity<Boolean>(isRegistered,HttpStatus.NO_CONTENT);
		return new ResponseEntity<Boolean>(isRegistered,HttpStatus.OK);
	}

	
	@PutMapping("/{articleId}/update")
	@ApiOperation(value="게시글 갱신", notes="관리자 계정과 해당 게시글 작성자만 사용가능합니다.")
	public ResponseEntity<Boolean> updateArticle(
			@PathVariable int articleId,
			@RequestBody ArticleModifyRequest articleModifyRequest,
			HttpServletRequest request) {
//		UserResponse loginUser = (UserResponse) session.getAttribute("loginUser");
//		int userSeq = loginUser.getUserSeq();
		int userSeq = Integer.parseInt(request.getHeader("userSeq"));
		System.out.println("userSeq => " + userSeq);
		boolean isUpdated = articleService.modifyArticle(articleModifyRequest, articleId, userSeq);

		if (!isUpdated)
			return new ResponseEntity<Boolean>(isUpdated,HttpStatus.NO_CONTENT);
		return new ResponseEntity<Boolean>(isUpdated,HttpStatus.OK);
	}
	
	@DeleteMapping("/{articleId}/delete")
	@ApiOperation(value="게시글 삭제", notes="관리자 계정과 로그인 계정만 사용가능합니다.")
	public ResponseEntity<Boolean> deleteArticle(
			@PathVariable int articleId) {
		int boardId = articleService.readArticle(articleId).getBoardId();

		boolean isDeleted = articleService.deleteArticle(articleId);
		if (!isDeleted)
			return new ResponseEntity<Boolean>(isDeleted,HttpStatus.NO_CONTENT);
		return new ResponseEntity<Boolean>(isDeleted,HttpStatus.OK);

	}

	@GetMapping("/{articleId}/like")
	@ApiOperation(value="게시글 별 좋아요 개수")
	public ResponseEntity<Integer>getLikeNumber(@PathVariable int articleId) {
		return new ResponseEntity<Integer>(articleService.getLikeCount(articleId),HttpStatus.OK);
	}

	@GetMapping("/{articleId}/isLiked")
	@ApiOperation(value="특정 사용자가 좋아요를 눌렀는지 확인")
	public ResponseEntity<Integer> isLiked(@PathVariable int articleId, HttpServletRequest request) {
		int userSeq = Integer.parseInt(request.getHeader("userSeq"));
		return new ResponseEntity<Integer>(articleService.isLiked(articleId, userSeq),HttpStatus.OK);
	}

	@PostMapping("/{articleId}/like")
	@ApiOperation(value="게시글 좋아요 누르기", notes="게시글에 좋아요를 누릅니다.")
	public ResponseEntity<Boolean> doArticleLike(@PathVariable int articleId, HttpServletRequest request){
		int userSeq = Integer.parseInt(request.getHeader("userSeq"));
		boolean isLikeAdded = articleService.addArticleLike(articleId, userSeq);
		if (!isLikeAdded)
			return new ResponseEntity<Boolean>(isLikeAdded,HttpStatus.NO_CONTENT);
		return new ResponseEntity<Boolean>(isLikeAdded,HttpStatus.OK);
	}

	@DeleteMapping("/{articleId}/like")
	@ApiOperation(value="게시글 좋아요 취소", notes="게시글에 좋아요를 취소합니다.")
	public ResponseEntity<Boolean> undoArticleLike(@PathVariable int articleId, HttpServletRequest request){
		int userSeq = Integer.parseInt(request.getHeader("userSeq"));
		boolean isDislikeUndone = articleService.deleteArticleLike(articleId,userSeq);
		if (!isDislikeUndone)
			return new ResponseEntity<Boolean>(isDislikeUndone,HttpStatus.NO_CONTENT);
		return new ResponseEntity<Boolean>(isDislikeUndone,HttpStatus.OK);
	}

	@GetMapping("/{articleId}/dislike")
	@ApiOperation(value="게시글 별 싫어요 개수")
	public ResponseEntity<Integer>getDislikeNumber(@PathVariable int articleId) {
		return new ResponseEntity<Integer>(articleService.getDislikeCount(articleId),HttpStatus.OK);
	}

	@GetMapping("/{articleId}/isDisliked")
	@ApiOperation(value="특정 사용자가 싫어요를 눌렀는지 확인")
	public ResponseEntity<Integer> isDisLiked(@PathVariable int articleId, HttpServletRequest request) {
		int userSeq = Integer.parseInt(request.getHeader("userSeq"));
		return new ResponseEntity<Integer>(articleService.isDisliked(articleId, userSeq),HttpStatus.OK);
	}

	@PostMapping("/{articleId}/dislike")
	@ApiOperation(value="게시글 싫어요 누르기", notes="게시글에 싫어요를 누릅니다.")
	public ResponseEntity<Boolean> doArticleDisLike(@PathVariable int articleId, HttpServletRequest request){
		int userSeq = Integer.parseInt(request.getHeader("userSeq"));
		boolean isDislikeAdded = articleService.addArticleDislike(articleId, userSeq);
		if (!isDislikeAdded)
			return new ResponseEntity<Boolean>(isDislikeAdded,HttpStatus.NO_CONTENT);
		return new ResponseEntity<Boolean>(isDislikeAdded,HttpStatus.OK);
	}

	@DeleteMapping("/{articleId}/dislike")
	@ApiOperation(value="게시글 싫어요 취소", notes="게시글에 싫어요를 취소합니다.")
	public ResponseEntity<Boolean> undoArticleDislike(@PathVariable int articleId,HttpServletRequest request){
		int userSeq = Integer.parseInt(request.getHeader("userSeq"));
		boolean isDislikeUndone = articleService.deleteArticleDislike(articleId, userSeq);
		if (!isDislikeUndone)
			return new ResponseEntity<Boolean>(isDislikeUndone,HttpStatus.NO_CONTENT);
		return new ResponseEntity<Boolean>(isDislikeUndone,HttpStatus.OK);
	}





}
