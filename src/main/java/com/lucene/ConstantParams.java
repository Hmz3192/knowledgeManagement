package com.lucene;

import java.io.File;

public class ConstantParams {
	public static final String CHENG_LINE = "\r\n";
	public static final String BLANK = "  ";
	public static final String SINGLE_BLANK = " ";
	public static final String TABLE = "\t";
	
	public static final String SOLR_URL = "solr_url";
	public static final String SEARCH_CONFIG = "search.properties";
	
	public static final String INDEXPATH = System.getProperty("webapp.root") +  File.separator +"index";
	
}
