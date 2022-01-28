package shopping.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import shopping.bean.PracShoppingDTO;

@Repository
@Transactional
public class PracShoppingMybatis implements PracShoppingDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<PracShoppingDTO> getShoppingList() {
		return sqlSession.selectList("shoppingSQL.getShoppingList");
	}

	@Override
	public List<PracShoppingDTO> getShoppingList2() {
		return sqlSession.selectList("shoppingSQL.getShoppingList2");
	}

	
	
}
