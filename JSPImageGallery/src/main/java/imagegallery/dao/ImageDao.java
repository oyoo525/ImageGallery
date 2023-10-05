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
		
		String select = "SELECT * FROM images i, comments c WHERE i.no = c.imageNo";
		ArrayList<Image> iList = null;
		
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(select);
			rs = pstmt.executeQuery();
			
			iList = new ArrayList<Image>();
			
			while(rs.next()) {
				Image i = new Image();
			
				i.setNo(rs.getInt("no"));
				i.setName(rs.getString("name"));
				i.setImageName(rs.getString("imageName"));
				i.setImagePath(rs.getString("imagePath"));
				i.setImageContent(rs.getString("imageContent"));
				i.setComment(rs.getString("commnet"));
				
				iList.add(i);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		
		} finally {
			try {
				if(rs != null)rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return iList;
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
	
	
	
}
