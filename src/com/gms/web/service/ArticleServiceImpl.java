package com.gms.web.service;

import java.util.List;
import com.gms.web.dao.ArticleDAOImpl;
import com.gms.web.domain.ArticleBean;


public class ArticleServiceImpl implements ArticleService{
	public static ArticleServiceImpl getInstance() {
		return new ArticleServiceImpl();
	}

	private ArticleServiceImpl(){}
	@Override
	public String write(ArticleBean bean) {
		return (ArticleDAOImpl.getInstance().insert(bean)==1)?"등록":"실패";
		
	}

	@Override
	public List<ArticleBean> list() {
		return (ArticleDAOImpl.getInstance().selectAll());
	}

	@Override
	public String countArticles() {
		// TODO Auto-generated method stub
		return String.valueOf(ArticleDAOImpl.getInstance().count());
	}
	
	@Override
	public List<ArticleBean> findById(String id) {
		return ArticleDAOImpl.getInstance().selectById(id);
	}

	@Override
	public ArticleBean findbySeq(String seq) {
		return ArticleDAOImpl.getInstance().selectbySeq(seq);
	}

	@Override
	public String modify(ArticleBean board) {
		int rs=Integer.parseInt(ArticleDAOImpl.getInstance().update(board));
		return (rs==1)?"변경 성공":"변경 실패";
	}

	@Override
	public String remove(String articleSeq) {
		int rs=Integer.parseInt(ArticleDAOImpl.getInstance().delete(articleSeq));
		return (rs==1)?"삭제 성공":"삭제 실패";
	}
}
