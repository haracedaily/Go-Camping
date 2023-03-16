package co.prog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.service.ProductService;
import co.prog.service.ProductServiceMybatis;
import co.prog.vo.ProductVO;

public class ProductListControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ProductService service = new ProductServiceMybatis();
		List<ProductVO> list = service.products();
		System.out.println(list);
		
		request.setAttribute("list", list); 
	
		return "product/productList.tiles";  //실행할 페이지. 지정
	}

}

