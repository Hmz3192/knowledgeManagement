package com.lucene.spi;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.lucene.ConstantParams;
import com.lucene.api.FullTextIndexParams;
import com.lucene.api.FullTextResult;
import com.lucene.api.FullTextSearchParams;
import com.utils.StringUtil;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.FacetField;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.SolrInputDocument;

public class SolrService extends FullTextServiceImpl {

	@Override
	public void preIndexMethod() {
	}

	@Override
	public void afterIndexMethod() {
	}

	@Override
	public void updateIndex(FullTextIndexParams fullTextIndexParams) {
		long preStart = System.currentTimeMillis();
		preUpdateIndexMethod();
		long preEnd = System.currentTimeMillis();
		System.out.println("Your preUpdateIndex spent on "+(preEnd-preStart)+" ms.");
		try {
			deleteIndex(fullTextIndexParams);
		} catch (Exception e) {
			e.printStackTrace();
		}
		long afterStart = System.currentTimeMillis();
		afterUpdateIndexMethod();
		long afterEnd = System.currentTimeMillis();
		System.out.println("Your afterUpdateIndex spent on "+(afterEnd-afterStart)+" ms again.");
	}

	@Override
	public void preUpdateIndexMethod() {
	}

	@Override
	public void afterUpdateIndexMethod() {
	}

