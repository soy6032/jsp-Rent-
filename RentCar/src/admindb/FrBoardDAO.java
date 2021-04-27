package admindb;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class FrBoardDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	//커넥션풀을 이용한 DB연결
	
	public void getCon() {
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");
			DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void insertBoard(FrBoardBean bean) {
		getCon();
		
		try {
			String sql = "insert into freeboard values(frboard_seq.NEXTVAL,?,?,?,SYSDATE,0,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getUserid());
			pstmt.setString(2, bean.getSubject());
			pstmt.setString(3, bean.getImg());
			pstmt.setString(4, bean.getContents());
			pstmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<FrBoardBean> allSelectBoard(){
		ArrayList<FrBoardBean> arrs = new ArrayList<>();
		FrBoardBean bean = null;
		getCon();
		
		try{
			String sql = "select * from freeboard order by no DESC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bean = new FrBoardBean();
				bean.setNo(rs.getInt(1));
				bean.setUserid(rs.getString(2));
				bean.setSubject(rs.getString(3));
				bean.setImg(rs.getString(4));
				bean.setBdate(rs.getString(5));
				bean.setReadcount(rs.getInt(6));
				bean.setContents(rs.getString(7));
				arrs.add(bean);
				
			}
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return arrs;
	}
	
}
