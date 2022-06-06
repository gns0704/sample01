package test.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.sun.net.httpserver.Authenticator.Result;

import db.JdbcUtil;
import test.vo.MembersVo;

// DAO(Data Access Object)클래스 - DB와 연동하여 CRUD 기능을 실행하는 클래스
// CRUD - CREATE/READ/UPDATE/DELETE

public class MembersDao {
	
	// 전체 회원정보를 리턴하는 메소드 코드 완성해 보세요.
	public ArrayList<MembersVo> selectAll(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;		
		try {
			con=JdbcUtil.getCon();
			String sql="select * from members";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			//select로 조회된 결과값을 담기위한 ArrayList생성
			ArrayList<MembersVo> list=new ArrayList<MembersVo>();
			while(rs.next()) {
				int num=rs.getInt("num");
				String name=rs.getString("name");
				String phone=rs.getString("phone");
				String addr=rs.getString("addr");
				Date regdate=rs.getDate("regdate");
				MembersVo vo=new MembersVo(num,name,phone,addr,regdate);
				list.add(vo);
			}	
			return list;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
		
	}
	public int delete(int num){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="delete from members where num=?";
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,num);
			int n=pstmt.executeUpdate();
			return n;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	
	public int insert(MembersVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="insert into members values(?,?,?,?,sysdate)";
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, vo.getNum());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getPhone());
			pstmt.setString(4, vo.getAddr());
			int n=pstmt.executeUpdate();
			return n;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	public MembersVo select(int num){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;		
		try {
			con=JdbcUtil.getCon();
			String sql="select * from members where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				String name=rs.getString("name");
				String phone=rs.getString("phone");
				String addr=rs.getString("addr");
				Date regdate=rs.getDate("regdate");
				MembersVo vo=new MembersVo(num,name,phone,addr,regdate);
				return vo;
			}	
			return null;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	public int update(MembersVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="update members set name=?,phone=?,addr=? where num=?";
		try {
			con=JdbcUtil.getCon();
			pstmt=con.prepareStatement(sql);		
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getPhone());
			pstmt.setString(3, vo.getAddr());
			pstmt.setInt(4, vo.getNum());
			int n=pstmt.executeUpdate();
			return n;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
}















