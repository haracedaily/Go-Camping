package co.prog.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.prog.common.DataSource;
import co.prog.mapper.NoticeMapper;
import co.prog.vo.NoticeVO;

public class NoticeServiceMybatis implements NoticeService{
	
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);

	@Override
	public List<NoticeVO> noticeListPage(int page) {//목록
		return mapper.noticeListWithPaging(page);
//		return mapper.noticeList();
		
	}

	@Override
	public boolean addNotice(NoticeVO vo) {//등록
		int r = mapper.insertNotice(vo);
		return r == 1;
	}

	@Override
	public NoticeVO getNotice(String boId) {//조회
		mapper.updateCount(boId);
		return mapper.selectNotice(boId);
	}

	@Override
	public int getTotalCount() {//전체건수
		return mapper.getTotalCount();
	}

	@Override
	public List<NoticeVO> noticeList() {
		// TODO Auto-generated method stub
		return mapper.noticeList();
	}

	@Override
	public List<NoticeVO> boardList() { //게시판리스트
		
		return mapper.boardList();
	}


	
	
	
}
