package com.lucene.index;

import com.lucene.DataBaseUtils;
import com.lucene.InitParams;
import com.lucene.spi.SolrService;
import com.utils.StringUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class IndexCommonServer extends SolrService {
	//获取每次索引的条数
	private int indexCount = getIndexCount();
	//获取索引的类型
	protected String indexType = getIndexType();
	//获取索引的唯一键
	protected String[] uniqueKey = getUniqueKey();
	//获取与业务相关的配置sql语句
	protected String indexSql = getIndexSql();
	//索引表的名字
	protected String indexTable = getIndexTable();

	protected List<Integer> recIdList = new ArrayList<Integer>();

	public int getIndexCount(){
		String count = StringUtil.getConfigParam(InitParams.INDEX_COUNT, "200", InitParams.SEARCH_PROPERTIES);
		if(StringUtil.isNotEmpty(count)){
			return Integer.parseInt(count);
		}
		return 1;
	}

	public String getIndexType(){
		return StringUtil.getConfigParam(InitParams.INDEX_TYPE, "test", InitParams.SEARCH_PROPERTIES);
	}

	public String[] getUniqueKey(){
		String uk = StringUtil.getConfigParam(InitParams.UNIQUEKEY, "", InitParams.SEARCH_PROPERTIES);
		if(uk != null && uk.contains(",")){
			String[] temp = uk.split(",");
			if(temp.length == 3){
				return temp;
			}
		}
		return null;
	}

	public String getIndexTable(){
		return StringUtil.getConfigParam(InitParams.INDEX_TABLE, "t_index", InitParams.SEARCH_PROPERTIES);
	}

	public String getIndexSql(){
		return StringUtil.getConfigParam(InitParams.INDEX_SQL, "", InitParams.SEARCH_PROPERTIES);
	}

	//获取需要索引记录的id
	public List<Object> getIndexIDs(String type,String action,int flag){
		List<Object> list = new ArrayList<Object>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DataBaseUtils.getConnection();
			String sql = "SELECT recid,businessId FROM "+indexTable+" WHERE TYPE=? AND action=? AND flag=? limit ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, type);
			pstmt.setString(2, action);
			pstmt.setInt(3, flag);
			pstmt.setInt(4, indexCount);
			rs = pstmt.executeQuery();
			while(rs.next()){
				int bID = rs.getInt("businessId");
				int recID = rs.getInt("recid");
				list.add(bID);
				recIdList.add(recID);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DataBaseUtils.closeConnection(conn, pstmt, stmt, rs);
		}
		return list;
	}

	//获取需要索引记录的businessId,recId
	public List[] getIDs(String type,String action,int flag){
		List<Object> bnList = new ArrayList<Object>();
		List<Object> recList = new ArrayList<Object>();
		List[] results = new List[2];
		Connection conn = null;
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DataBaseUtils.getConnection();
			String sql = "SELECT recid,businessId FROM "+indexTable+" WHERE TYPE=? AND action=? AND flag=? limit ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, type);
			pstmt.setString(2, action);
			pstmt.setInt(3, flag);
			pstmt.setInt(4, indexCount);
			rs = pstmt.executeQuery();
			while(rs.next()){
				int bID = rs.getInt("businessId");
				int recID = rs.getInt("recid");
				bnList.add(bID);
				recList.add(recID);
			}
			results[0] = recList;
			results[1] = bnList;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DataBaseUtils.closeConnection(conn, pstmt, stmt, rs);
		}
		return results;
	}

	public List<Object> getIndexIDs(String type,String action){
		return  getIndexIDs(type,action,0);
	}

	public List<Object> getIndexIDs(String action){
		return  getIndexIDs(indexType,action,0);
	}

	//与业务同步的，添加索引表数据
	public void addIndexTable(int businessId,String type,String action){
		Connection conn = null;
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DataBaseUtils.getConnection();
			String sql = "insert into "+indexTable+" (businessId,TYPE,action) values (?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, businessId);
			pstmt.setString(2, type);
			pstmt.setString(3, action);
			pstmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DataBaseUtils.closeConnection(conn, pstmt, stmt, rs);
		}
	}

	//与业务同步的，修改、删除索引表数据
	public void updateIndexTable(int businessId,String type,String action){
		Connection conn = null;
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DataBaseUtils.getConnection();
			String sql = "update "+indexTable+" set action = ?,flag = ? where businessId = ? and type = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, action);
			pstmt.setInt(2, 0);
			pstmt.setInt(3, businessId);
			pstmt.setString(4, type);
			pstmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DataBaseUtils.closeConnection(conn, pstmt, stmt, rs);
		}
	}

}
