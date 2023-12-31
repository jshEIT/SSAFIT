package com.ssafit.board.service;

import com.ssafit.board.model.entity.Board;

import java.util.List;

public interface BoardService {
	
	List<Board> getList();
	
	Board getBoard(int boardId);
	
	boolean registBoard(Board board);
	
	boolean modifyBoard(Board board, int boardId);
	
	boolean deleteBoard(int boardId);
	
}
