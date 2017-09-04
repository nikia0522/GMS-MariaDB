package com.gms.web.dao;

import java.util.List;
import java.util.Map;

import com.gms.web.command.Command;
import com.gms.web.domain.MemberBean;
import com.gms.web.domain.StudentBean;

public interface MemberDAO {
	public String insert(Map<?, ?>map); // 객체에 대한 setter (void, parameter 있음)
	public String countMembers(Command cmd); //getter (return type 있고 parameter 없음)
	public List<?> selectAll(Command cmd); //getter (return type 있고 parameter 없음)
	public StudentBean selectById(Command cmd); //보안사항이 아니기때문에 public으로..
	public List<?> selectByName(Command cmd);
	public String updatePass(MemberBean member);
	public String deleteMember(Command cmd); //int- 성공여부를 알려주는것임
	public MemberBean login(Command cmd); //보안사항이 아니기때문에 public으로..

}
