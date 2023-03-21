package co.prog.vo;

import lombok.Data;

@Data
public class NoticeDTO {
	// mapper 에 파라미터 타입: NoticeDTO
	private int page;
	private String usage;// 게시판종류
}
