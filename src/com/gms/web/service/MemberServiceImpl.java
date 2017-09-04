package com.gms.web.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gms.web.command.Command;
import com.gms.web.dao.MemberDAOImpl;
import com.gms.web.domain.MajorBean;
import com.gms.web.domain.MemberBean;
import com.gms.web.domain.StudentBean;
import com.gms.web.service.MemberService;

public class MemberServiceImpl implements MemberService{
	public static MemberServiceImpl getInstance(){
		return new MemberServiceImpl();
	}
	private MemberServiceImpl(){}
	
	@Override
	public String addMember(Map<String, Object> map) {
		System.out.println("member service 진입");
		MemberBean m=(MemberBean)map.get("member");
		System.out.println("넘어온 회원 정보:"+m.toString());
		@SuppressWarnings("unchecked")
		List<MajorBean>list=(List<MajorBean>)map.get("major");
		System.out.println("넘어온 수강과목:"+list);
		MemberDAOImpl.getInstance().insert(map);
		
		return null;
	}
	//(MemberDAOImpl.getInstance().insert(member).equals("1"))? "성공":"실패"
		
	@Override
	public List<?> list(Command cmd) {		
		return (MemberDAOImpl.getInstance().selectAll(cmd));
	}
	
	@Override
	public String countMembers(Command cmd) {
		return String.valueOf(MemberDAOImpl.getInstance().countMembers(cmd));
	}
	
	@Override
	public StudentBean findById(Command cmd) {	
		return MemberDAOImpl.getInstance().selectById(cmd);
	}

	@Override
	public List<?> findByName(Command cmd) {
		System.out.println("findByName("+cmd.getSearch()+")");
		return MemberDAOImpl.getInstance().selectByName(cmd);
		}

	@Override
	public String modify(MemberBean member) {		
		String msg="";
		/*		int rs=Integer.parseInt(MemberDAOImpl.getInstance().updatePass(member));
		return (rs==1)?"성공":"실패";*/
		return msg;
	}
	
	@Override
	public String remove(Command cmd) {
		int rs=Integer.parseInt(MemberDAOImpl.getInstance().deleteMember(cmd));
		return (rs==1)?"실패":"성공";
	}
	@Override
	public Map<String,Object> login(MemberBean member) {
		Map<String,Object> map=new HashMap<>();
		Command cmd=new Command();
		cmd.setSearch(member.getId());
		MemberBean mem=MemberDAOImpl.getInstance().login(cmd);
		System.out.println("아이디야~~" + member.getId());
		String page=(mem!=null)?((member.getPassword().equals(mem.getPassword()))?"main":"login_fail"):"join";
		System.out.println("비번:::::"+member.getPassword());
		/*3항 2번 쓴거*/	
		map.put("page", page);
		map.put("user", mem);
		return map;
		}
}

