package com.job.model;

public class UserResume {

	int resume_id;
	int user_id;
	String location;
	String city;
	String state;
	String country;
	String pincode;
	String eduactionTitle1;
	String educationFromYear1;
	String educationToYear1;
	String educationDesctiption1;
	String eduactionTitle2;
	String educationFromYear2;
	String educationToYear2;
	String educationDescription2;
	String eduactionTitle3;
	String educationFromYear3;
	String educationToYear3;
	String educationDescription3;
	String jobTitle;
	String jobLocation;
	String jobFromYear;
	String jobToYear;
	String jobDescription;
	String projectTitle1;
	String projectFromYear1;
	String projectToYear1;
	String projectDescription1;
	String projectUrl1;
	String projectTitle2;
	String projectFromYear2;
	String projectToYear2;
	String projectDescription2;
	String projectUrl2;
	String skills;
	String languages;

	public UserResume(int resume_id, int user_id, String location, String city, String state, String country,
			String pincode, String eduactionTitle1, String educationFromYear1, String educationToYear1,
			String educationDesctiption1, String eduactionTitle2, String educationFromYear2, String educationToYear2,
			String educationDescription2, String eduactionTitle3, String educationFromYear3, String educationToYear3,
			String educationDescription3, String jobTitle, String jobLocation, String jobFromYear, String jobToYear,
			String jobDescription, String skills, String languages, String projectTitle1, String projectFromYear1,
			String projectToYear1, String projectDescription1, String projectUrl1, String projectTitle2,
			String projectFromYear2, String projectToYear2, String projectDescription2, String projectUrl2) {
		super();
		this.resume_id = resume_id;
		this.user_id = user_id;
		this.location = location;
		this.city = city;
		this.state = state;
		this.country = country;
		this.pincode = pincode;
		this.eduactionTitle1 = eduactionTitle1;
		this.educationFromYear1 = educationFromYear1;
		this.educationToYear1 = educationToYear1;
		this.educationDesctiption1 = educationDesctiption1;
		this.eduactionTitle2 = eduactionTitle2;
		this.educationFromYear2 = educationFromYear2;
		this.educationToYear2 = educationToYear2;
		this.educationDescription2 = educationDescription2;
		this.eduactionTitle3 = eduactionTitle3;
		this.educationFromYear3 = educationFromYear3;
		this.educationToYear3 = educationToYear3;
		this.educationDescription3 = educationDescription3;
		this.jobTitle = jobTitle;
		this.jobLocation = jobLocation;
		this.jobFromYear = jobFromYear;
		this.jobToYear = jobToYear;
		this.jobDescription = jobDescription;
		this.projectTitle1 = projectTitle1;
		this.projectFromYear1 = projectFromYear1;
		this.projectToYear1 = projectToYear1;
		this.projectDescription1 = projectDescription1;
		this.projectUrl1 = projectUrl1;
		this.projectTitle2 = projectTitle2;
		this.projectFromYear2 = projectFromYear2;
		this.projectToYear2 = projectToYear2;
		this.projectDescription2 = projectDescription2;
		this.projectUrl2 = projectUrl2;
		this.skills = skills;
		this.languages = languages;
	}

	public int getResume_id() {
		return resume_id;
	}

