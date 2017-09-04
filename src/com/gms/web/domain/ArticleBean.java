package com.gms.web.domain;
import java.io.Serializable;
public class ArticleBean implements Serializable{	
	private static final long serialVersionUID = 1L;
	private String id, title, content, regdate;
	public int articleSeq, hitcount;

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getHitcount() {
		return hitcount;
	}
	public void setArticleSeq(int articleSeq) {
		this.articleSeq = articleSeq;
	}
	public int getArticleSeq() {
		return articleSeq;
	}
	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}
	@Override
	public String toString() {
		return "ArticleBean [id=" + id + ", title=" + title + ", content=" + content + ", regdate=" + regdate
				+ ", articleSeq=" + articleSeq + ", hitcount=" + hitcount + "]\n";
	}

}
