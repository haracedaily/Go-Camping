package co.prog.vo;

import lombok.Data;

@Data
public class UsersVO {

//	USER_ID   NOT NULL VARCHAR2(30)  
//	USER_NAME NOT NULL VARCHAR2(30)  
//	USER_PW   NOT NULL VARCHAR2(30)  
//	USER_ADDR NOT NULL VARCHAR2(120) 
//	USER_TEL  NOT NULL VARCHAR2(30)  
//	SIN_NUM   NOT NULL VARCHAR2(30)  
//	NICKNAME  NOT NULL VARCHAR2(30)  
	
	String userId; //id
	String userName; //이름
	String userPw; //비밀번호
	String nickname; //닉네임
	String sinNum; //주민등록번호
	String userTel; //연락처
	String userAddr; //주소
	String joinDate; //가입일
	
	
	
}
