package co.prog.service;
import java.util.List;

import co.prog.vo.ReplyVO;

public interface ReplyService {
	
	public List<ReplyVO> replyList(ReplyVO rvo);
	public int getTotalCount();
	
	public boolean addReply(ReplyVO vo);
	
	public int replyRemove(int nid);
}
