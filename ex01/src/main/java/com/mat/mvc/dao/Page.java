package com.mat.mvc.dao;

public class Page {
	private int num;
	private int count;
	private int postNum = 10;
	private int pageNum;
	private int displayPost;
	private int pageNumCnt = 10;
	private int endPageNum;
	private int startPageNum;
	private boolean prev;
	private boolean next;
	private String searchTypeKeyword;

	public String getSearchTypeKeyword() {
		return searchTypeKeyword;
	}

	public void setSearchTypeKeyword(String searchType, String keyword) {
		if (searchType.equals("") || keyword.equals("")) {
			searchTypeKeyword = "";
		} else {
			searchTypeKeyword = "&amp;searchType=" + searchType + "&amp;keyword" + keyword;
		}
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
		dataCalc();
	}

	private void dataCalc() {
		endPageNum = (int) (Math.ceil((double) num / (double) pageNumCnt) * pageNumCnt);
		startPageNum = endPageNum - (pageNumCnt - 1);

		int endPageNum_tmp = (int) Math.ceil((double) count / postNum);

		if (endPageNum > endPageNum_tmp) {
			endPageNum = endPageNum_tmp;
		}

		prev = startPageNum == 1 ? false : true; // 이전 링크 표시 여부
		next = endPageNum * postNum < count ? true : false; // 다음 링크 표시 여부
		
		displayPost = (num - 1) * postNum;
	}

	public int getPostNum() {
		return postNum;
	}

	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getDisplayPost() {
		return displayPost;
	}

	public void setDisplayPost(int displayPost) {
		this.displayPost = displayPost;
	}

	public int getPageNumCnt() {
		return pageNumCnt;
	}

	public void setPageNumCnt(int pageNumCnt) {
		this.pageNumCnt = pageNumCnt;
	}

	public int getEndPageNum() {
		return endPageNum;
	}

	public void setEndPageNum(int endPageNum) {
		this.endPageNum = endPageNum;
	}

	public int getStartPageNum() {
		return startPageNum;
	}

	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}

	public boolean getPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean getNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

}
