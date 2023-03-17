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
	public List<NoticeVO> noticeList() {//목록
		return mapper.noticeList();
	}

	@Override
	public boolean addNotice(NoticeVO vo) {//등록
		int r = mapper.insertNotice(vo);
		return r == 1;
	}
	
}
