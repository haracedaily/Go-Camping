package co.prog.mapper;

import java.util.List;

import co.prog.vo.MessageVO;

public interface MessageMapper {
	//쪽지 리스트 (관리자)
	public List<MessageVO> messageList(); //컬렉션 타입으로 변환 => MessagVO 생성하기
	//쪽지 단건 조회(회원)
	public MessageVO selectMessage(int mNum);
	//쪽지 단건 조회(관리자)
	public MessageVO selectMessageM(int mNum);
	//회원 쪽지 리트스
	public List<MessageVO>  messageListByUser(String userId);
	//쪽지 열람 상태 변경
	public int updateCheckUser(int mNum);
	//회원 쪽지 열람 시 관리자 페이지 상태 변경 
	public int updateCheckM(int mNum);
	//쪽지 삭제(회원)
	public int messageRemove(int mNum);
	//쪽지 삭제(관리자)
	public int messageRemoveManager(int mNum);
	//쪽지 보내기(insert 관리자)
	public int insertMessage(MessageVO vo);
	//쪽지 보내기(insert 유저)
	public int insertMessageUser(MessageVO vo);
}
