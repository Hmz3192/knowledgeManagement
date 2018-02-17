package com.lucene.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FullTextSearchParams {

	//�����ؼ���
	private String queryWord = "";

	//ָ�������򣬲���Ĭ�ϵĹ�ϵ��OR
	private List<String> assignmentFields = new ArrayList<String>();
	/**
	 * ָ����������������֮��Ĺ�ϵ
	 * Map<String,String> ��һ��String�����������磺name
	 *                    �ڶ���String�ǹ�ϵ��д�������ߣ�OR �룺AND
	 */
	private List<Map<String,String>> assignFields = new ArrayList<Map<String,String>>();

	//��ʾ��
	private String[] viewFields;

	//�Ƿ����
	private Boolean isHighlight = true;

	//������
	private String[] highlightFields;

	//����ǰ׺
	private String preHighlight = "<em class=\"highlight\">";

	//������׺
	private String postHighlight = "</em>";

	//������ String:��Ҫ�����������Boolean��true ���� false ����
	private Map<String,Boolean> sortField = new HashMap<String,Boolean>();

	//������
	private Map<String,String> filterField = new HashMap<String,String>();

	//��ʼ��
	private int startNums = 0;

	//һҳ��ʾ������
	private int pageCount = 15;

	//�Ƿ�ͳ��
	private Boolean isFacet = false;

	//ͳ����
	private String[] facetFields;

	//���صĽ����
	private long numFound;

	//��ʾ���������
	private int viewNums = 200;

	//ָ������Ȩ��
	private Map<String,Float> boost = new HashMap<String,Float>();

	//ָ��lucene�з��صĽ����
	private int returnNums = 15;

	public String getQueryWord() {
		return queryWord;
	}

	public void setQueryWord(String queryWord) {
		this.queryWord = queryWord;
	}

	public List<String> getAssignmentFields() {
		return assignmentFields;
	}

	public void setAssignmentFields(List<String> assignmentFields) {
		this.assignmentFields = assignmentFields;
	}

	public String[] getViewFields() {
		return viewFields;
	}

	public void setViewFields(String[] viewFields) {
		this.viewFields = viewFields;
	}

	public String[] getHighlightFields() {
		return highlightFields;
	}

	public void setHighlightFields(String[] highlightFields) {
		this.highlightFields = highlightFields;
	}

	public String getPreHighlight() {
		return preHighlight;
	}

	public void setPreHighlight(String preHighlight) {
		this.preHighlight = preHighlight;
	}

	public String getPostHighlight() {
		return postHighlight;
	}

	public void setPostHighlight(String postHighlight) {
		this.postHighlight = postHighlight;
	}

	public Map<String, Boolean> getSortField() {
		return sortField;
	}

	public void setSortField(Map<String, Boolean> sortField) {
		this.sortField = sortField;
	}

	public Map<String, String> getFilterField() {
		return filterField;
	}

	public void setFilterField(Map<String, String> filterField) {
		this.filterField = filterField;
	}

	public int getStartNums() {
		return startNums;
	}

	public void setStartNums(int startNums) {
		this.startNums = startNums;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public String[] getFacetFields() {
		return facetFields;
	}

	public void setFacetFields(String[] facetFields) {
		this.facetFields = facetFields;
	}

	public long getNumFound() {
		return numFound;
	}

	public void setNumFound(long numFound) {
		this.numFound = numFound;
	}

	public int getViewNums() {
		return viewNums;
	}

	public void setViewNums(int viewNums) {
		this.viewNums = viewNums;
	}

	public List<Map<String, String>> getAssignFields() {
		return assignFields;
	}

	public void setAssignFields(List<Map<String, String>> assignFields) {
		this.assignFields = assignFields;
	}

	public Boolean getIsHighlight() {
		return isHighlight;
	}

	public void setIsHighlight(Boolean isHighlight) {
		this.isHighlight = isHighlight;
	}

	public Boolean getIsFacet() {
		return isFacet;
	}

	public void setIsFacet(Boolean isFacet) {
		this.isFacet = isFacet;
	}

	public Map<String, Float> getBoost() {
		return boost;
	}

	public void setBoost(Map<String, Float> boost) {
		this.boost = boost;
	}

	public int getReturnNums() {
		return returnNums;
	}

	public void setReturnNums(int returnNums) {
		this.returnNums = returnNums;
	}

}
