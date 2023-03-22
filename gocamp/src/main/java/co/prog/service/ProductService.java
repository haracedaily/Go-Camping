package co.prog.service;

import java.util.List;

import co.prog.vo.ReplyVO;
import co.prog.vo.ProductVO;
import co.prog.vo.SearchCondition;

public interface ProductService {
	public List<ProductVO> products(SearchCondition con);
	
	
	public List<ProductVO> productList(int page);
	
	public int getTotalCount();
	
	public ProductVO getProductInfo(String ProductCode);
	




	
}
