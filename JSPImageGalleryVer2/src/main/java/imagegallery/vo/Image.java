package imagegallery.vo;

public class Image {
	
	private String id;
	private String pass;
	private String name;
	private String phone;
	private String mail;
	
	private int no;
	private String imageName;
	private String imagePath;
	private String imageContent;
	private String imageId;
	

	private int commentNo;
	private String comment;

	public Image() {}
	public Image(String id, String pass, String name, String phone, String mail,
							int no, String imageName, String imagePath, String imageContent, 
							int commentNo, String comment) {
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.phone = phone;
		this.mail = mail;
		this.no = no;
		this.imageName = imageName;
		this.imagePath = imagePath;
		this.imageContent = imageContent;
		this.commentNo = commentNo;
		this.comment = comment;
	}
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String nickname) {
		this.name = nickname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public String getImageContent() {
		return imageContent;
	}
	public void setImageContent(String imageContent) {
		this.imageContent = imageContent;
	}
	public String getImageId() {
		return imageId;
	}
	public void setImageId(String imageId) {
		this.imageId = imageId;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	
}
