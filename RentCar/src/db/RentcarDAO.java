package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class RentcarDAO {

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
	
	//최신순 3대의 자동차를 리턴
	 public ArrayList<CarListBean> getSelectCar(){
			//리턴 타입을 설정 
		 	ArrayList<CarListBean> v = new ArrayList<>();
			getCon();//커넥션이 연결되어야 쿼리를 실행가능 
			
	    	try {
	    		String sql = "select * from rentcar order by no desc";
	    		pstmt = con.prepareStatement(sql);
	    		//쿼리 실행후 결과를 Result 타입으로 리턴 
	    		rs = pstmt.executeQuery();
	    		int count= 0;//최신글 3개까지만 가져오기 위한 카운트 변수
	    		
	    		while(rs.next()){
	    			CarListBean bean = new CarListBean();
	    			bean.setNo(rs.getInt(1));
	    			bean.setName(rs.getString(2));
	    			bean.setCategory(rs.getInt(3));
	    			bean.setPrice(rs.getInt(4));
	    			bean.setUsepeople(rs.getInt(5));
	    			bean.setCompany(rs.getString(6));
	    			bean.setImg(rs.getString(7));
	    			bean.setInfo(rs.getString(8));
	    			//벡터에 빈 클래스를 저장
	    			v.add(bean);
	    			count++;
	    			if(count >= 3)break;//반복문을 빠져나가시오 
	    			//3개만 벡터에 저장
	    		}
	    		con.close();
	    	}catch (Exception e) {
	    		e.printStackTrace();
	    	}
	    	return v;
	    }
	 
	 //카테고리별 자동차 리스트를 저장하는 메소드
	 public ArrayList<CarListBean> getCategoryCar(int cate){
		 
		 ArrayList<CarListBean> v = new ArrayList<>();
		 //데이터를 저장할 빈클래스 선언
		 CarListBean bean = null;
		 
		 getCon();
		 
		 try {
			String sql = "select * from rentcar where category=?";
			pstmt = con.prepareStatement(sql);
			//?
			pstmt.setInt(1, cate);
			rs = pstmt.executeQuery();
			//반복문을 돌면서 데이터를 저장
			while(rs.next()){
				//데이터를 저장할 빈클래스를 생성
    			bean = new CarListBean();
    			bean.setNo(rs.getInt(1));
    			bean.setName(rs.getString(2));
    			bean.setCategory(rs.getInt(3));
    			bean.setPrice(rs.getInt(4));
    			bean.setUsepeople(rs.getInt(5));
    			bean.setCompany(rs.getString(6));
    			bean.setImg(rs.getString(7));
    			bean.setInfo(rs.getString(8));
    			//벡터에 빈 클래스를 저장
    			v.add(bean);
    		}
			con.close();
			 
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return v;
	 }
	 public ArrayList<CarListBean> allselectCar(){
		 ArrayList<CarListBean> v = new ArrayList<>();
		 CarListBean bean = null;
		 getCon();
		 try {
			String sql = "select * from rentcar";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				bean = new CarListBean();
    			bean.setNo(rs.getInt(1));
    			bean.setName(rs.getString(2));
    			bean.setCategory(rs.getInt(3));
    			bean.setPrice(rs.getInt(4));
    			bean.setUsepeople(rs.getInt(5));
    			bean.setCompany(rs.getString(6));
    			bean.setImg(rs.getString(7));
    			bean.setInfo(rs.getString(8));
    			//벡터에 빈 클래스를 저장
    			v.add(bean);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
		 return v;
	 }
	 
	 public CarListBean getOneCar(int no) {
		 CarListBean bean = new CarListBean();
		 getCon();
		 try {
			 String sql = "select * from rentcar where no=?";
			 pstmt = con.prepareStatement(sql);
			 pstmt.setInt(1, no);
			 rs = pstmt.executeQuery();
			 if(rs.next()) {
	    			bean.setNo(rs.getInt(1));
	    			bean.setName(rs.getString(2));
	    			bean.setCategory(rs.getInt(3));
	    			bean.setPrice(rs.getInt(4));
	    			bean.setUsepeople(rs.getInt(5));
	    			bean.setCompany(rs.getString(6));
	    			bean.setImg(rs.getString(7));
	    			bean.setInfo(rs.getString(8));
				}
			 con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
		 return bean;
	 }
	 
	 //회원정보가 있는지 비교
	 public int getMember(String id,String pass) {
	    	
	    	int result=0;//0이면 회원 없음
	    	getCon();
	     	try {
	     		String sql="select count(*) from carmember where id =? and pass1 =?";
	     		pstmt = con.prepareStatement(sql);
	     		pstmt.setString(1, id);
	     		pstmt.setString(2, pass);
	     		//결과 리턴
	     		rs = pstmt.executeQuery();
	     		
	     		if(rs.next()){
	     			result = rs.getInt(1);//0또는 1값이 저장됨
	     		}
	     		con.close();
	     	}catch (Exception e){
	     		e.printStackTrace();
	     	} 	
	    	return result;		
	    }
	 public void setReserveCar(CarReserveBean bean){
	    	getCon();
	     	try {
	     		String sql="insert into reserve values(RESERVE_SEQ.NEXTVAL,?,?,?,?,?,?,?,?)";
	     		pstmt = con.prepareStatement(sql);
	     		//? 값을 대입     		
	     		pstmt.setInt(1, bean.getNo());
	     		pstmt.setString(2, bean.getId());
	     		pstmt.setInt(3, bean.getQty());
	     		pstmt.setInt(4, bean.getDday());
	     		pstmt.setString(5, bean.getRday());
	     		pstmt.setInt(6, bean.getUsein());
	     		pstmt.setInt(7, bean.getUsewifi());
	     		pstmt.setInt(8, bean.getUsenavi());
	     		
	     		//결과 리턴
	     		pstmt.executeUpdate();
	     		con.close();
	     		
	     	}catch (Exception e){
	     		e.printStackTrace();
	     	} 		
	    }
	 //회원의 예약 정보를 리턴하는 메소드
	 public ArrayList<CarViewBean> getAllReserve(String id){
		 ArrayList<CarViewBean> v = new ArrayList<>();
		 CarViewBean bean = null;
		 
		 getCon();
		 
		 try {
			String sql="select * from rentcar natural join reserve "
					+ "where to_date(sysdate,'YYYY-MM-DD') <= to_date(rday,'YYYY-MM-DD') and id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			//결과리턴
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bean = new CarViewBean();
				bean.setName(rs.getString(2));
				bean.setPrice(rs.getInt(4));
				bean.setImg(rs.getString(7));
				bean.setReserveno(rs.getInt(9));
				bean.setQty(rs.getInt(11));
				bean.setDday(rs.getInt(12));
				bean.setRday(rs.getString(13));
				bean.setUsein(rs.getInt(14));
				bean.setUsewifi(rs.getInt(15));
				bean.setUsenavi(rs.getInt(16));
				//빈클래스를 벡터에 저장
				v.add(bean);
				
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return v;
	 }
	 
	 //하나의 예약 삭제
	 public void carRemoveReserve(int reserveno) {
		 getCon();
		 
		 try {
			String sql = "delete from reserve where reserveno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, reserveno);
			pstmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	 }
}
