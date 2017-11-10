package com.iu.qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.util.DBConnector;


public class QnaDAO {
	
	public int relpy(QnaDTO qnaDTO, QnaDTO parent) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="update qna set step=setp+1 where ref=? and step>?";
		PreparedStatement pre=con.prepareStatement(sql);
		pre.setInt(1, qnaDTO.getRef());
		pre.setInt(2, qnaDTO.getStep());
		
		String sql2="insert into qna values(qna_seq.nextval,?,?,?,0,sysdate,?,?,?)";
		pre=con.prepareStatement(sql2);
		pre.setString(1, qnaDTO.getTitle());
		pre.setString(2, qnaDTO.getContents());
		pre.setString(3, qnaDTO.getWriter());
		pre.setInt(4, parent.getRef());
		pre.setInt(5, parent.getStep()+1);
		pre.setInt(6, parent.getDepth()+1);
		int result=pre.executeUpdate();
		DBConnector.disConnect(pre, con);
		return result;

	}
	
	public int getTotalCount(String kind, String search) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="select nvl(count(num),0) from qna where "+kind+" like ?";
		PreparedStatement pre=con.prepareStatement(sql);
		pre.setString(1, "%"+search+"%");
		ResultSet rs=pre.executeQuery();
		rs.next();
		int totalCount=rs.getInt(1);
		DBConnector.disConnect(rs, pre, con);
		return totalCount;
	}
	
	public int hitUpdate(int num) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="update qna set hit=hit+1 where num=?";
		PreparedStatement pre=con.prepareStatement(sql);
		pre.setInt(1, num);
		int result=pre.executeUpdate();
		DBConnector.disConnect(pre, con);
		return result;
	}
	
	public int update(QnaDTO qnaDTO) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="update qna set title=?, contents=? where num=?";
		PreparedStatement pre=con.prepareStatement(sql);
		pre.setString(1, qnaDTO.getTitle());
		pre.setString(2, qnaDTO.getContents());
		pre.setInt(3, qnaDTO.getNum());
		int result=pre.executeUpdate();
		DBConnector.disConnect(pre, con);
		return result;
	}
	
	public int delete(int num) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="delete qna where num=?";
		PreparedStatement pre=con.prepareStatement(sql);
		pre.setInt(1, num);
		int result = pre.executeUpdate();
		DBConnector.disConnect(pre, con);
		return result;
	}
	
	
	public int insert(QnaDTO qnaDTO) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="insert into qna values(qna_seq.nextval,?,?,?,0,sysdate, qna_seq.currval, 0, 0)";
		PreparedStatement pre=con.prepareStatement(sql);
		pre.setString(1, qnaDTO.getTitle());
		pre.setString(2, qnaDTO.getContents());
		pre.setString(3, qnaDTO.getWriter());
		int result=pre.executeUpdate();
		DBConnector.disConnect(pre, con);
		return result;
	}
	
	public QnaDTO selectOne(int num) throws Exception{
		Connection con=DBConnector.getConnect();
		QnaDTO qnaDTO = null;
		String sql="select * from qna where num=?";
		PreparedStatement pre=con.prepareStatement(sql);
		pre.setInt(1, num);
		ResultSet rs=pre.executeQuery();
		if(rs.next()) {
			qnaDTO = new QnaDTO();
			qnaDTO.setNum(rs.getInt("num"));
			qnaDTO.setTitle(rs.getString("title"));
			qnaDTO.setContents(rs.getString("contents"));
			qnaDTO.setWriter(rs.getString("writer"));
			qnaDTO.setHit(rs.getInt("hit"));
			qnaDTO.setReg_date(rs.getDate("reg_date"));
			qnaDTO.setRef(rs.getInt("ref"));
			qnaDTO.setStep(rs.getInt("step"));
			qnaDTO.setDepth(rs.getInt("depth"));
		}
		DBConnector.disConnect(rs, pre, con);
		return qnaDTO;
		
	}
	
	public ArrayList<QnaDTO> selectList(int startRow, int lastRow, String kind, String search ) throws Exception{
		Connection con=DBConnector.getConnect();
		String sql="select * from (select rownum R, N.* from (select * from qna where "+kind+" like ? order by num desc) N) where R between ? and ? order by ref desc , step asc";
		PreparedStatement pre=con.prepareStatement(sql);
		pre.setString(1, "%"+search+"%");
		pre.setInt(2, startRow);
		pre.setInt(3, lastRow);
		ResultSet rs=pre.executeQuery();
		ArrayList<QnaDTO> ar= new ArrayList<>();
		while(rs.next()) {
			QnaDTO qnaDTO=new QnaDTO();
			qnaDTO.setNum(rs.getInt("num"));
			qnaDTO.setTitle(rs.getString("title"));
			qnaDTO.setContents(rs.getString("contents"));
			qnaDTO.setWriter(rs.getString("writer"));
			qnaDTO.setHit(rs.getInt("hit"));
			qnaDTO.setReg_date(rs.getDate("reg_date"));
			qnaDTO.setRef(rs.getInt("ref"));
			qnaDTO.setStep(rs.getInt("step"));
			qnaDTO.setDepth(rs.getInt("depth"));
			ar.add(qnaDTO);
		}
			DBConnector.disConnect(rs, pre, con);
			return ar;
		}

}
