package com.gms.web.dao;

import java.util.List;

import com.gms.web.domain.ArticleBean;
import com.gms.web.domain.MemberBean;

public interface ArticleDAO {
	public int insert(ArticleBean bean);
	public List<ArticleBean> selectAll();
	public List<ArticleBean> selectById(String id);
	public ArticleBean selectbySeq(String seq);
	public int count();
	public String update(ArticleBean board);
	public String delete(String seq);
	
}
