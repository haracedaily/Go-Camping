package co.prog.mapper;

import java.util.List;


import co.prog.vo.ReplyVO;

public interface ReplyMapper {
	
	public List<ReplyVO> replyListWithPaging(ReplyVO rvo);
	
	public int getTotalCount();
	
	public int insertReply(ReplyVO vo);
	
	public int updateReply(ReplyVO vo);
	
	public int deleteReply(int nid);
}
