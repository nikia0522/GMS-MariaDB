package com.gms.web.domain;

public class MajorBean {
	private String majorId,title, id, subjId;

	public String getMajorId() {
		return majorId;
	}

	public void setMajorId(String majorId) {
		this.majorId = majorId;
	}

	@Override
	public String toString() {
		return "MajorBean [majorId=" + majorId + ", title=" + title + ", id=" + id + ", subjId=" + subjId + "]";
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSubjId() {
		return subjId;
	}

	public void setSubjId(String subjId) {
		this.subjId = subjId;
	} 
}
