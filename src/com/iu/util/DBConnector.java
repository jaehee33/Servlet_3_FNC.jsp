package com.iu.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConnector {
	
	public static Connection getConnect() throws Exception {
		String user="USER03";
		String password="USER03";
		String url="jdbc:oracle:thin:@192.168.20.53:1521:xe";
		String driver="oracle.jdbc.driver.OracleDriver";

		Class.forName(driver);
		Connection con=DriverManager.getConnection(url, user, password);
	
		return con;
	}
	
	public static void disConnect(PreparedStatement pre, Connection con) throws Exception {
		pre.close();
		con.close();
	}
	public static void disConnect(ResultSet rs, PreparedStatement pre, Connection con)throws Exception {
		rs.close();
		DBConnector.disConnect(pre, con);
	}

}
