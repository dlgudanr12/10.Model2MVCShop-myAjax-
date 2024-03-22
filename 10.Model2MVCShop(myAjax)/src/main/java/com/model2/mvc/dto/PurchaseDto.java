package com.model2.mvc.dto;

import java.sql.Date;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;

public class PurchaseDto {
	
	private Purchase purchase;
	private int tranNo;
	
	private Product purchaseProd;
	private int prodNo;
	
	private User buyer;
	private String buyerId;
	
	private String paymentOption;
	private String receiverName;
	private String receiverPhone;
	private String divyAddr;
	private String divyRequest;
	private String tranCode;
	private Date orderDate;
	private String divyDate;
	private int tranQuantity;
	
	
	public PurchaseDto() {
		purchase=new Purchase();
		purchaseProd=new Product();
		buyer=new User();
	}

	public Purchase getPurchase() {
		if(tranNo!=0) purchase.setTranNo(tranNo);
		if(paymentOption!=null) purchase.setPaymentOption(paymentOption);
		if(receiverName!=null)purchase.setReceiverName(receiverName);
		if(receiverPhone!=null) purchase.setReceiverPhone(receiverPhone);
		if(divyAddr!=null) purchase.setDivyAddr(divyAddr);
		if(divyRequest!=null) purchase.setDivyRequest(divyRequest);
		if(tranCode!=null) purchase.setTranCode(tranCode);
		if(orderDate!=null) purchase.setOrderDate(orderDate);
		if(divyDate!=null) purchase.setDivyDate(divyDate);
		if(tranQuantity!=0) purchase.setTranQuantity(tranQuantity);
		return purchase;
	}

	public void setPurchase(Purchase purchase) {
		this.purchase = purchase;
	}

	public int getTranNo() {
		return tranNo;
	}

	public void setTranNo(int tranNo) {
		this.tranNo = tranNo;
	}

	public Product getPurchaseProd() {
		if(prodNo!=0) purchaseProd.setProdNo(prodNo);
		return purchaseProd;
	}

	public void setPurchaseProd(Product purchaseProd) {
		this.purchaseProd = purchaseProd;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public User getBuyer() {
		if(buyerId!=null) buyer.setUserId(buyerId);
		return buyer;
	}

	public void setBuyer(User buyer) {
		this.buyer = buyer;
	}

	public String getBuyerId() {
		return buyerId;
	}

	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}

	public String getPaymentOption() {
		return paymentOption;
	}

	public void setPaymentOption(String paymentOption) {
		this.paymentOption = paymentOption;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}

	public String getReceiverPhone() {
		return receiverPhone;
	}

	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}

	public String getDivyAddr() {
		return divyAddr;
	}

	public void setDivyAddr(String divyAddr) {
		this.divyAddr = divyAddr;
	}

	public String getDivyRequest() {
		return divyRequest;
	}

	public void setDivyRequest(String divyRequest) {
		this.divyRequest = divyRequest;
	}

	public String getTranCode() {
		return tranCode;
	}

	public void setTranCode(String tranCode) {
		this.tranCode = tranCode;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getDivyDate() {
		return divyDate;
	}

	public void setDivyDate(String divyDate) {
		this.divyDate = divyDate;
	}

	public int getTranQuantity() {
		return tranQuantity;
	}

	public void setTranQuantity(int tranQuantity) {
		this.tranQuantity = tranQuantity;
	}

}
