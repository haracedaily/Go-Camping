package co.prog.mapper;

import java.util.List;

import co.prog.vo.MessageVO;

public interface MessageMapper {
	//메세지 리스트
	public List<MessageVO> messageList(); //컬렉션 타입으로 변환 => MessagVO 생성하기
}
