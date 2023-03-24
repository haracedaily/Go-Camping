package co.prog.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ReservVO {
//	create table reserv(
//			res_id number(10) constraint reserv_reserv_id_pk primary key,
//			room_id number(10) constraint reserv_room_id_fk references room(room_id),
//			user_id varchar2(30) constraint reserv_user_id_fk references users(user_id),
//			res_name varchar2(30),
//			res_tel varchar2(30),
//			res_per number(2),
//			res_sdate date,
//			res_edate date,
//			res_state varchar2(30) default '결제 전',
//			res_date date default sysdate
//			);
	private int resId;
	private int roomId;
	private String userId;
	private String resName;
	private String resTel;
	private int resPer;
	private String resSdate;
	private String resEdate;
	private String resState;
	private Date resDate;
	
	private String locaName;
	private String locaTel;
	private String locaAddr;
	private int locaId;
}
