package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	public void getCon() {
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");
			DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
			con = ds.getConnection();//커넥션 연결해주는 메소드
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//전체글의 갯수를 리턴하는 메서드
	public int getAllCount() {
		getCon();
		//게시글 전체수를 저장하는 변수
		int count = 0;
		try {

			String sql = "select count(*) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);//전체 게시글 수 리턴
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public ArrayList<BoardBean> getAllBoard(int start, int end){
		ArrayList<BoardBean> arr = new ArrayList<>();
		getCon();
		try {
			String sql = "select * from (select A.*, Rownum Rnum from(select * from board order by ref desc, re_level asc)A) " 
					+ "where Rnum >= ? and Rnum <= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			//데이터갯수가 몇개인지 몰르기에 반복문을 이용하여 데이터 추출
			while(rs.next()) {
				//데이터를 패키징(boaedBean클래스를 이용)
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSebject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
				//패키징한 데이터를 백터(v)에 저장
				arr.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arr;
	}
}
