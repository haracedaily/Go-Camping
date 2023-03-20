package co.prog.service;

import java.util.List;

import co.prog.vo.MessageVO;

public interface MessageService {
	//쪽지 리스트 화면
	public List<MessageVO> messageList();
	//쪽지 송신
	public boolean sendMessage();
	//쪽지 수신

}
