package co.prog.vo;

import lombok.Data;

@Data
public class MessageVO {
//	user_id varchar2(30) constraint message_user_id_fk references users(user_id),
//	m_num number(10) not null,
//	m_content varchar2(900),
//	m_date date default sysdate,
//	read_date date,
//	m_title varchar2(100),
//	m_check varchar2(30)
	
	int mNum; // 쪽지 아이디
	String userId; // 회원 아이디
	String mContent; // 쪽지 내용
	String mDate; // 보낸 날짜
	String readDate; // 읽은 날짜
	String mTitle; // 쪽지 제목 
	String mCheck; // 읽음 여부
}
