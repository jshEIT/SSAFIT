package com.ssafit.comment.controller;


import com.ssafit.comment.model.dto.response.CommentResponse;
import com.ssafit.comment.model.dto.response.ReplyResponse;
import com.ssafit.comment.model.entity.Reply;
import com.ssafit.comment.model.dto.resquest.ReplyRegisterRequest;
import com.ssafit.comment.model.dto.resquest.ReplyModifyRequest;
import com.ssafit.comment.service.ReplyService;
import com.ssafit.user.model.dto.response.UserResponse;
import com.ssafit.user.model.entity.User;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@RestController
@RequestMapping("/reply")
@Api(tags="대댓글 컨트롤러")
@CrossOrigin("http://localhost:5173/")
public class ReplyController {

    private final ReplyService replyService;

    @Autowired
    public ReplyController(ReplyService replyService) {
        this.replyService = replyService;
    }
    
    @PostMapping("/{commentId}")
    @ApiOperation(value="대댓글 등록", notes="대댓글을 등록합니다")
    public ResponseEntity<Boolean> writeReply(
            @RequestBody ReplyRegisterRequest replyRegisterRequest,
            @PathVariable final int commentId,
            HttpServletRequest request
            ) {
        int userSeq = Integer.parseInt(request.getHeader("userSeq"));

        boolean isWritten = replyService.writeReply(replyRegisterRequest, commentId, userSeq);
        if (!isWritten)
            return new ResponseEntity<Boolean>(isWritten, HttpStatus.NO_CONTENT);
        return new ResponseEntity<Boolean>(isWritten,HttpStatus.OK);
    }

    @GetMapping("/{commentId}")
    @ApiOperation(value="댓글 별 대댓글 조회",notes="댓글에 달린 대댓글을 조회합니다.")
    public ResponseEntity<?> getReplyList(@PathVariable final int commentId){
        return new ResponseEntity<List<ReplyResponse>>(replyService.getReplyByComment(commentId),HttpStatus.OK);
    }

    @GetMapping("/detail/{replyId}")
    @ApiOperation(value="댓글 1개 조회", notes="댓글 1개를 보여줍니다.")
    public ResponseEntity<ReplyResponse> commentDetail(@PathVariable int replyId) {
        return new ResponseEntity<ReplyResponse>(replyService.getReply(replyId),HttpStatus.OK);
    }

    @PutMapping("/{replyId}")
    @ApiOperation(value="대댓글 변경", notes="해당 대댓글 작성자만 변경 가능합니다.")
    public ResponseEntity<Boolean> modifyReply(
            @PathVariable final int replyId,
            @RequestBody final ReplyModifyRequest replyModifyRequest,
            HttpServletRequest request) {
        int userSeq = Integer.parseInt(request.getHeader("userSeq"));

        boolean isModified = replyService.modifyReply(replyModifyRequest,replyId,userSeq);
        if (!isModified)
            return new ResponseEntity<Boolean>(isModified,HttpStatus.NO_CONTENT);
        return new ResponseEntity<Boolean>(isModified, HttpStatus.OK);
    }

    @DeleteMapping("/{replyId}")
    @ApiOperation(value="대댓글 삭제", notes="해당 대댓글 작성자만 삭제 가능합니다.")
    public ResponseEntity<Boolean> removeReply(
            @PathVariable final int replyId,
            HttpServletRequest request){
        int userSeq = Integer.parseInt(request.getHeader("userSeq"));

        boolean isRemoved = replyService.removeReply(replyId, userSeq);
        if (!isRemoved)
            return new ResponseEntity<Boolean>(isRemoved,HttpStatus.NO_CONTENT);
        return new ResponseEntity<Boolean>(isRemoved, HttpStatus.OK);
    }


}
