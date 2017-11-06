package com.iu.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.util.DBConnector;

public class NoticeDAO {

	//getTotalCount
	public int getTotalCount(String kind, String search) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="select nvl(count(num),0) from notice where "+kind+" like ? ";
		PreparedStatement pre=con.prepareStatement(sql);
		pre.setString(1, "%"+search+"%");
		ResultSet rs=pre.executeQuery();
		rs.next();
		int totalCount=rs.getInt(1);
		DBConnector.disConnect(rs, pre, con);
		return totalCount;
	}

/*	public static void main(String[] args) {
		NoticeDAO noticeDAO=new NoticeDAO();
		for(int i=0; i<50; i++) {
			NoticeDTO noticeDTO=new NoticeDTO();
			noticeDTO.setWriter("Henry");
			noticeDTO.setTitle("[Trap_title]"+i);
			noticeDTO.setContents("움직일수 없어 왜"+i);
			try {
				noticeDAO.insert(noticeDTO);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("done");

		}
	}*/
	//hitUpdate
	public int hitUpdate(int num) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="update notice set hit=hit+1 where num=?";
		PreparedStatement pre=con.prepareStatement(sql);
		pre.setInt(1, num);
		int result=pre.executeUpdate();
		DBConnector.disConnect(pre, con);
		return result;
	}

	public int delete(int num) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="delete notice where num=?";
		PreparedStatement pre=con.prepareStatement(sql);
		pre.setInt(1, num);
		int result=pre.executeUpdate();
		DBConnector.disConnect(pre, con);
		return result;
	}

	public int update(NoticeDTO noticeDTO) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="update notice set title=?, writer=?, contents=? where num=?";
		PreparedStatement pre=con.prepareStatement(sql);
		pre.setString(1, noticeDTO.getTitle());
		pre.setString(2, noticeDTO.getWriter());
		pre.setString(3, noticeDTO.getContents());
		pre.setInt(4, noticeDTO.getNum());
		int result=pre.executeUpdate();
		DBConnector.disConnect(pre, con);
		return result;
	}


	public int insert(NoticeDTO noticeDTO) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="insert into notice values(board_seq.nextval,?,?,?,sysdate,0)";
		PreparedStatement pre=con.prepareStatement(sql);
		pre.setString(1, noticeDTO.getTitle());
		pre.setString(2, noticeDTO.getWriter());
		pre.setString(3, noticeDTO.getContents());

		int result=pre.executeUpdate();
		DBConnector.disConnect(pre, con);
		return result;
	}


	public NoticeDTO selectOne(int num) throws Exception{
		Connection con=DBConnector.getConnect();
		NoticeDTO noticeDTO=null;
		String sql="select * from notice where num=?";
		PreparedStatement pre=con.prepareStatement(sql);
		pre.setInt(1, num);
		ResultSet rs=pre.executeQuery();
		if(rs.next()) {
			noticeDTO=new NoticeDTO();
			noticeDTO.setNum(rs.getInt("num"));
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setWriter(rs.getString("writer"));
			noticeDTO.setContents(rs.getString("contents"));
			noticeDTO.setReg_date(rs.getDate("Reg_date"));
			noticeDTO.setHit(rs.getInt("hit"));
		}
		DBConnector.disConnect(rs, pre, con);
		return noticeDTO;
	}

	public ArrayList<NoticeDTO> selectList(int startRow, int lastRow, String kind, String search) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="select * from (select rownum R, N.* from (select * from notice where "+kind+" like ? order by num desc) N)where R between ? and ?";
		PreparedStatement pre=con.prepareStatement(sql);
		pre.setString(1, "%"+search+"%");
		pre.setInt(2, startRow);
		pre.setInt(3, lastRow);
		ResultSet rs=pre.executeQuery();

		ArrayList<NoticeDTO> ar = new ArrayList<>();
		while(rs.next()) {
			NoticeDTO noticeDTO = new NoticeDTO();
			noticeDTO.setNum(rs.getInt("num"));
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setWriter(rs.getString("writer"));
			noticeDTO.setContents(rs.getString("contents"));
			noticeDTO.setReg_date(rs.getDate("reg_date"));
			noticeDTO.setHit(rs.getInt("hit"));
			ar.add(noticeDTO);
		}
		DBConnector.disConnect(rs, pre, con);
		return ar;
	}
}
