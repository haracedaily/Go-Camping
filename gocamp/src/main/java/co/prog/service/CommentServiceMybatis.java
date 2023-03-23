package co.prog.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.prog.common.DataSource;
import co.prog.mapper.CommentMapper;
import co.prog.vo.CommentVO;
import co.prog.vo.NoticeDTO;
import co.prog.vo.NoticeVO;

public class CommentServiceMybatis implements CommentService{

	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	CommentMapper mapper = sqlSession.getMapper(CommentMapper.class);
	@Override
	public List<CommentVO> commentList() {
		// TODO Auto-generated method stub
		return mapper.commentList();
	}
	@Override
	public List<CommentVO> commentListPage(NoticeDTO dto) {
		// TODO Auto-generated method stub
		return mapper.commentListPaging(dto);
	}
	@Override
	public int getTotalCount(String usage) {
		// TODO Auto-generated method stub
		return mapper.getTotalCount(usage);
	}
	@Override
	public boolean addComment(CommentVO vo) {
		int r = mapper.insertComment(vo);
		return r == 1;
	}
	@Override
	public boolean commentRemove(int cNo) {
		// TODO Auto-generated method stub
		return mapper.deleteComment(cNo) == 1;
	}
	@Override
	public List<CommentVO> getComm(int boId) {
		// TODO Auto-generated method stub
		return mapper.getComm(boId);
	}

}
