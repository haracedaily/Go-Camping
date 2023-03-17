package co.prog.service;

import java.util.List;

import co.prog.vo.NoticeVO;

public class NoticeServiceMybatis implements NoticeService{

	@Override
	public List<NoticeVO> noticeList(int page) {//목록
		
		return null;
	}

	@Override
	public boolean addNotice(NoticeVO vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public NoticeVO getNotice(int nid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean noticeModify(NoticeVO vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean noticeRemove(int nid) {
		// TODO Auto-generated method stub
		return false;
	}
	
}
