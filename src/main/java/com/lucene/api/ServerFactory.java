package com.lucene.api;

import com.lucene.ConstantParams;
import com.utils.StringUtil;

import java.util.Map;


public class ServerFactory {

	public FullTextService beginService(Map<String,String> configParams){
		FullTextService fullTextService = null;
		try {
			String serverName = configParams.get("serverName");
			String type = configParams.get("type");
			String className = configParams.get("className");
			Class<?> c = Class.forName(className);
			if("solr".equals(type)){
				String url = configParams.get("url");

				if(StringUtil.isEmpty(url)){
					url = StringUtil.getConfigParam(ConstantParams.SOLR_URL, "", ConstantParams.SEARCH_CONFIG);
				}
				fullTextService = (FullTextService)c.newInstance();
				fullTextService.beginService(serverName,url);
			}
			if("lucene".equals(type)){
				String flag = configParams.get("flag");
				String indexPath = configParams.get("indexPath");
				fullTextService = (FullTextService)c.newInstance();
				if(StringUtil.isEmpty(indexPath)){
					fullTextService.beginService(serverName, flag);
				}else{
					fullTextService.beginService(serverName, flag, indexPath);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return fullTextService;
	}
}
