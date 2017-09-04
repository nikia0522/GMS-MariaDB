package com.gms.web.domain;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import com.gms.web.constants.DB;

public class DatabaseBean implements Serializable{ 
	private static final long serialVersionUID = 1L;
	private String driver,url,username,password;
	private Connection connection;
	public DatabaseBean(String driver, String url, String username, String password) {
		this.driver = driver;
		this.url = url;
		this.username = username;
		this.password = password;
	}
	public Connection getConnection(){
		try {
			Class.forName(DB.ORACLE_DRIVER);
			connection=DriverManager.getConnection(DB.ORACLE_URL, DB.USERNAME, DB.PASSWORD);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return connection;
	}
}
