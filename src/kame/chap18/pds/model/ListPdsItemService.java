package kame.chap18.pds.model;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import kame.jdbc.connection.ConnectionProvider;
import ssol.jdbc.JdbcUtil;

public class ListPdsItemService {

	private static ListPdsItemService instance =new ListPdsItemService();
	public static ListPdsItemService getInstance() {
		return instance;
	}
	private ListPdsItemService() {
		
	}
	public static final int COUNT_PER_PAGE=10;
	
	public PdsItemListModel getPdsItemList(int pageNumber) {
		if(pageNumber < 0) {
			throw new IllegalArgumentException("page number < 0:"+pageNumber);
		}
		PdsItemDao pdsItemDao=PdsItemDao.getInstance();
		Connection conn=null;
		try {
			conn=ConnectionProvider.getConnection();
			int totalArticleCount=pdsItemDao.selectCount(conn);
			if(totalArticleCount ==0) {
				return new PdsItemListModel();
			}
			int totalPageCount=calculateTotalPageCount(totalArticleCount);
			int firstRow=(pageNumber -1) * COUNT_PER_PAGE+1;
			int endRow=firstRow+COUNT_PER_PAGE-1;
			if(endRow>totalArticleCount) {
				endRow=totalArticleCount;
			}
			List<PdsItem> PdsItemList=pdsItemDao.select(conn, firstRow, endRow);
			PdsItemListModel pdsItemListView =new PdsItemListModel(PdsItemList,pageNumber,totalPageCount,firstRow,endRow);
			return pdsItemListView;
		}catch(SQLException e) {
			throw new RuntimeException("DB에러 발생: "+e.getMessage(),e);
		}finally {
			JdbcUtil.close(conn);
		}
	}
	
	private int calculateTotalPageCount(int totalPdsItemCount) {
		if(totalPdsItemCount ==0) {
			return 0;
		}
		int pageCount=totalPdsItemCount/COUNT_PER_PAGE;
		if(totalPdsItemCount % COUNT_PER_PAGE >0) {
			pageCount++;
		}
		return pageCount;
	}
}
