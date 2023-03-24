package co.prog.service;

import java.util.List;

import co.prog.vo.MessageVO;
import co.prog.vo.UsersVO;

public interface MessageService {
	
	//쪽지 리스트 화면
	public List<MessageVO> messageList();
	//쪽지 송신
	public boolean sendMessage();
	//쪽지 리스트(회원)
	public List<MessageVO> messageListByUser(String userId);
	//쪽지 상세 조회 (읽기)
	public MessageVO getMessage(int mNum);
	//쪽지 상세 조회 (읽기- 관리자)
	public MessageVO getMessageM(int mNum);
	//쪽지 삭제
	public int messageRemove(int mNum);
	//쪽지 보내기 - insert 관리자
	public boolean addMessage(MessageVO vo);
	//쪽지 보내기 - insert 유저
	public boolean addMessageUser(MessageVO vo);
	//쪽지 수신 여부 확인
	public boolean updateMessageCheck(int mNum);
	//쪽지 수신 여부-관리자쪽 업데이트
	public boolean updateMessageCheckM(int mNum);
}
