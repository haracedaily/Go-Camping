package co.prog.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.prog.common.DataSource;
import co.prog.mapper.MessageMapper;
import co.prog.vo.MessageVO;
import co.prog.vo.UsersVO;

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
		return mapper.selectMessage(mNum);
	}

	@Override
	public MessageVO getMessageM(int mNum) { //쪽지 상세 조회(관리자)
		return mapper.selectMessageM(mNum);
	}
	
	@Override
	public List<MessageVO> messageListByUser(String userId) {//회원별 쪽지 리트스 만들기
		return mapper.messageListByUser(userId);
	}

	@Override
	public int messageRemove(int mNum) { //쪽지 삭제(회원)
		return mapper.messageRemove(mNum);
	}

	@Override
	public int messageRemoveManager(int mNUm) { //관리자 쪽지 삭제
		return mapper.messageRemoveManager(mNUm);
	}
	
	@Override
	public boolean addMessage(MessageVO vo) { //쪽지 보내기 - 관리자insert
		int r = mapper.insertMessage(vo);
		return r == 1;
	}

	@Override
	public boolean addMessageUser(MessageVO vo) {//쪽지 보내기 - 회원insert
		int r = mapper.insertMessageUser(vo);
		return r == 1;
	}

	@Override
	public boolean updateMessageCheck(int mNum) { //쪽지 열람 후 상태 변경
		return mapper.updateCheckUser(mNum)==1;
	}

	@Override
	public boolean updateMessageCheckM(int mNum) {//회원 쪽지 열람 시 관리자 페이지 상태 변경
		return mapper.updateCheckM(mNum)==1;
	}



	
	

	
}
