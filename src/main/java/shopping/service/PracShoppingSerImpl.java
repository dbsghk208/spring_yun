package shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shopping.bean.PracShoppingDTO;
import shopping.dao.PracShoppingDAO;

@Service
public class PracShoppingSerImpl implements PracShoppingSer {
	@Autowired
	private PracShoppingDAO pracShoppingDAO;
	
	@Override
	public List<PracShoppingDTO> getShoppingList() {
		return pracShoppingDAO.getShoppingList();
	}

	@Override
	public List<PracShoppingDTO> getShoppingList2() {
		return pracShoppingDAO.getShoppingList2();
	}
	

	

}
