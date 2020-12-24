package com.exam.domain;


//VO(Value Object): 데이터베이스의 특정 테이블 매핑 용도
//DTO(Data Transfer Object) : 데이터베이스와 무관하게 데이터 전송 용도

public class PageDto {

	private int totalCount;	//전체 글갯수
	private int pageCount;	//총 필요한 페이지 수(마지막 페이지 번호
	private int pageBlock;	//한 페이지당 표시되는 페이지 수	
	private int startPage;	//페이지블록 내에서 시작페이지 번호 
	private int endPage;	//페이지블록 내에서 끝페이지 번호
	private int searchCount;
	
	public PageDto() {
		// TODO Auto-generated constructor stub
	}
	
	
	public int getSearchCount() {
		return searchCount;
	}


	public void setSearchCount(int searchCount) {
		this.searchCount = searchCount;
	}


	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getPageBlock() {
		return pageBlock;
	}
	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "PageDto [totalCount=" + totalCount + ", pageCount=" + pageCount + ", pageBlock=" + pageBlock
				+ ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}
	
	
}
