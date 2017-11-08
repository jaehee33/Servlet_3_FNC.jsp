package com.iu.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.util.DBConnector;

public class MemberDAO {
	
	//selectOne
	public MemberDTO selectOne(MemberDTO memberDTO) throws Exception{
		Connection con=DBConnector.getConnect();
		MemberDTO mDTO=null;
		String sql="select * from member where id=? and password=? and job=?";
		PreparedStatement pre=con.prepareStatement(sql);
		pre.setString(1, memberDTO.getId());
		pre.setString(2, memberDTO.getPassword());
		pre.setString(3, memberDTO.getJob());
		ResultSet rs=pre.executeQuery();
		if(rs.next()) {
			mDTO = new MemberDTO();
		mDTO.setId(rs.getString("id"));
		mDTO.setPassword(rs.getString("password"));
		mDTO.setName(rs.getString("name"));
		mDTO.setEmail(rs.getString("email"));
		mDTO.setPhone(rs.getString("phone"));
		mDTO.setAge(rs.getInt("age"));
		mDTO.setJob(rs.getString("job"));
		}
		DBConnector.disConnect(rs, pre, con);
		return mDTO;
}
	//===========================================================================
	
	//idCheck
	public boolean idCheck(String id) throws Exception{
		boolean check=true;
		Connection con=DBConnector.getConnect();
		String sql="select * from member where id=?";
		PreparedStatement pre=con.prepareStatement(sql);
		pre.setString(1, id);
		ResultSet rs=pre.executeQuery();
		if(rs.next()) {
			check=false;
		}
		DBConnector.disConnect(rs, pre, con);
		return check;
		
	}
	//===========================================================================
	
	//getTotalCount
	public int getTotalCount(String kind, String search) throws Exception {
		Connection con=DBConnector.getConnect();
		String sql="select nvl(count(id),0) from member where "+kind+" like ?"; //혹시 널값이 오지 않도록 nvl 쓰고 값 넣어주기
		PreparedStatement pre=con.prepareStatement(sql);
		pre.setString(1, "%"+search+"%");
		ResultSet rs=pre.executeQuery();
		rs.next();
		int totalCount=rs.getInt(1);
		DBConnector.disConnect(rs, pre, con);
		return totalCount;
	}
	//===========================================================================
	
	//insert
	public int insert(MemberDTO memberDTO) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="insert into member values(?,?,?,?,?,?,?)";
		PreparedStatement pre=con.prepareStatement(sql);
		pre.setString(1, memberDTO.getId());
		pre.setString(2, memberDTO.getPassword());
		pre.setString(3, memberDTO.getName());
		pre.setString(4, memberDTO.getEmail());
		pre.setString(5, memberDTO.getPhone());
		pre.setInt(6, memberDTO.getAge());
		pre.setString(7, memberDTO.getJob());
		int result=pre.executeUpdate();
		DBConnector.disConnect(pre, con);
		return result;
	}
	//===========================================================================
	
	//selectList
	public ArrayList<MemberDTO> selectList(int startRow, int lastRow, String kind, String search) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="select * from (select rownum R, N.* from (select * from member where "+kind+" like ? order by id asc) N ) where R between ? and ?";
		PreparedStatement pre=con.prepareStatement(sql);
		pre.setString(1, "%"+search+"%");
		pre.setInt(2, startRow);
		pre.setInt(3, lastRow);
		ResultSet rs=pre.executeQuery();
		ArrayList<MemberDTO> ar=new ArrayList<>(); // 여러개가 오니까 어레이리스트 만들고 와일문으로 돌리기
		while(rs.next()) {
			MemberDTO memberDTO=new MemberDTO();
			memberDTO.setId(rs.getString("id"));
			memberDTO.setPassword(rs.getString("password"));
			memberDTO.setName(rs.getString("name"));
			memberDTO.setEmail(rs.getString("email"));
			memberDTO.setPhone(rs.getString("phone"));
			memberDTO.setAge(rs.getInt("age"));
			memberDTO.setJob(rs.getString("job"));
			ar.add(memberDTO);
		}
		DBConnector.disConnect(rs, pre, con);
		return ar;
	}
	//===========================================================================
}
