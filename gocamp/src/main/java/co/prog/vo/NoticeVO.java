package co.prog.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class NoticeVO {
	private int boId;
	private String userId;
	private String boTitle;
	private String boCont;
	private Date boDate;
	private String boImg;
	private int boCount;
	private String rn;
	private String usage;

	private String userName; // 이름
	private String userPw; // 비밀번호
	private String userAddr; // 주소
	private String userTel; // 연락처
	private String sinNum; // 주민등록번호
	private String nickname; // 닉네임

	private int cNo;
	private String cContent;
	private Date cDate;
//	BO_ID    NOT NULL VARCHAR2(30)   
//	USER_ID           VARCHAR2(30)   
//	BO_TITLE          VARCHAR2(120)  
//	BO_CONT           VARCHAR2(3000) 
//	BO_DATE           DATE           
//	BO_IMG            VARCHAR2(30)   
//	BO_COUNT          NUMBER(4)      
}
