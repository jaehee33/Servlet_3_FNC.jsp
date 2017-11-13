package com.iu.files;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.util.DBConnector;

public class FileDAO {
	
	public int delete(int num)throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="delete files where num=? ";
		PreparedStatement pre=con.prepareStatement(sql);
		pre.setInt(1, num);
		int result=pre.executeUpdate();
		DBConnector.disConnect(pre, con);
		return result;
	}
	
	public ArrayList<FilesDTO> selectList(int num) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="select * from files where num=?";
		PreparedStatement pre=con.prepareStatement(sql);
		pre.setInt(1, num);
		ResultSet rs=pre.executeQuery();
		ArrayList< FilesDTO> ar=new ArrayList<>();
		while(rs.next()) {
			FilesDTO f=new FilesDTO();
			f.setoName(rs.getString("oname"));
			f.setfName(rs.getString("fname"));
			ar.add(f);
		}
		DBConnector.disConnect(rs, pre, con);
		return ar;
	}

	
	public int insert(FilesDTO filesDTO) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="insert into files values(?,?,?)";
		PreparedStatement pre=con.prepareStatement(sql);
		pre.setInt(1, filesDTO.getNum());
		pre.setString(2, filesDTO.getoName());
		pre.setString(3, filesDTO.getfName());
		int result=	pre.executeUpdate();
		DBConnector.disConnect(pre, con);
		return result;
	}

}
