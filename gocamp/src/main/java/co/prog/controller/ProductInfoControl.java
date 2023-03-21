package co.prog.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.service.ProductService;
import co.prog.service.ProductServiceMybatis;
import co.prog.vo.PcomVO;
import co.prog.vo.ProductVO;

public class ProductInfoControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response){
		String name = request.getParameter("code");
		
		ProductService service = new ProductServiceMybatis();
		ProductVO vo= service.getProductInfo(name);
		
		System.out.println(vo);
		request.setAttribute("vo", vo);
		
		PcomVO rep = new PcomVO();
		rep.setSku(name);
		List<PcomVO> list = service.replyList(rep);
		request.setAttribute("list", list);
		return "product/productInfo.tiles"; 
	}

}
