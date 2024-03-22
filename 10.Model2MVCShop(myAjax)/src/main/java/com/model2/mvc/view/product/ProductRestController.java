package com.model2.mvc.view.product;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@RestController("productRestController")
@RequestMapping("/rest/product/*")
public class ProductRestController {

	@Autowired
	@Qualifier("productServiceImpl")
	ProductService productService;

	@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;

	public ProductRestController() {
		System.out.println(":: ProductController default Contrctor call : " + this.getClass());
	}

//	@RequestMapping("/addProduct.do")
	@RequestMapping(value = "/json/addProduct", method = RequestMethod.POST)
	public Map<String,Object> addProduct(@RequestBody Product product) throws Exception {

		System.out.println("\n:: ==> addProduct().POST start......]");

		productService.addProduct(product);
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("product", product);

		System.out.println("[addProduct().POST end......]\n");

//		return "forward:/product/addProduct.jsp";
		return map;
	}

	@RequestMapping(value = "/json/getProduct/{prodNo}/{menu}", method = RequestMethod.GET)
	public Map<String,Object> getProduct(@ModelAttribute("product") Product product, @PathVariable String menu,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println("\n:: ==> getProduct().GET start......]");
		System.out.println("ProductController.getProduct.manu : " + menu);

		String resultPath = "";
		String history = "";
		String cookieNewValue;
		Map<String,Object> map=new HashMap<String,Object>();
		product = productService.getProduct(product.getProdNo());
		map.put("product", product);

//		for (Cookie cookie : request.getCookies()) {
//			if (!cookie.getName().equals("history")) {
//				cookie = new Cookie("history", "");
//				cookie.setPath("/");
//				response.addCookie(cookie);
//			}
//		}
//
//		history = product.getProdNo() + ":" + product.getProdName().replaceAll(" ", "_") + "/";
//		for (Cookie cookie : request.getCookies()) {
//			System.out.println(cookie.getName());
//			if (cookie.getName().equals("history")) {
//				System.out.println("request.getCookies() : " + cookie.getValue());
//				cookieNewValue = cookie.getValue().replaceAll(history, "");
//				history += cookieNewValue;
//				System.out.println("history= " + history);
//				cookie.setValue(history);
//				cookie.setPath("/");
//				response.addCookie(cookie);
//			}
//		}
		
//		Cookie cookie = new Cookie("history", history);
//		cookie.setPath("/");
//		response.addCookie(cookie);
		
		
		map.put("menu", menu);

		resultPath = "forward:/product/getProduct.jsp";
		if (menu != null) {
			if (menu.equals("manage")) {
//				resultPath = "forward:/product/notUpdateProduct.jsp"; //¥ı ¿ÃªÛ æ»æ∏
				resultPath = "forward:/product/updateProduct.jsp";
			}
		}

		System.out.println("[getProduct().GET end......]\n");
//		return resultPath;
		return map;
	}

	@RequestMapping(value = "json/listProduct/{menu}")
	public Map<String, Object> listProduct(@RequestBody Search search, @PathVariable String menu)
			throws Exception {

		System.out.println("\n:: ==> listProduct().GET/POST start......]");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		search.setPageSize(pageSize);

		Map<String, Object> map = productService.getProductList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println("listProduct.resultPage ::" + resultPage);

//		model.addAttribute("list", map.get("list"));
		map.put("resultPage", resultPage);
		map.put("search", search);

		map.put("menu", menu);

		System.out.println("[listProduct().GET/POST end......]\n");

//		return "forward:/product/listProduct.jsp";
		return map;
	}

	@RequestMapping(value = "/json/updateProduct", method = RequestMethod.POST)
	public Map<String, Object> updateProduct(@RequestBody Product product) throws Exception {

		System.out.println("\n:: ==> updateProduct().POST start......]");

		productService.updateProduct(product);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("product", productService.getProduct(product.getProdNo()));

		System.out.println("[updateProduct().POST end......]\n");

//		return "redirect:getProduct/" + product.getProdNo() + "/manage_search";
		return map;
	}

//	@RequestMapping("/updateProductView.do")
//	public String updateProductView(@ModelAttribute("product") Product product, Model model) throws Exception {
//
//		System.out.println("\n:: ==> updateProductView() start......]");
//
//		model.addAttribute("product", productService.getProduct(product.getProdNo()));
//
//		System.out.println("[updateProductView() end......]\n");
//
//		return "forward:/product/updateProduct.jsp";
//	}

//	@RequestMapping("/updateQuantity.do")
//	public String updateQuantity(@ModelAttribute("product") Product product, @ModelAttribute("search") Search search,
//			Model model) throws Exception {
//
//		System.out.println("\n:: ==> updateQuantity() start......]");
//
//		productService.updateQuantity(product);
//
//		model.addAttribute("search", search);
//
//		System.out.println("[updateQuantity() end......]\n");
//
//		return "forward:/listProduct.do?menu=manage";
//	}

}
