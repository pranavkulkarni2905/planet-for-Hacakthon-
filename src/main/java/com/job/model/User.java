package com.job.model;

public class User {

int user_id,login_status;
	
    String about,username,first_name,middle_name,last_name,gender,dob,phon_no, profile_photo,email_id,password,linkedin_url,github_url,portfolio_url,registered_time,logout_time,verified;

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getLogin_status() {
		return login_status;
	}

	public void setLogin_status(int login_status) {
		this.login_status = login_status;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getMiddle_name() {
		return middle_name;
	}

	public void setMiddle_name(String middle_name) {
		this.middle_name = middle_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getPhon_no() {
		return phon_no;
	}

	public void setPhon_no(String phon_no) {
		this.phon_no = phon_no;
	}

	public String getProfile_photo() {
		return profile_photo;
	}

	public void setProfile_photo(String profile_photo) {
		this.profile_photo = profile_photo;
	}

	public String getEmail_id() {
		return email_id;
	}

	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLinkedin_url() {
		return linkedin_url;
	}

	public void setLinkedin_url(String linkedin_url) {
		this.linkedin_url = linkedin_url;
	}

	public String getGithub_url() {
		return github_url;
	}

	public void setGithub_url(String github_url) {
		this.github_url = github_url;
	}

	public String getPortfolio_url() {
		return portfolio_url;
	}

	public void setPortfolio_url(String portfolio_url) {
		this.portfolio_url = portfolio_url;
	}

	public String getRegistered_time() {
		return registered_time;
	}

	public void setRegistered_time(String registered_time) {
		this.registered_time = registered_time;
	}

	public String getLogout_time() {
		return logout_time;
	}

	public void setLogout_time(String logout_time) {
		this.logout_time = logout_time;
	}

	public String getVerified() {
		return verified;
	}

	public void setVerified(String verified) {
		this.verified = verified;
	}

	public User(int user_id,  String username, String first_name, String middle_name, String last_name,
			String gender, String dob, String phon_no, String profile_photo, String email_id, String password,
			String linkedin_url, String github_url, String portfolio_url, int login_status,String registered_time, String logout_time,
			String verified,String about) {
		super();
		this.user_id = user_id;
		
		this.username = username;
		this.first_name = first_name;
		this.middle_name = middle_name;
		this.last_name = last_name;
		this.gender = gender;
		this.dob = dob;
		this.phon_no = phon_no;
		this.profile_photo = profile_photo;
		this.email_id = email_id;
		this.password = password;
		this.linkedin_url = linkedin_url;
		this.github_url = github_url;
		this.portfolio_url = portfolio_url;
		this.login_status = login_status;
		this.registered_time = registered_time;
		this.logout_time = logout_time;
		this.verified = verified;
		this.about=about;
	}
    
}
