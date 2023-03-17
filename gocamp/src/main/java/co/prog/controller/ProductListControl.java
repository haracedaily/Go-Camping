package co.prog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.service.ProductService;
import co.prog.service.ProductServiceMybatis;
import co.prog.vo.ProductVO;
import co.prog.vo.SearchCondition;

public class ProductListControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		// 파라미터: cat, order
		String cat = request.getParameter("cat");
		String order = request.getParameter("order");

		cat = cat == null ? "all" : cat; // 조건없을 경우.
		order = order == null ? "price" : order; // 정렬조건이 없을 경우.

		SearchCondition con = new SearchCondition();
		con.setCat(cat);
		con.setOrder(order);

		ProductService service = new ProductServiceMybatis();
		List<ProductVO> list = service.products(con);

		request.setAttribute("cat", cat);
		request.setAttribute("order", order);

		request.setAttribute("list", list);
		
		

		return "product/productList.tiles"; // 실행할 페이지. 지정
	}

}
