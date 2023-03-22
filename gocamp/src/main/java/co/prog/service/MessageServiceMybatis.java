package co.prog.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.prog.common.DataSource;
import co.prog.mapper.MessageMapper;
import co.prog.vo.MessageVO;

public class MessageServiceMybatis implements MessageService{
	
	private SqlSession sqlSeesion = DataSource.getInstance().openSession(true);
	private MessageMapper mapper = sqlSeesion.getMapper(MessageMapper.class);

	@Override
	public List<MessageVO> messageList() { //쪽지 리스트 출력
		return mapper.messageList();
	}
	
	@Override
	public boolean sendMessage() { //쪽지 보내기
		return false;
	}

	@Override
	public MessageVO getMessage(int mNum) { //쪽지 상세 조회
		//쪽지 읽으면 상태 변경..
		return mapper.selectMessage(mNum);
	}

	@Override
	public List<MessageVO> messageListByUser(String userId) {//회원별 쪽지 리트스 만들기
		// TODO Auto-generated method stub
		return mapper.messageListByUser(userId);
	}

	@Override
	public int messageRemove(int mNum) {
//		return mapper.messageRemove(mNum);
		return 0;
	}

	
}
