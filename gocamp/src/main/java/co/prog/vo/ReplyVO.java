package co.prog.vo;

import java.util.Date;

import lombok.Data;
@Data
public class ReplyVO {
	private String sku;
	private String userId;
	private int repNum;
	private String repCon;
	private Date repDate;
	private	String userName;
	
	private String page;
}