	public void setResume_id(int resume_id) {
		this.resume_id = resume_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public String getEduactionTitle1() {
		return eduactionTitle1;
	}

	public void setEduactionTitle1(String eduactionTitle1) {
		this.eduactionTitle1 = eduactionTitle1;
	}

	public String getEducationFromYear1() {
		return educationFromYear1;
	}

	public void setEducationFromYear1(String educationFromYear1) {
		this.educationFromYear1 = educationFromYear1;
	}

	public String getEducationToYear1() {
		return educationToYear1;
	}

	public void setEducationToYear1(String educationToYear1) {
		this.educationToYear1 = educationToYear1;
	}

	public String getEducationDesctiption1() {
		return educationDesctiption1;
	}

	public void setEducationDesctiption1(String educationDesctiption1) {
		this.educationDesctiption1 = educationDesctiption1;
	}

	public String getEduactionTitle2() {
		return eduactionTitle2;
	}

	public void setEduactionTitle2(String eduactionTitle2) {
		this.eduactionTitle2 = eduactionTitle2;
	}

	public String getEducationFromYear2() {
		return educationFromYear2;
	}

	public void setEducationFromYear2(String educationFromYear2) {
		this.educationFromYear2 = educationFromYear2;
	}

	public String getEducationToYear2() {
		return educationToYear2;
	}

	public void setEducationToYear2(String educationToYear2) {
		this.educationToYear2 = educationToYear2;
	}

	public String getEducationDescription2() {
		return educationDescription2;
	}

	public void setEducationDescription2(String educationDescription2) {
		this.educationDescription2 = educationDescription2;
	}

	public String getEduactionTitle3() {
		return eduactionTitle3;
	}

	public void setEduactionTitle3(String eduactionTitle3) {
		this.eduactionTitle3 = eduactionTitle3;
	}

	public String getEducationFromYear3() {
		return educationFromYear3;
	}

	public void setEducationFromYear3(String educationFromYear3) {
		this.educationFromYear3 = educationFromYear3;
	}

	public String getEducationToYear3() {
		return educationToYear3;
	}

	public void setEducationToYear3(String educationToYear3) {
		this.educationToYear3 = educationToYear3;
	}

	public String getEducationDescription3() {
		return educationDescription3;
	}

	public void setEducationDescription3(String educationDescription3) {
		this.educationDescription3 = educationDescription3;
	}

	public String getJobTitle() {
		return jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	public String getJobLocation() {
		return jobLocation;
	}

	public void setJobLocation(String jobLocation) {
		this.jobLocation = jobLocation;
	}

	public String getJobFromYear() {
		return jobFromYear;
	}

	public void setJobFromYear(String jobFromYear) {
		this.jobFromYear = jobFromYear;
	}

	public String getJobToYear() {
		return jobToYear;
	}

	public void setJobToYear(String jobToYear) {
		this.jobToYear = jobToYear;
	}

	public String getJobDescription() {
		return jobDescription;
	}

	public void setJobDescription(String jobDescription) {
		this.jobDescription = jobDescription;
	}

	public String getProjectTitle1() {
		return projectTitle1;
	}

	public void setProjectTitle1(String projectTitle1) {
		this.projectTitle1 = projectTitle1;
	}

	public String getProjectFromYear1() {
		return projectFromYear1;
	}

	public void setProjectFromYear1(String projectFromYear1) {
		this.projectFromYear1 = projectFromYear1;
	}

	public String getProjectToYear1() {
		return projectToYear1;
	}

	public void setProjectToYear1(String projectToYear1) {
		this.projectToYear1 = projectToYear1;
	}

	public String getProjectDescription1() {
		return projectDescription1;
	}

	public void setProjectDescription1(String projectDescription1) {
		this.projectDescription1 = projectDescription1;
	}

	public String getProjectUrl1() {
		return projectUrl1;
	}

	public void setProjectUrl1(String projectUrl1) {
		this.projectUrl1 = projectUrl1;
	}

	public String getProjectTitle2() {
		return projectTitle2;
	}

	public void setProjectTitle2(String projectTitle2) {
		this.projectTitle2 = projectTitle2;
	}

	public String getProjectFromYear2() {
		return projectFromYear2;
	}

	public void setProjectFromYear2(String projectFromYear2) {
		this.projectFromYear2 = projectFromYear2;
	}

	public String getProjectToYear2() {
		return projectToYear2;
	}

	public void setProjectToYear2(String projectToYear2) {
		this.projectToYear2 = projectToYear2;
	}

	public String getProjectDescription2() {
		return projectDescription2;
	}

	public void setProjectDescription2(String projectDescription2) {
		this.projectDescription2 = projectDescription2;
	}

	public String getProjectUrl2() {
		return projectUrl2;
	}

	public void setProjectUrl2(String projectUrl2) {
		this.projectUrl2 = projectUrl2;
	}

	public String getSkills() {
		return skills;
	}

	public void setSkills(String skills) {
		this.skills = skills;
	}

	public String getLanguages() {
		return languages;
	}

	public void setLanguages(String languages) {
		this.languages = languages;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

}
