package co.prog.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class ProductVO {
	String sku;
	String cateId;
	String prodType;
	String prodName;
	int prodQuantity;
	int prodPrice;
	int prodSalePrice;
	String prodDes;
	String prodImga;
	String prodImgb;
	String prodImgc;
	String prodImgd;
	Date prodDate;

}

//sku varchar2(30) constraint prod_sku_pk primary key,
//cate_id varchar2(30) constraint prod_cate_id references category(cate_id),
//prod_type varchar2(30) not null,
//prod_name varchar2(90) not null,
//prod_quantity number(4) not null,
//prod_price number not null,
//prod_sale_price number,
//prod_des varchar2(3000),
//prod_imga varchar2(90),
//prod_imgb varchar2(90),
//prod_imgc varchar2(90),
//prod_imgd varchar2(90),
//prod_date date default sysdate