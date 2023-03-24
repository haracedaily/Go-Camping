package co.prog.mapper;

import java.util.List;

import co.prog.vo.CommentVO;
import co.prog.vo.NoticeDTO;
import co.prog.vo.NoticeVO;

public interface CommentMapper {
	public List<CommentVO> commentList();//목록
	public List<CommentVO> commentListPaging(NoticeDTO dto);
	public int getTotalCount(String usage);
	
	public int insertComment (CommentVO vo);//등록
	public int deleteComment (int cNo);
	
	public List<CommentVO> getComm(int boId);
}
