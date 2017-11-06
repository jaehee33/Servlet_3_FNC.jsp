package com.iu.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.util.DBConnector;

public class MemberDAO {
	
	//getTotalCount
	public int getTotalCount() throws Exception {
		Connection con=DBConnector.getConnect();
		String sql="select nvl(count(id),0) from member"; //혹시 널값이 오지 않도록 nvl 쓰고 값 넣어주기
		PreparedStatement pre=con.prepareStatement(sql);
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
