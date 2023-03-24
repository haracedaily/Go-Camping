package co.prog.service;

import java.util.List;

import co.prog.vo.CommentVO;
import co.prog.vo.NoticeDTO;
import co.prog.vo.NoticeVO;

public interface CommentService {
	public List<CommentVO> commentList();
	public List<CommentVO> commentListPage(NoticeDTO dto);
	public int getTotalCount (String usage);
	
	public boolean addComment(CommentVO vo);//댓글등록
	public boolean commentRemove(int cNo); //삭제
	
	public List<CommentVO> getComm(int boId);
	
}
