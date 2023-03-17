package co.prog.service;

import java.util.List;

import co.prog.vo.NoticeVO;

public interface NoticeService {
	
	public List<NoticeVO> noticeList(int page);//목록
	public boolean addNotice (NoticeVO vo);//등록
	public NoticeVO getNotice (int nid);//단건조회
	public boolean noticeModify(NoticeVO vo);//수정
	public boolean noticeRemove(int nid);//삭제
	
}
