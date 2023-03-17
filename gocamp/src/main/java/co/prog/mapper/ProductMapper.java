package co.prog.mapper;

import java.util.List;

import co.prog.vo.ProductVO;
import co.prog.vo.SearchCondition;

public interface ProductMapper {

	List<ProductVO> productList(SearchCondition con);



}
