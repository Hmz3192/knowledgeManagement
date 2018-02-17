package com.lucene.api;

import java.util.List;


public interface FullTextResult {
	
	public List getResultList();
	
	public void setResultList(List list);
	
	public List getFacetList();
	
	public void setFacetList(List list);
	
	public long getNumFound();
	
	public void setNumFound(long numFound);
}
