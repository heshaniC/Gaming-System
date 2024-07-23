package pkg.getgame.model;

public class Contact {
	private int id;
	private String email;
	private String title;
	private String message;
	
	public Contact() {
		
	}

	public Contact(int id, String email, String title, String message) {
		this.id = id;
		this.email = email;
		this.title = title;
		this.message = message;
	}
	
	public Contact(String email, String title, String message) {
		this.email = email;
		this.title = title;
		this.message = message;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "Contact [id=" + id + ", email=" + email + ", title=" + title + ", message=" + message + "]";
	}
	
	
	
	
}
