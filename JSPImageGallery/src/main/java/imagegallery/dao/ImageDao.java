package imagegallery.dao;

import javax.naming.*;
import javax.sql.*;

import imagegallery.vo.Image;

import java.sql.*;
import java.util.ArrayList;

public class ImageDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public ImageDao() {
		try {
			InitialContext initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/bbsDBPool");
			
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	
	// 이미지 리스트 출력하기
	public ArrayList<Image> imageList() {
		
		String select = "SELECT * FROM images i, members m, comments c WHERE i.id = m.id AND i.no = c.no";
		ArrayList<Image> iList = null;
		
		try {
			conn = ds.getConnection();
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
	
	
	
}
