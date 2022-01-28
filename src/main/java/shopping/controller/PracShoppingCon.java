package shopping.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import shopping.bean.PracShoppingDTO;
import shopping.service.PracShoppingSer;

@Controller
public class PracShoppingCon {
	@Autowired
	private PracShoppingSer pracShoppingSer;

	@GetMapping("/shopping")
	public String shopping(Model model) {
		model.addAttribute("display" , "/shopping/pracShopping.jsp");
		return "/index";
	}
	
	@RequestMapping(value="/shopping/beanNTea", method=RequestMethod.GET)
	public String beanNTea(Model model) {
		model.addAttribute("display","/shopping/beanNTea.jsp");
		return "/index";
	}
	
	//pracShopping.jsp  쇼핑페이지 쇼핑목록 (에이작스)
	@PostMapping(value="/shopping/getShoppingList")
	@ResponseBody
	public List<PracShoppingDTO> getShoppingList() {
		return pracShoppingSer.getShoppingList();
		
	}
	
	//pracShopping.jsp 쇼핑페이지 상품목록(에이작스)
	@PostMapping(value="/shopping/getShoppingList2")
	@ResponseBody
	public List<PracShoppingDTO> getShoppingList2() {
		return pracShoppingSer.getShoppingList2();
	}
	
	
	
}
