package co.prog.vo;

import lombok.Data;

@Data
public class LocationVO {
	private int locaId;
	private String locaName;
	private String locaTel;
	private String locaAddr;
	private String locaExp;
	private String locaImg;
	
	
private String addrs;
private String choice;
	
	
	
//	create table loca(
//			loca_id number(10) constraint loca_loca_id_pk primary key,
//			loca_name varchar2(90) not null,
//			loca_tel varchar2(90),
//			loca_addr varchar2(900),
//			loca_exp varchar2(3000),
//			loca_img varchar2(300)
//			);

}
