package co.prog.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.prog.common.DataSource;
import co.prog.mapper.ReplyMapper;
import co.prog.vo.ReplyVO;

public class ReplyServiceMybatis implements ReplyService{
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
	@Override
	public List<ReplyVO> replyList(ReplyVO rvo) {
		// TODO Auto-generated method stub
		return mapper.replyListWithPaging(rvo);
	}
	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return mapper.getTotalCount();
		}
	
	public boolean addReply(ReplyVO vo) {
		int r= mapper.insertReply(vo);
		return r==1;
	}
	
	
	@Override
	public int replyRemove(int nid) {
		// TODO Auto-generated method stub
		return mapper.deleteReply(nid);
	}
	}
	



