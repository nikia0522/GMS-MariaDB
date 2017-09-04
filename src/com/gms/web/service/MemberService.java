package com.gms.web.service;

import java.util.List;
import java.util.Map;

import com.gms.web.command.Command;
import com.gms.web.domain.MemberBean;
import com.gms.web.domain.StudentBean;

public interface MemberService {
	public String addMember(Map<String, Object> map); // 객체에 대한 setter (void, parameter 있음)
	public String countMembers(Command cmd); //getter (return type 있고 parameter 없음)
	public List<?> list(Command cmd); //getter (return type 있고 parameter 없음)
	public StudentBean findById(Command cmd); //보안사항이 아니기때문에 public으로..
	public List<?> findByName(Command cmd);
	public String modify(MemberBean member);
	public String remove(Command cmd);
	public Map<String,Object> login(MemberBean member);

}
