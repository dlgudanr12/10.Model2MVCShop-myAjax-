package com.model2.mvc.service.product;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;

public interface ProductService {

	public void addProduct(Product product) throws Exception;

	public Product getProduct(int productNo) throws Exception;

	public Map<String, Object> getProductList(Search search) throws Exception;

	public void updateProduct(Product product) throws Exception;

	public void updateQuantity(Product product) throws Exception;

	public String getFileName(String imagePath, MultipartFile imageFileName) throws Exception;
	
	public List<String> getFileList(String imagePath, List<MultipartFile> imageFileName) throws Exception;
}
