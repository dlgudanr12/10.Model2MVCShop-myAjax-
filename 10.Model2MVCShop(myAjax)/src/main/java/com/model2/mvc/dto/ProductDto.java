package com.model2.mvc.dto;

import java.sql.Date;
import java.util.Arrays;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.service.domain.Product;

public class ProductDto {
	
	private Product product;
	
	private int prodNo;
	private String prodName;
	private String prodDetail;
	private String manuDate;
	private int price;
	private String fileName;
	private Date regDate;
	private int prodQuantity;
	private List<String> fileList;
	
	private List<MultipartFile> imageFileName;

	public ProductDto() {
		product=new Product();
	}

	public Product getProduct() {
		product.setProdNo(prodNo);
		product.setProdName(prodName);
		product.setProdDetail(prodDetail);
		product.setManuDate(manuDate);
		product.setPrice(price);
		product.setFileName(fileName);
		product.setRegDate(regDate);
		product.setProdQuantity(prodQuantity);
		product.setFileList(fileList);
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		fileList = Arrays.asList(fileName.split(", "));
		System.out.println("fileList : " + fileList.toString());
		this.fileName = fileName;
	}

	public String getManuDate() {
		return manuDate;
	}

	public void setManuDate(String manuDate) {
		this.manuDate = manuDate.replaceAll("-", "");
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getProdDetail() {
		return prodDetail;
	}

	public void setProdDetail(String prodDetail) {
		this.prodDetail = prodDetail;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getProdQuantity() {
		return prodQuantity;
	}

	public void setProdQuantity(int prodQuantity) {
		this.prodQuantity = prodQuantity;
	}

	public List<String> getFileList() {
		return fileList;
	}

	public void setFileList(List<String> fileList) {
		fileName = fileList.toString().substring(fileList.toString().indexOf("[") + 1,
				fileList.toString().lastIndexOf("]"));
		System.out.println("fileName : " + fileName);
		this.fileList = fileList;
	}

	public List<MultipartFile> getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(List<MultipartFile> imageFileName) {
		this.imageFileName = imageFileName;
	}

	// Override
	public String toString() {
		return "ProductVO : [fileName]" + fileName + "[manuDate]" + manuDate + "[price]" + price + "[prodDetail]"
				+ prodDetail + "[prodName]" + prodName + "[prodNo]" + prodNo;
	}
}