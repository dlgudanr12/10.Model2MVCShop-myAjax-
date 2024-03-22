package com.model2.mvc.service.product.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductDao;
import com.model2.mvc.service.product.ProductService;

@Service("productServiceImpl")
public class ProductServiceImpl implements ProductService {
	@Autowired
	@Qualifier("productDaoImpl")
	private ProductDao productDao;

	public ProductServiceImpl() {
		System.out.println(this.getClass());
	}

	public void addProduct(Product product) throws Exception {
		productDao.insertProduct(product);
	}

	public Product getProduct(int productNo) throws Exception {
		return productDao.findProduct(productNo);
	}

	public Map<String, Object> getProductList(Search search) throws Exception {
		List<Product> list = productDao.getProductList(search);
		int totalCount = productDao.getTotalCount(search);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));

		return map;
	}

	public void updateProduct(Product product) throws Exception {
		productDao.updateProduct(product);
	}

	public void setProductDAO(ProductDao productDao) {
		this.productDao = productDao;
	}

	public void updateQuantity(Product product) throws Exception {
		productDao.updateQuantity(product);
	}

	@Override
	public String getFileName(String imagePath, MultipartFile imageFileName) throws Exception {
		String originFileName = imageFileName.getOriginalFilename();
//		UUID uuid = UUID.randomUUID();
//		String savedFileName = uuid.toString().substring(0,8) + "_" + originFileName;
//		File newFile = new File(imagePath + savedFileName);
//		imageFileName.transferTo(newFile);
//		return savedFileName;
		
//		File newFile = new File(imagePath + originFileName);
//		imageFileName.transferTo(newFile);
		FileCopyUtils.copy(imageFileName.getInputStream(), new FileOutputStream(imagePath + originFileName));
		return originFileName;
	}

	@Override
	public List<String> getFileList(String imagePath, List<MultipartFile> imageFileName) throws Exception {
		List<String> originFileName=new ArrayList<String>();
		for(MultipartFile multipartFile:imageFileName) {
			originFileName.add(multipartFile.getOriginalFilename());
			FileCopyUtils.copy(multipartFile.getInputStream(), new FileOutputStream(imagePath + multipartFile.getOriginalFilename()));
		}
		return originFileName;
	}
}
