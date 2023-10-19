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
	
	// 게시글 개수 호출 메소드
	public int getImageCount() {
		String select = "SELECT COUNT(*) FROM images";
		int count = 0;
		
		try{			
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(select);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				count = rs.getInt(1);
			}			
		} catch(Exception e) {			
			e.printStackTrace();
		} finally {			
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch(SQLException e) {}
		}
		return count;
	}
	public int getImageCount(String keyword) {
		String select = "SELECT COUNT(*) FROM images WHERE imageId LIKE ? OR imageName LIKE ? OR imageContent LIKE ?";
		int count = 0;
		
		try{			
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(select);
			pstmt.setString(1, "%"+ keyword + "%");
			pstmt.setString(2, "%"+ keyword + "%");
			pstmt.setString(3, "%"+ keyword + "%");
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				count = rs.getInt(1);
			}			
		} catch(Exception e) {			
			e.printStackTrace();
		} finally {			
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch(SQLException e) {}
		}
		return count;
	}
	
	// 이미지 리스트 출력하기 (최신순)
	public ArrayList<Image> imageList(int startRow, int endRow) {
		
		String select = "SELECT * FROM "
				+ "(SELECT ROWNUM num, i.* FROM "
				+ "(select * from images ORDER BY no DESC) i) "
				+ "WHERE num BETWEEN ? AND ?";
		ArrayList<Image> iList = null;
		
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(select);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			
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
	// 이미지 리스트 출력하기 (검색 및 최신순)
	public ArrayList<Image> imageList(String keyword, int startRow, int endRow) {
		
		String select = "SELECT * FROM "
				+ "(SELECT ROWNUM num, i.* FROM "
				+ "(select * from images WHERE imageName LIKE ? OR imageContent LIKE ? OR imageId LIKE ? "
				+ "ORDER BY no DESC) i) "
				+ "WHERE num BETWEEN ? AND ?";
		ArrayList<Image> iList = null;
		
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(select);
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setString(2, "%" + keyword + "%");
			pstmt.setString(3, "%" + keyword + "%");
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			rs = pstmt.executeQuery();
			
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
	
	// 이미지 리스트 출력하기 (조회수순)
	public ArrayList<Image> imageListView(int startRow, int endRow) {
		
		String select = "SELECT * FROM "
				+ "(SELECT ROWNUM num, i.* FROM "
				+ "(select * from images ORDER BY readCount DESC) i) "
				+ "WHERE num BETWEEN ? AND ?";
		ArrayList<Image> iList = null;
		
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(select);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			
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
	// 이미지 리스트 출력하기 (검색 및 조회수순)
	public ArrayList<Image> imageListView(String keyword, int startRow, int endRow) {
		
		String select = "SELECT * FROM "
				+ "(SELECT ROWNUM num, i.* FROM "
				+ "(select * from images WHERE imageName LIKE ? OR imageContent LIKE ? OR imageId LIKE ? "
				+ "ORDER BY readCount DESC) i) "
				+ "WHERE num BETWEEN ? AND ?";
		ArrayList<Image> iList = null;
		
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(select);
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setString(2, "%" + keyword + "%");
			pstmt.setString(3, "%" + keyword + "%");
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			rs = pstmt.executeQuery();
			
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
	
	// 본인계정 이미지 리스트 출력
	public ArrayList<Image> imageList(String id) {
		
		String select = "select * from images WHERE imageId=? ORDER BY no DESC";
		ArrayList<Image> iList = null;
		
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(select);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
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
	// 좋아요 이미지 리스트 출력
	public ArrayList<Image> likeImageList(String id) {
		
		String select = "select i.* from likes l, images i  WHERE l.imageno = i.no AND l.likeId=?";
		ArrayList<Image> iList = null;
		
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(select);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
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
		String getImageSelect = "SELECT i.* ,(select count(*) from likes WHERE imageno=?) as 카운트 FROM images i WHERE no=?";
		
		Image i = null;
		
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(getImageSelect);
			pstmt.setInt(1, no);
			pstmt.setInt(2, no);
			rs = pstmt.executeQuery();
					
			if(rs.next()) {
				i = new Image();
				i.setNo(rs.getInt("no"));
				i.setImageName(rs.getString("imageName"));
				i.setImagePath(rs.getString("imagePath"));
				i.setImageContent(rs.getString("imageContent"));
				i.setImageId(rs.getString("imageId"));
				i.setLikeCount(rs.getInt("카운트"));
				i.setReadCount(rs.getInt("readCount"));
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
	
	// 이미지 수정하기
	public void updateImage(Image i) {
		String updateSelect = "UPDATE images SET imageName=?, imagePath=?, imageContent=?, imageId=? WHERE no=?";
		
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(updateSelect);
			pstmt.setString(1, i.getImageName());
			pstmt.setString(2, i.getImagePath());
			pstmt.setString(3, i.getImageContent());
			pstmt.setString(4, i.getImageId());
			pstmt.setInt(5, i.getNo());
			
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
	
	// 이미지 삭제하기
	public void deleteImage(Image i) {
		String updateSelect = "DELETE FROM images WHERE no=?";
		
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(updateSelect);
			pstmt.setInt(1, i.getNo());
			
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
	// 탈퇴시 이미지 삭제하기
	public void deleteImage(String id) {
		String updateSelect = "DELETE FROM images WHERE imageId=?";
		
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(updateSelect);
			pstmt.setString(1, id);
			
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
	public boolean checkId(Image i) {
		String select = "SELECT * FROM members WHERE id=?";
		boolean checking = false;
		
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(select);
			pstmt.setString(1, i.getId());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				checking = rs.getString("id").equals(i.getId());
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
	
	// 로그인 하기
	public boolean login(String id, String pass) {
		boolean login = false;
		String loginSelect = "SELECT * FROM members WHERE id=?";
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(loginSelect);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				login = rs.getString("pass").equals(pass);
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
		return login;
	}
	
	// 비밀번호 확인하기
	public boolean passCheck(Image i) {
		boolean check = false;
		String select = "SELECT * FROM members WHERE id=?";
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(select);
			pstmt.setString(1, i.getId());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				check = rs.getString("pass").equals(i.getPass());
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
		return check;
	}
	
	// 회원정보 가져오기
	public Image memberInfo(Image i) {
		Image member = null;
		String select = "SELECT * FROM members WHERE id=?";
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(select);
			pstmt.setString(1, i.getId());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member= new Image();
				member.setId(rs.getString("id"));
				member.setPass(rs.getNString("pass"));
				member.setName(rs.getString("name"));
				member.setPhone(rs.getString("phone"));
				member.setMail(rs.getString("mail"));
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
		return member;
	}
	
	// 회원정보 수정하기
	public void updateMemberInfo(Image i) {
		String updateSelect = "UPDATE members SET name=?, pass=?, phone=?, mail=? WHERE id=?";
		
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(updateSelect);
			pstmt.setString(1, i.getName());
			pstmt.setString(2, i.getPass());
			pstmt.setString(3, i.getPhone());
			pstmt.setString(4, i.getMail());
			pstmt.setString(5, i.getId());
			
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
	
	// 회원 탈퇴하기 
	public void deleteMember(Image i) {
		String updateSelect = "DELETE FROM members WHERE id=?";
		
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(updateSelect);
			pstmt.setString(1, i.getId());
			
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
	
	// 회원 비밀번호 찾기
	public String findPass(Image i) {
		String pass = "";
		String select = "SELECT * FROM members WHERE id=? AND phone=?";
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(select);
			pstmt.setString(1, i.getId());
			pstmt.setString(2, i.getPhone());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pass = rs.getString("pass");
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
		
		return pass;
	}
	
	
	
	// 댓글 남기기
	public void insertComment(Image i) {
		String insertSelect = "INSERT INTO comments (commentNO, commentID, commentes, imageNo) "
										+ "VALUES (comments_seq.NEXTVAL, ?, ?, ?)";
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(insertSelect);
			pstmt.setString(1, i.getId());
			pstmt.setString(2, i.getComment());
			pstmt.setInt(3, i.getNo());
			
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
	
	// 댓글 수정하기
	public void updateComment(Image i) {
		String updateSelect = "UPDATE comments SET commentes=? WHERE commentNO=?";
		
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(updateSelect);
			pstmt.setString(1, i.getComment());
			pstmt.setInt(2, i.getCommentNo());
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
	
	// 댓글 삭제하기
	public void deleteComment(Image i) {
		String updateSelect = "DELETE comments WHERE commentNo = ?";
		
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(updateSelect);
			pstmt.setInt(1, i.getCommentNo());
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
	// 탈퇴시 댓글 삭제하기
	public void deleteComment(String id) {
		String updateSelect = "DELETE comments WHERE commentID = ?";
		
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(updateSelect);
			pstmt.setString(1, id);
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
	
	// 댓글 리스트 출력하기
	public ArrayList<Image> commentList(Image img) {
		
		String select = "select * from comments WHERE imageNO=? ORDER BY commentNO DESC";
		ArrayList<Image> cList = null;
		
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(select);
			pstmt.setInt(1, img.getNo());
			rs = pstmt.executeQuery();
			
			cList = new ArrayList<Image>();
			
			while(rs.next()) {
				Image i = new Image();
			
				i.setCommentNo(rs.getInt("commentNO"));
				i.setId(rs.getString("commentID"));
				i.setComment(rs.getString("commentes"));
				i.setNo(rs.getInt("imageNO"));
				
				cList.add(i);
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
		return cList;
	}
	// 내가 쓴 댓글 리스트 출력하기
	public ArrayList<Image> commentList(String id) {
		
		String select = "select * from comments c, images i "
				+ "    WHERE c.imageNo = i.no AND c.commentID=? ORDER BY c.commentNO DESC";
		ArrayList<Image> cList = null;
		
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(select);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			cList = new ArrayList<Image>();
			
			while(rs.next()) {
				Image i = new Image();
			
				i.setCommentNo(rs.getInt("commentNO"));
				i.setId(rs.getString("commentID"));
				i.setComment(rs.getString("commentes"));
				i.setNo(rs.getInt("imageNO"));
				i.setImagePath(rs.getString("imagePath"));
				
				cList.add(i);
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
		return cList;
	}
	
	// 검색해서 이미지리스트 출력하기
	public ArrayList<Image> searchImage(String keyword) {
		
		String select = "select * from images WHERE imageName LIKE ? OR imageContent Like ? "
				+ "OR imageId Like ? ORDER BY no DESC";
		
		ArrayList<Image> iList = null;
		
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(select);
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setString(2, "%" + keyword + "%");
			pstmt.setString(3, "%" + keyword + "%");
			
			rs = pstmt.executeQuery();
			
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
	
	// 좋아요 버튼 눌렀을 때 기존에 값이 있는지 확인하기
	public boolean likeCheck(Image i) {
		boolean check = false;
		String select = "SELECT * FROM likes WHERE likeId=? AND imageNO=?";
		
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(select);
			pstmt.setString(1, i.getId());
			pstmt.setInt(2, i.getNo());
			rs = pstmt.executeQuery();
			
			if(rs.next()) check = true;
			
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
		return check;
	}
	
	// likeValue 1로 만들기 (좋아요 누르기)
	public void likeValueInsert(Image i) {
		String select = "INSERT INTO likes (imageNo, likeId, likeValue) VALUES (?, ?, 1)";
		
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(select);
			pstmt.setInt(1, i.getNo());
			pstmt.setString(2, i.getId());
			pstmt.executeUpdate()	;
			
			
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
	}
	
	// likeValue 없애기 (좋아요 취소)
	public void likeValueDelete(Image i) {
		String select = "DELETE FROM likes WHERE imageNo=? AND likeId=?";
		
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(select);
			pstmt.setInt(1, i.getNo());
			pstmt.setString(2, i.getId());
			pstmt.executeUpdate()	;
			
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
	}
	
	// 조회수 조회하기
	public int readCount(int no) {
		int count = 0;
		String select = "SELECT * FROM images WHERE no=?";
	
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(select);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) count = rs.getInt("readCount");
			
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
		return count;
	}
	
	// 조회수 증가하기
	public void readCountUp(int no, int count) {
		String select = "UPDATE images SET readCount=? WHERE no=?";
	
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			pstmt = conn.prepareStatement(select);
			pstmt.setInt(1, count);
			pstmt.setInt(2, no);
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
