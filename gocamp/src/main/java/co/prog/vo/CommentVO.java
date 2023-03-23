package co.prog.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CommentVO {

	private int coNo;
	private String userId;
	private int boId;
	private String coContent;
	private Date coDate;

}
