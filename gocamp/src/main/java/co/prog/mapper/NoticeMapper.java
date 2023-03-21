package co.prog.mapper;

import java.util.List;

import co.prog.vo.NoticeDTO;
import co.prog.vo.NoticeVO;

public interface NoticeMapper {
	
	public List<NoticeVO> noticeList();//목록
	public List<NoticeVO> noticeListWithPaging(NoticeDTO dto);
	public int insertNotice (NoticeVO vo);//등록
	public NoticeVO selectNotice(int boId); //단건조회
	public int updateCount(int boId);//조회수
	public int getTotalCount(String usage); //전체건수
	public int updateNotice(NoticeVO vo);//글수정
	public int deleteNotice(int boId);//글삭제
	public List<NoticeVO> boardList();//게시판리스트
	public List<NoticeVO> boardListWithPaging(NoticeDTO noticeDto);
	

}
