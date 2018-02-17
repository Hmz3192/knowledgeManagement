package com.lucene.spi;

import com.lucene.api.FullTextResult;
import org.apache.solr.client.solrj.response.FacetField;

import java.util.ArrayList;
import java.util.List;


public class FullTextResultImpl implements FullTextResult {
	
	public List resultList = new ArrayList();
	
	public List<FacetField> facetList = new ArrayList<FacetField>();
	
	public long numFound;

	@Override
	public List getResultList() {
		return resultList;
	}

	@Override
	public void setResultList(List list) {
		this.resultList = list;
	}

	@Override
	public List getFacetList() {
		return facetList;
	}

	@Override
	public void setFacetList(List list) {
		this.facetList = list;
	}

	@Override
	public long getNumFound() {
		return numFound;
	}

	@Override
	public void setNumFound(long numFound) {
		this.numFound = numFound;
	}

}
