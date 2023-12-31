package com.ssafit.board.service;

import com.ssafit.board.model.dao.BoardDao;
import com.ssafit.board.model.entity.Board;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {

	private final BoardDao boardDao;

	@Override
	public List<Board> getList() {
		return boardDao.selectAll();
	}

	@Override
	public Board getBoard(int boardId) {
		return boardDao.selectOne(boardId);
	}

	@Override
	public boolean registBoard(Board board) {
		return boardDao.insertBoard(board) > 0;
	}

	@Override
	public boolean modifyBoard(Board board, int boardId) {
		Board newBoard =
				Board.builder()
						.boardId(boardId)
						.name(board.getName())
						.description(board.getDescription())
						.build();

		return boardDao.updateBoard(newBoard) > 0;
	}

	@Override
	public boolean deleteBoard(int boardId) {
		return boardDao.deleteBoard(boardId) > 0;
	}

}
