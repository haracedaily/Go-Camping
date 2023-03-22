package co.prog.service;

import java.util.List;

import co.prog.vo.MessageVO;

public interface MessageService {
	
	//쪽지 리스트 화면
	public List<MessageVO> messageList();
	//쪽지 송신
	public boolean sendMessage();
	//쪽지 리스트(회원)
	public List<MessageVO> messageListByUser(String userId);
	//쪽지 상세 조회 (읽기)
	public MessageVO getMessage(int mNum); // 회원은 쪽지 번호는 숨기고 로우넘으로 쪽지 번호 처리 생각해보기
	//쪽지 삭제
	public int messageRemove(int mNum);
	
	
}