	@Override
	public void deleteIndex(FullTextIndexParams fullTextIndexParams) {
		long preStart = System.currentTimeMillis();
		preDeleteIndexMethod();
		long preEnd = System.currentTimeMillis();
		System.out.println("Your preDeleteIndex spent on "+(preEnd-preStart)+" ms.");
		try {
			if(StringUtil.isNotEmpty(fullTextIndexParams.getId())){
				//首先去删除一个id的情况
				this.solrServerMap.get(this.serverName).deleteById(fullTextIndexParams.getId());
			}else{
				this.solrServerMap.get(this.serverName).deleteById(fullTextIndexParams.getIds());
			}
			this.solrServerMap.get(this.serverName).commit();
		} catch (SolrServerException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		long afterStart = System.currentTimeMillis();
		afterDeleteIndexMethod();
		long afterEnd = System.currentTimeMillis();
		System.out.println("Your afterDeleteIndex spent on "+(afterEnd-afterStart)+" ms again.");
	}

	@Override
	public void preDeleteIndexMethod() {
	}

	@Override
	public void afterDeleteIndexMethod() {
	}

	public Map<String,SolrServer> solrServerMap = new HashMap<String,SolrServer>();
	
	private String serverName;
	
	
	public String getServerName() {
		return serverName;
	}

	public void setServerName(String serverName) {
		this.serverName = serverName;
	}

	@Override
	public int beginService(String serverName) {
		SolrServer solrServer = solrServerMap.get(serverName);
		if(solrServer == null){
			solrServer = beginServer();
			solrServerMap.put(serverName,solrServer);
			return 1;
		}
		return -1;
	}
	
	@Override
	public int beginService(String serverName, String url) {
		if(StringUtil.isEmpty(url)){
			return -1;
		}
		SolrServer solrServer = solrServerMap.get(serverName);
		if(solrServer == null){
			solrServer = beginServer(url);
			solrServerMap.put(serverName,solrServer);
			return 1;
		}
		return -1;
	}

	@Override
	public int endService(String serverName) {
		// TODO Auto-generated method stub
		return super.endService(serverName);
	}

	@Override
	public void doIndex(FullTextIndexParams fullTextIndexParams) {
		long preStart = System.currentTimeMillis();
//		preIndexMethod();
		long preEnd = System.currentTimeMillis();
		System.out.println("Your preIndex spent on "+(preEnd-preStart)+" ms.");
		try {
			List<Map<String,Object>> indexData = fullTextIndexParams.getIndexData();
			if(indexData != null && indexData.size() > 0){
				List<SolrInputDocument> documentList = new ArrayList<SolrInputDocument>();
				SolrInputDocument doc = null;
				for(Map<String,Object> map : indexData){
					doc = new SolrInputDocument();
					Set<String> set = map.keySet();
					Iterator<String> iter = set.iterator();
					while(iter.hasNext()){
						String key = iter.next();
						Object value = map.get(key);
						doc.addField(key, value);
					}
					documentList.add(doc);
				}
				this.solrServerMap.get(this.serverName).add(documentList);
				this.solrServerMap.get(this.serverName).commit();
			}else{
				return;
			}
		} catch (SolrServerException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		long afterStart = System.currentTimeMillis();
//		afterIndexMethod();
		long afterEnd = System.currentTimeMillis();
		System.out.println("Your afterIndex spent on "+(afterEnd-afterStart)+" ms again.");
	}

	@Override
	public FullTextResult doQuery(FullTextSearchParams fullTextSearchParams) {
		FullTextResult result = new SolrResult();
		try {
			String queryWord = fullTextSearchParams.getQueryWord();
			if(StringUtil.isEmpty(queryWord)){
				return null;
			}
			List<String> assignmentFields = fullTextSearchParams.getAssignmentFields();
			List<Map<String,String>> assignFields = fullTextSearchParams.getAssignFields();
			String queryString = "";
			if(assignmentFields != null && assignmentFields.size()>0){
				for(String assignmentField : assignmentFields){
					queryString += assignmentField+":"+queryWord+" OR ";
				}
				int pos = queryString.lastIndexOf(" OR ");
				queryString = queryString.substring(0, pos);
			}else if(assignFields != null && assignFields.size()>0){
				String lastValue = "";
				for(Map<String,String> assignField : assignFields){
					Set<String> set = assignField.keySet();
					Iterator<String> iter = set.iterator();
					while(iter.hasNext()){
						String key = iter.next();
						String value = assignField.get(key);
						queryString += key+":"+queryWord + ConstantParams.SINGLE_BLANK + value + ConstantParams.SINGLE_BLANK;
						lastValue = value;
					}
				}
				int pos = queryString.lastIndexOf(" "+lastValue+" ");
				queryString = queryString.substring(0, pos);
			}else{
				queryString = queryWord;
			}
			
			System.out.println("queryString:"+queryString);
			SolrQuery params = new SolrQuery(queryString);
			
			//设置显示域
			String[] viewFields = fullTextSearchParams.getViewFields();
			params.setFields(viewFields);
			
			//高亮参数
			boolean isHighlight = fullTextSearchParams.getIsHighlight();
			String[] highlightFields = fullTextSearchParams.getHighlightFields();
			if(isHighlight && highlightFields != null && highlightFields.length > 0){
				params.setHighlight(true);
				params.setHighlightSimplePre(fullTextSearchParams.getPreHighlight());
				params.setHighlightSimplePost(fullTextSearchParams.getPostHighlight());
				params.setHighlightFragsize(fullTextSearchParams.getViewNums());
			}
			
			//排序域 String:需要排序的域名，Boolean：true 升序 false 降序
			Map<String,Boolean> sortField = fullTextSearchParams.getSortField();
			if(sortField != null){
				Set<String> set = sortField.keySet();
				Iterator<String> iter = set.iterator();
				while(iter.hasNext()){
					String key = iter.next();
					Boolean value = sortField.get(key);
					if(value){
						params.addSort(key, SolrQuery.ORDER.asc);
					}else{
						params.addSort(key, SolrQuery.ORDER.desc);
					}
					
				}
			}
			
			//过滤域
			Map<String,String> filterField = fullTextSearchParams.getFilterField();
			if(filterField != null && filterField.size() > 0){
				StringBuilder str = new StringBuilder();
				Set<String> set = filterField.keySet();
				Iterator<String> iter = set.iterator();
				while(iter.hasNext()){
					String key = iter.next();
					String value = filterField.get(key);
					str.append(key+":"+value);
					str.append("-beifeng-");
				}
				String[] fieldFields = str.toString().split("-beifeng-");
				params.addFilterQuery(fieldFields);
			}
			
			//开始行
			params.setStart(fullTextSearchParams.getStartNums());
			//一页显示多少行
			params.setRows(fullTextSearchParams.getPageCount());
			
			//统计域
			boolean isFacet = fullTextSearchParams.getIsFacet();
			String[] facetFields = fullTextSearchParams.getFacetFields();
			if(isFacet && facetFields != null && facetFields.length>0){
				params.addFacetField(facetFields);
			}
			
			QueryResponse response = this.solrServerMap.get(this.serverName).query(params);
			SolrDocumentList list = response.getResults();
			result.setNumFound(list.getNumFound());
			
			SolrDocument document = new SolrDocument();
			SolrDocumentList hlList = new SolrDocumentList();
			
			//高亮结果
			if(isHighlight && highlightFields != null && highlightFields.length > 0){
				Map<String,Map<String,List<String>>> map = response.getHighlighting();
				for(int i=0;i<list.size();i++){
					for(int j=0;j<highlightFields.length;j++){
						document = list.get(i);
						if(map != null && map.get(document.getFieldValue("id")) != null && map.get(document.getFieldValue("id")).get(highlightFields[j]) != null){
							document.setField(highlightFields[j], map.get(document.getFieldValue("id")).get(highlightFields[j]).get(0));
						}else{
							if(String.valueOf(document.getFieldValue(highlightFields[j])).length() > fullTextSearchParams.getViewNums())
								document.setField(highlightFields[j], String.valueOf(document.getFieldValue(highlightFields[j])).substring(0,fullTextSearchParams.getViewNums()));
							else
								document.setField(highlightFields[j], document.getFieldValue(highlightFields[j]));

						}
					}
					hlList.add(document);
				}
				result.setResultList(hlList);
			}else{
				result.setResultList(list);
			}
			
			//统计结果
			if(isFacet && facetFields != null && facetFields.length>0){
				List<FacetField> listField = response.getFacetFields();
				result.setFacetList(listField);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public SolrServer beginServer(){
		SolrServer solrServer = null;
		try {
			String url = StringUtil.getConfigParam(ConstantParams.SOLR_URL, "", ConstantParams.SEARCH_CONFIG);
			solrServer = new HttpSolrServer(url);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return solrServer;
	}
	
	public SolrServer beginServer(String url){
		SolrServer solrServer = null;
		try {
			solrServer = new HttpSolrServer(url);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return solrServer;
	}

}
