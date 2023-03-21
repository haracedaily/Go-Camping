package co.prog.mapper;

import java.util.List;

import co.prog.vo.PcomVO;
import co.prog.vo.ProductVO;
import co.prog.vo.SearchCondition;

public interface ProductMapper {

	List<ProductVO> productList(SearchCondition con);

	List<ProductVO> productListWithPaging(int page);

	int getTotalCount();
	
	ProductVO selectProduct(String productCode);

	List<PcomVO> replyList(PcomVO rep);
	
	int registReply(PcomVO reply);
	
}
