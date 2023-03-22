package co.prog.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;


import co.prog.common.DataSource;
import co.prog.mapper.ProductMapper;
import co.prog.vo.ReplyVO;
import co.prog.vo.ProductVO;
import co.prog.vo.SearchCondition;

public class ProductServiceMybatis implements ProductService {

	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);

	@Override
	public List<ProductVO> products(SearchCondition con) {
		return mapper.productList(con);
	}

	@Override
	public List<ProductVO> productList(int page) {
		// TODO Auto-generated method stub
		return mapper.productListWithPaging(page);
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return mapper.getTotalCount();
	}

	@Override
	public ProductVO getProductInfo(String productCode) {
		// TODO Auto-generated method stub
		return mapper.selectProduct(productCode);
	}



	

}
	
