package com.model2.mvc.dto;

import java.util.ArrayList;
import java.util.List;

import com.model2.mvc.common.Search;


public class SearchDto {
	private Search search;
	
	private int currentPage;
	private String searchCondition;
	private String searchKeyword;
	private int pageSize;
	
	private String searchOrderBy;
	private int searchPriceLowerLimit;
	private int searchPriceUpperLimit;
	private String searchTranCodeOn0;
	private String searchTranCodeOn1;
	private String searchTranCodeOn2;
	private String searchTranCodeOn3;
	private List<String> searchTranCodeOn;
	
	private String userId;
	
	public SearchDto() {
		search=new Search();
		searchTranCodeOn=new ArrayList<String>();
	}

	public Search getSearch() {
		search.setCurrentPage(currentPage);
		search.setSearchCondition(searchCondition);
		search.setSearchKeyword(searchKeyword);
		search.setPageSize(pageSize);
		
		search.setSearchOrderBy(searchOrderBy);
		search.setSearchPriceLowerLimit(searchPriceLowerLimit);
		search.setSearchPriceUpperLimit(searchPriceUpperLimit);
		
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setSearchTranCodeOn0(String searchTranCodeOn0) {
		this.searchTranCodeOn0 = searchTranCodeOn0;
	}

	public void setSearchTranCodeOn1(String searchTranCodeOn1) {
		this.searchTranCodeOn1 = searchTranCodeOn1;
	}

	public void setSearchTranCodeOn2(String searchTranCodeOn2) {
		this.searchTranCodeOn2 = searchTranCodeOn2;
	}

	public void setSearchTranCodeOn3(String searchTranCodeOn3) {
		this.searchTranCodeOn3 = searchTranCodeOn3;
	}

	public List<String> getSearchTranCodeOn() {
		searchTranCodeOn.add(searchTranCodeOn0);
		searchTranCodeOn.add(searchTranCodeOn1);
		searchTranCodeOn.add(searchTranCodeOn2);
		searchTranCodeOn.add(searchTranCodeOn3);
		return searchTranCodeOn;
	}

}
