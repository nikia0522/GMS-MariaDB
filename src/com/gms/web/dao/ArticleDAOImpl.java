package com.gms.web.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.gms.web.constants.DB;
import com.gms.web.constants.SQL;
import com.gms.web.constants.Vendor;
import com.gms.web.dao.ArticleDAO;
import com.gms.web.domain.ArticleBean;
import com.gms.web.domain.MemberBean;
import com.gms.web.factory.DatabaseFactory;

public class ArticleDAOImpl implements ArticleDAO{
	public static ArticleDAOImpl getInstance() {
		return new ArticleDAOImpl();
	}	
	private ArticleDAOImpl(){}
	@Override
	public int insert(ArticleBean bean) {
		int rs=0;
		try {
			PreparedStatement pstmt=DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection().prepareStatement(SQL.BOARD_INSERT);
			pstmt.setString(1,bean.getId());
			pstmt.setString(2,bean.getTitle());
			pstmt.setString(3,bean.getContent());
			rs=pstmt.executeUpdate();		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return rs;
	}

	@Override
	public List<ArticleBean> selectAll() {
		List<ArticleBean> list=new ArrayList<>();
		try {
			ResultSet rs=DatabaseFactory.createDatabase(Vendor.ORACLE,DB.USERNAME,DB.PASSWORD).getConnection().prepareStatement(SQL.BOARD_LIST).executeQuery();
			ArticleBean board=null;
			while(rs.next()){
				board=new ArticleBean();
				board.setArticleSeq(rs.getInt(DB.BOARD_ARTICLE_SEQ));
				board.setId(rs.getString(DB.MEMBER_ID));
				board.setTitle(rs.getString(DB.TITLE));
				board.setContent(rs.getString(DB.BOARD_CONTENT));
				board.setHitcount(rs.getInt(DB.BOARD_HITCOUNT));
				board.setRegdate(rs.getString(DB.REGDATE));
				list.add(board);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<ArticleBean> selectById(String id) {
		List<ArticleBean> idList=new ArrayList<>();
		try{
		PreparedStatement pstmt=DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection().prepareStatement(SQL.BOARD_FINDBYID);
		pstmt.setString(1, id);
		ResultSet rs=pstmt.executeQuery();
		ArticleBean board=null;
		while(rs.next()){
			board=new ArticleBean();
			board.setArticleSeq(Integer.parseInt(rs.getString(DB.BOARD_ARTICLE_SEQ)));
			board.setId(rs.getString(DB.MEMBER_ID));
			board.setTitle(rs.getString(DB.TITLE));
			board.setContent(rs.getString(DB.BOARD_CONTENT));
			board.setHitcount(Integer.parseInt(rs.getString(DB.BOARD_HITCOUNT)));
			board.setRegdate(rs.getString(DB.REGDATE));
			idList.add(board);
			
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		return idList;
	}

	@Override
	public ArticleBean selectbySeq(String seq) {
		ArticleBean board=new ArticleBean();
		try {
			PreparedStatement pstmt=DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection().prepareStatement(SQL.BOARD_FINDBYSEQ);
			pstmt.setString(1, seq);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				board=new ArticleBean();
				board.setArticleSeq(Integer.parseInt(rs.getString(DB.BOARD_ARTICLE_SEQ)));
				board.setId(rs.getString(DB.MEMBER_ID));
				board.setTitle(rs.getString(DB.TITLE));
				board.setContent(rs.getString(DB.BOARD_CONTENT));
				board.setHitcount(Integer.parseInt(rs.getString(DB.BOARD_HITCOUNT)));
				board.setRegdate(rs.getString(DB.REGDATE));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return board;
	}

	@Override
	public int count() {
		int count=0;
		try{
			ResultSet rs=DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection().prepareStatement(SQL.BOARD_COUNT).executeQuery();
			if(rs.next()){
				count=Integer.parseInt(rs.getString("count"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return count;
	}

	@Override
	public String update(ArticleBean board) {
		ArticleBean temp=selectbySeq(String.valueOf(board.getArticleSeq()));
		String title=(board.getTitle().equals("")?temp.getTitle():board.getTitle());
		String content=(board.getContent().equals("")?temp.getContent():board.getContent());
		String rs="";
		try {
			PreparedStatement pstmt=DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection().prepareStatement(SQL.BOARD_UPDATE);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, board.getArticleSeq());
			rs=String.valueOf(pstmt.executeUpdate());
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	@Override
	public String delete(String seq) {
		String rs="";
		try {
			PreparedStatement pstmt=DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection().prepareStatement(SQL.BOARD_DELETE);
			pstmt.setString(1, seq);
			rs=String.valueOf(pstmt.executeUpdate());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
}

