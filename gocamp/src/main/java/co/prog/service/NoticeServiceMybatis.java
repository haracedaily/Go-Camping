package co.prog.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.prog.common.DataSource;
import co.prog.mapper.NoticeMapper;
import co.prog.vo.NoticeDTO;
import co.prog.vo.NoticeVO;

public class NoticeServiceMybatis implements NoticeService {

	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);

	@Override
	public List<NoticeVO> noticeList() {// 목록
		// TODO Auto-generated method stub
		return mapper.noticeList();
	}

	@Override
	public List<NoticeVO> noticeListPage(NoticeDTO dto) {// 목록
		return mapper.noticeListWithPaging(dto);
//		return mapper.noticeList();	
	}

	@Override
	public boolean addNotice(NoticeVO vo) {// 등록
		int r = mapper.insertNotice(vo);
		return r == 1;
	}

	@Override
	public NoticeVO getNotice(int boId) {// 조회
		mapper.updateCount(boId); //조회수 증가
		return mapper.selectNotice(boId);
	}

	@Override
	public int getTotalCount(String usage) {// 전체건수
		return mapper.getTotalCount(usage);
	}

	@Override
	public List<NoticeVO> boardList() { // 게시판리스트
		return mapper.boardList();
	}

	@Override
	public List<NoticeVO> boardListPage(NoticeDTO noticeDto) {// 게시판리스트
		return mapper.boardListWithPaging(noticeDto);
	}

	@Override
	public boolean noticeModify(NoticeVO vo) {// 글수정
		int r = mapper.updateNotice(vo);
		return r == 1;
	}

	@Override
	public boolean noticeRemove(int boId) {// 글삭제
		return mapper.deleteNotice(boId) == 1;
	}

}
