package admindb;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import db.CarListBean;
import db.CarReserveBean;

public class AdminRentCarDAO {

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
	
	public ArrayList<AdminCarViewBean> allReserveView(){
		ArrayList<AdminCarViewBean> arrs = new ArrayList<>();
		AdminCarViewBean bean = null;
		getCon();
		
		try {
			String sql = "select * from rentcar natural join reserve "
					+ "where to_date(sysdate,'YYYY-MM-DD') <= to_date(rday,'YYYY-MM-DD')";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				bean = new AdminCarViewBean();
				bean.setName(rs.getString(2));
				bean.setPrice(rs.getInt(4));
				bean.setImg(rs.getString(7));
				bean.setReserveno(rs.getInt(9));
				bean.setId(rs.getString(10));
				bean.setQty(rs.getInt(11));
				bean.setDday(rs.getInt(12));
				bean.setRday(rs.getString(13));
				bean.setUsein(rs.getInt(14));
				bean.setUsewifi(rs.getInt(15));
				bean.setUsenavi(rs.getInt(16));
				arrs.add(bean);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arrs;
	}
	
	public void insertCar(CarListBean bean) {
		getCon();
		try {
			String sql = "insert into rentcar values(RENTCAR_SEQ.NEXTVAL,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setInt(2, bean.getCategory());
			pstmt.setInt(3, bean.getPrice());
			pstmt.setInt(4, bean.getUsepeople());
			pstmt.setString(5, bean.getCompany());
			pstmt.setString(6, bean.getImg());
			pstmt.setString(7, bean.getInfo());
			pstmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void carListDelete(int no) {
		getCon();
		try {
			String sql = "delete from rentcar where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateCar(CarListBean bean) {
		getCon();
		try {
			String sql = "update rentcar set name=?,category=?,price=?,usepeople=?,company=?,img=?,info=? where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setInt(2, bean.getCategory());
			pstmt.setInt(3, bean.getPrice());
			pstmt.setInt(4, bean.getUsepeople());
			pstmt.setString(5, bean.getCompany());
			pstmt.setString(6, bean.getImg());
			pstmt.setString(7, bean.getInfo());
			pstmt.setInt(8, bean.getNo());
			pstmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
}
