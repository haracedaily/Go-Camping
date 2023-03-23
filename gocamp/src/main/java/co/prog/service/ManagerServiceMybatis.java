package co.prog.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.prog.common.DataSource;
import co.prog.mapper.ManagerMapper;
import co.prog.vo.UsersVO;

public class ManagerServiceMybatis implements ManagerService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private ManagerMapper mapper = sqlSession.getMapper(ManagerMapper.class);

	@Override
	public List<UsersVO> userList() {
		return mapper.getUsers();
	}

}
