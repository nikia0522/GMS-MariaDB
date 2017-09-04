package com.gms.web.dao;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.gms.web.command.Command;
import com.gms.web.constants.DB;
import com.gms.web.constants.SQL;
import com.gms.web.constants.Vendor;
import com.gms.web.dao.MemberDAO;
import com.gms.web.domain.MajorBean;
import com.gms.web.domain.MemberBean;
import com.gms.web.domain.StudentBean;
import com.gms.web.factory.DatabaseFactory;

import java.sql.*;

public class MemberDAOImpl implements MemberDAO{
	Connection conn;
	public static MemberDAOImpl getInstance() {
		return new MemberDAOImpl();}
	private MemberDAOImpl(){
		conn=null;
	} 

	@Override
	public String insert(Map<?, ?>map) {
		String rs="";
		MemberBean member=(MemberBean)map.get("member");
		@SuppressWarnings("unchecked")
		List<MajorBean> list =(List<MajorBean>)map.get("major");
		PreparedStatement pstmt=null;
		try {
			conn=DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection();
			conn.setAutoCommit(false);
			pstmt=conn.prepareStatement(SQL.MEMBER_INSERT);
			pstmt.setString(1,member.getId());
			pstmt.setString(2,member.getName());
			pstmt.setString(3,member.getPassword());
			pstmt.setString(4,member.getSsn());
			pstmt.setString(5,member.getPhone());
			pstmt.setString(6,member.getEmail());
			pstmt.setString(7,member.getProfile());
			System.out.println("***"+SQL.MAJOR_INSERT);
			pstmt.executeUpdate();
			for(int i=0; i<list.size();i++){
				pstmt=conn.prepareStatement(SQL.MAJOR_INSERT);
				pstmt.setString(1, list.get(i).getMajorId());
				pstmt.setString(2, list.get(i).getTitle());
				pstmt.setString(3, list.get(i).getId());
				pstmt.setString(4, list.get(i).getSubjId());
				rs=String.valueOf(pstmt.executeUpdate());
				System.out.println("***"+SQL.MAJOR_INSERT);
				System.out.println("***"+rs);
			}
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
			if(conn !=null){
				try{
					conn.rollback();
				}catch(SQLException ex){
					e.printStackTrace();
				}
			}
		}
		return String.valueOf(rs);	
	}

	@Override
	public String countMembers(Command cmd) {
		System.out.println("count("+cmd.getSearch()+")");
		System.out.println("count("+cmd.getColumn()+")");
		int count=0;	
		try {
			conn=DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection();
			PreparedStatement pstmt=null;
			if(cmd.getSearch()==null){
				System.out.println("cmd.getSearch() is null");
				pstmt=conn.prepareStatement(SQL.STUDENT_COUNT);
				pstmt.setString(1, "%");
			}else{
				System.out.println("cmd.getSearch() is not null");
				pstmt=conn.prepareStatement(SQL.STUDENT_COUNT);
				pstmt.setString(1, "%"+cmd.getSearch()+"%");
					}
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				count=rs.getInt("count");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("카운트$$$$$"+count);
		return String.valueOf((count));
	}

	@Override
	public List<?> selectAll(Command cmd) {
		List<StudentBean>list=new ArrayList<>();
		try {
			conn=DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection();
			PreparedStatement pstmt=conn.prepareStatement(SQL.STUDENT_LIST);
			pstmt.setString(1, cmd.getStartRow());
			pstmt.setString(2, cmd.getEndRow());
			ResultSet rs=pstmt.executeQuery();
			StudentBean member=null; //지역변수는 반드시 초기화
			while(rs.next()){ //여러개 호출하기 때문에 while loop
				member=new StudentBean();
				member.setNum(rs.getString(DB.NUM));
				member.setId(rs.getString(DB.ID));
				member.setName(rs.getString(DB.MEMBER_NAME));
				member.setPhone(rs.getString(DB.MEMBER_PHONE));				
				member.setEmail(rs.getString(DB.MEMBER_EMAIL));
				member.setSsn(rs.getString(DB.MEMBER_SSN));
				member.setRegdate(rs.getString(DB.REGDATE));
				member.setTitle(rs.getString(DB.TITLE));
				
				list.add(member);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return list;
	}


	@Override
	public List<?> selectByName(Command cmd) {
		List<StudentBean> list=new ArrayList<>();
		System.out.println("DAO name"+cmd.getSearch());
		try {
			conn=DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection();
			PreparedStatement pstmt=conn.prepareStatement(SQL.STUDENT_SEARCH);
			pstmt.setString(1, cmd.getSearch());
			ResultSet rs=pstmt.executeQuery();
			StudentBean member=null; //지역변수는 반드시 초기화
			while(rs.next()){ //여러개 호출하기 때문에 while loop
				member=new StudentBean();
				member.setNum(rs.getString(DB.NUM));
				member.setId(rs.getString(DB.ID));
				member.setName(rs.getString(DB.MEMBER_NAME));
				member.setPhone(rs.getString(DB.MEMBER_PHONE));				
				member.setEmail(rs.getString(DB.MEMBER_EMAIL));
				member.setSsn(rs.getString(DB.MEMBER_SSN));
				member.setRegdate(rs.getString(DB.REGDATE));
				member.setTitle(rs.getString(DB.TITLE));
				
				list.add(member);
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		System.out.println("namelist ****"+list.toString());
		return list;
	}

	
	@Override
	public StudentBean selectById(Command cmd) {
		System.out.println("ddd");
		StudentBean member=null; //지역변수는 반드시 초기화
		try {
			conn=DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection();
			PreparedStatement pstmt=conn.prepareStatement(SQL.STUDENT_FINDBYID);
			pstmt.setString(1, cmd.getSearch());
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){ //여러개 호출하기 때문에 while loop
				member=new StudentBean();
				member.setNum(rs.getString(DB.NUM));
				member.setId(rs.getString(DB.ID));
				member.setName(rs.getString(DB.MEMBER_NAME));
				member.setPhone(rs.getString(DB.MEMBER_PHONE));				
				member.setEmail(rs.getString(DB.MEMBER_EMAIL));
				member.setSsn(rs.getString(DB.MEMBER_SSN));
				member.setRegdate(rs.getString(DB.REGDATE));
				member.setTitle(rs.getString(DB.TITLE));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return member;
	}

	@Override
	public String updatePass(MemberBean member) {
		String rs="";
		try {
			PreparedStatement psmt=DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection().prepareStatement(SQL.MEMBER_UPDATE);
			psmt.setString(1, member.getPassword());
			psmt.setString(2, member.getId());
			rs=String.valueOf(psmt.executeUpdate());
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return String.valueOf(rs);

		
	}

	@Override
	public String deleteMember(Command cmd) {
		String rs="";
		try {
			PreparedStatement psmt=DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection().prepareStatement(SQL.MEMBER_DELETE);
			psmt.setString(1,cmd.getSearch());
			rs=String.valueOf(psmt.executeUpdate());		
			} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return String.valueOf(rs);
	}
	@Override
	public MemberBean login(Command cmd) {
		MemberBean member=null;
		try {
			PreparedStatement pstmt=DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection().prepareStatement("SELECT * FROM Member WHERE member_id=?");
			pstmt.setString(1, cmd.getSearch());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				member=new MemberBean();
				member.setId(rs.getString(DB.MEMBER_ID));
				member.setPassword(rs.getString(DB.MEMBER_PASS));
				member.setName(rs.getString(DB.MEMBER_NAME));
				member.setSsn(rs.getString(DB.MEMBER_SSN));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return member;
	}
}
