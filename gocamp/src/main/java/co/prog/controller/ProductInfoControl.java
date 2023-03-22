package co.prog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.service.ProductService;
import co.prog.service.ProductServiceMybatis;
import co.prog.service.ReplyService;
import co.prog.service.ReplyServiceMybatis;
import co.prog.vo.PageDTO;
import co.prog.vo.ProductVO;
import co.prog.vo.ReplyVO;

public class ProductInfoControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response){
		String name = request.getParameter("code");
		
		ProductService service = new ProductServiceMybatis();
		ProductVO vo= service.getProductInfo(name);
		
		System.out.println(vo);
		request.setAttribute("vo", vo);
		
		ReplyVO rep = new ReplyVO();
		rep.setSku(name);
		
		String page = request.getParameter("page");
		System.out.println(page);
		if (page == null) {
			page = "1";
		}
		// 글목록. mybatis활용 목록.
		ReplyService rservice = new ReplyServiceMybatis();
		ReplyVO rvo= new ReplyVO();
		rvo.setSku(vo.getSku());
		rvo.setPage(page);
		
		List<ReplyVO> list = rservice.replyList(rvo); // 공지사항 목록.
		int total = rservice.getTotalCount();
		request.setAttribute("list", list);
		request.setAttribute("page", new PageDTO(Integer.parseInt(page), total));
		
		
		
		return "product/productInfo.tiles"; 
	}

}
