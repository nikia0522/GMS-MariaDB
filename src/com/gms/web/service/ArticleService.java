package com.gms.web.service;

import java.util.List;

import com.gms.web.domain.ArticleBean;
import com.gms.web.domain.MemberBean;

public interface ArticleService {
	public String write(ArticleBean bean);
	public List<ArticleBean> list();
	public List<ArticleBean> findById(String id);
	public ArticleBean findbySeq(String seq);
	public String countArticles();
	public String modify(ArticleBean board);
	public String remove(String seq);
	
}
