package co.prog.mapper;

import java.util.List;

import co.prog.vo.NoticeVO;

public interface NoticeMapper {
	
	public List<NoticeVO> noticeList();//목록
	public List<NoticeVO> noticeListWithPaging(int page);
	public int insertNotice (NoticeVO vo);//등록
	public NoticeVO selectNotice(String boId); //단건조회
	public int updateCount(String boId);//조회수
	public int getTotalCount(); //전체건수
	public int modifyNotice(NoticeVO vo);//글수정
	public int deleteNotice(int nid);//글삭제
	public List<NoticeVO> boardList();//게시판리스트

}
