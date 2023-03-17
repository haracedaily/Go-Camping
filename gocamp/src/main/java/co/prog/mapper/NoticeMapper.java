package co.prog.mapper;

import java.util.List;

import co.prog.vo.NoticeVO;

public interface NoticeMapper {
	
	public List<NoticeVO> noticeList();//목록
	public int insertNotice (NoticeVO vo);//등록
	public NoticeVO selectNotice(int nid); //단건조회
	public int updateCount(int nid);//조회수
	public int modifyNotice(NoticeVO vo);//글수정
	public int deleteNotice(int nid);//글삭제

}
