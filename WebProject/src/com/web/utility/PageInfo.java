package com.web.utility;

import java.io.Serializable;

public class PageInfo implements Serializable {
	private static final long serialVersionUID = 551606005497617299L;
	
	private int showCount = 50;
	private int totalPage;
	private int totalResult;
	private int currentPage;
	private int currentResult;

	private String sortField;
	private String order;

	public int getShowCount() {
		return showCount;
	}

	public void setShowCount(int showCount) {
		this.showCount = showCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalResult() {
		return totalResult;
	}

	public void setTotalResult(int totalResult) {
		this.totalResult = totalResult;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public void setCurrentPageNResult(int currentPage){
		this.currentPage = currentPage;
		this.currentResult = (currentPage-1)*this.showCount;
	}
	public int getCurrentResult() {
		return currentResult;
	}

	public void setCurrentResult(int currentResult) {
		this.currentResult = currentResult;
	}
	
	public int getTotalPages(){
		if(this.totalPage != 0){
			return totalPage;
		}else if(this.totalResult != 0){
			if(this.totalResult%this.showCount == 0){
				return this.totalResult/this.showCount;
			}else{
				return this.totalResult/this.showCount + 1;
			}
		}else{
			return 1;
		}
	}

	public String getSortField() {
		return sortField;
	}

	public void setSortField(String sortField) {
		this.sortField = sortField;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

}
