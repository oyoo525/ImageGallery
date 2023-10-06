package imagegallery.dao;

import javax.naming.*;
import javax.sql.*;

import imagegallery.vo.Image;

import java.sql.*;
import java.util.ArrayList;

public class ImageDao {
	
	private static final String USER = "hr";
	private static final String PASS = "hr";
	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521";
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	public ImageDao() {
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	
	// 이미지 리스트 출력하기
	public ArrayList<Image> imageList() {
		
		String select = "select * from images";
		ArrayList<Image> iList = null;
		
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(select);
			rs = pstmt.executeQuery(select);
			
			iList = new ArrayList<Image>();
			
			while(rs.next()) {
				Image i = new Image();
			
				i.setNo(rs.getInt("no"));
				i.setName(rs.getString("imageId"));
				i.setImageName(rs.getString("imageName"));
				i.setImagePath(rs.getString("imagePath"));
				i.setImageContent(rs.getString("imageContent"));
				
				iList.add(i);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return iList;
	}
	
	// 이미지 한개 가져오기 (상세보기)
	public Image getImage(int no) {
		String getImageSelect = "Select * FROM  images WHERE no=?";
		
		Image i = null;
		
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(getImageSelect);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
					
			if(rs.next()) {
				i = new Image();
				i.setNo(rs.getInt("no"));
				i.setImageName(rs.getString("imageName"));
				i.setImagePath(rs.getString("imagePath"));
				i.setImageContent(rs.getString("imageContent"));
				i.setImageId(rs.getString("imageId"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
					
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return i;
	} 
	
	
	
	// 이미지 등록하기 (업로드하기)
	public void insertImage(Image i) {
		String insertSelect = "INSERT INTO images (no, imageName, imagePath, imageContent, imageId) "
										+ "VALUES(images_seq.NEXTVAL, ?, ?, ?, ?)";
		
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(insertSelect);
			pstmt.setString(1, i.getImageName());
			pstmt.setString(2, i.getImagePath());
			pstmt.setString(3, i.getImageContent());
			pstmt.setString(4, i.getId());
			
			pstmt.executeUpdate()	;
					
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
				try {
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
					
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
	}
	
	
	// 회원가입 --> 아이디 중복체크	// 중복값이면 true를 반환하기!
	public boolean checkId(String id) {
		String select = "SELECT * FROM members";
		boolean checking = false;
		
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(select);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				checking = rs.getString("id").equals(id);
			}
					
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
					
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}		
		return checking;
	}
	
	// 회원가입 --> 가입완료
	public void join(Image i) {
		String memberSelect = "INSERT INTO members (id, pass, name, phone, mail) "
										+ "VALUES (?, ?, ?, ?, ?)";
		
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(memberSelect);
			pstmt.setString(1, i.getId());
			pstmt.setString(2, i.getPass());
			pstmt.setString(3, i.getName());
			pstmt.setString(4, i.getPhone());
			pstmt.setString(5, i.getMail());
			
			pstmt.executeUpdate()	;
					
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
				try {
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
					
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
	}
	
	
}
