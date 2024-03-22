package com.model2.mvc.common;

import java.util.List;


public class SearchDTO {
	private Search search;
	
	private int currentPage;
	private String searchCondition;
	private String searchKeyword;
	private int pageSize;
	
	private String searchOrderBy;
	private int searchPriceLowerLimit;
	private int searchPriceUpperLimit;
	private List<String> searchTranCodeOn;
	private List<Integer> listTranCode;
	
	private String userId;
	
	public SearchDTO() {
		search=new Search();
	}

	public Search getSearch() {
		search.setCurrentPage(currentPage);
		search.setSearchCondition(searchCondition);
		search.setSearchKeyword(searchKeyword);
		search.setPageSize(pageSize);
		
		search.setSearchOrderBy(searchOrderBy);
		search.setSearchPriceLowerLimit(searchPriceLowerLimit);
		search.setSearchPriceUpperLimit(searchPriceUpperLimit);
		search.setSearchTranCodeOn(searchTranCodeOn);
		search.setListTranCode(listTranCode);
		
		return search;
	}

	public void setSearch(Search search) {
		this.search = search;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public String getSearchOrderBy() {
		return searchOrderBy;
	}

	public void setSearchOrderBy(String searchOrderBy) {
		this.searchOrderBy = searchOrderBy;
	}

	public int getSearchPriceLowerLimit() {
		return searchPriceLowerLimit;
	}

	public void setSearchPriceLowerLimit(int searchPriceLowerLimit) {
		this.searchPriceLowerLimit = searchPriceLowerLimit;
	}

	public int getSearchPriceUpperLimit() {
		return searchPriceUpperLimit;
	}

	public void setSearchPriceUpperLimit(int searchPriceUpperLimit) {
		this.searchPriceUpperLimit = searchPriceUpperLimit;
	}

	public List<String> getSearchTranCodeOn() {
		return searchTranCodeOn;
	}

	public void setSearchTranCodeOn(List<String> searchTranCodeOn) {
		this.searchTranCodeOn = searchTranCodeOn;
	}

	public List<Integer> getListTranCode() {
		return listTranCode;
	}

	public void setListTranCode(List<Integer> listTranCode) {
		this.listTranCode = listTranCode;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}
