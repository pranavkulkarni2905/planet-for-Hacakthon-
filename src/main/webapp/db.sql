1.USER
create table job_user(
user_id number primary key,
username varchar2(4000),
first_name varchar2(4000),
middle_name varchar2(4000),
last_name varchar2(4000),
gender varchar2(4000),
dob varchar2(4000),
phon_no varchar2(100), 
profile_photo varchar2(3000),
email_id varchar2(4000),
password varchar2(4000),
linkedin_url varchar2(4000),
github_url varchar2(4000),
portfolio_url varchar2(4000),
login_status number,
registered_time varchar2(4000),
logout_time varchar2(4000)
);
alter table job_user add verified varchar2(4000);
alter table job_user add about varchar2(4000);

create sequence job_user_seq
start with 1
increment by 1;


create or replace trigger job_user_trig
before insert on job_user
for each row
begin
select job_user_seq.nextval into :new.user_id from dual;
end;
=================================================================
2.Resume

create table user_resume(
resume_id number primary key,
user_id number,
location varchar2(4000),
city varchar2(4000),
state varchar2(4000),
country varchar2(4000),
pincode varchar2(4000),
edu_title1 varchar2(4000),
edu_from1 varchar2(4000),
edu_to1 varchar2(4000),
edu_desc1 varchar2(4000),
edu_title2 varchar2(4000),
edu_from2 varchar2(4000),
edu_to2 varchar2(4000),
edu_desc2 varchar2(4000),

edu_title3 varchar2(4000),
edu_from3 varchar2(4000),
edu_to3 varchar2(4000),
edu_desc3 varchar2(4000),

job_title varchar2(4000),
job_location varchar2(4000),
job_from varchar2(4000),
job_to varchar2(4000),
job_desc varchar2(4000),

skills varchar2(4000),
languages varchar2(4000),
proj_title1 varchar2(4000),
proj_from1 varchar2(4000),
proj_to1 varchar2(4000),
proj_desc1 varchar2(4000),
proj_url1 varchar2(4000),
proj_title2 varchar2(4000),
proj_from2 varchar2(4000),
proj_to2 varchar2(4000),
proj_desc2 varchar2(4000),
proj_url2 varchar2(4000)
);

alter table edu1 add about varchar2(4000);
alter table edu2 add about varchar2(4000);
alter table edu3 add about varchar2(4000);

alter table exp add about varchar2(4000);



create sequence user_resume_seq
start with 1
increment by 1;


create or replace trigger user_resume_trig
before insert on user_resume
for each row
begin
select user_resume_seq.nextval into :new.resume_id from dual;
end;

=====================================================
3.Recruiter profile

create table recrutier_profile(
recruiter_id number primary key,
hr_name varchar2(4000),
hr_phone varchar2(4000),
hr_email varchar2(4000),
company_name varchar2(4000),
registration_no varchar2(4000),
registration_date varchar2(4000),
company_website varchar2(4000),
industry_name varchar2(4000),
contact_email varchar2(4000),
contact_phone varchar2(4000),
company_logo varchar2(4000),
company_desc varchar2(4000),
company_size varchar2(4000),
company_city varchar2(4000),
company_state varchar2(4000),
company_country varchar2(4000),
linkedin_url varchar2(4000),
twitter_url varchar2(4000),
facebook_url varchar2(2000),
verified varchar2(4000)
);
alter table recrutier_profile add password varchar2(4000);

create sequence recruiter_profile_seq
start with 1
increment by 1;


create or replace trigger recruiter_profile_trig
before insert on recrutier_profile
for each row
begin
select recruiter_profile_seq.nextval into :new.recruiter_id from dual;
end;


=======================================
4.Job 

create table job_post(
job_id number primary key,
recruiter_id number,
company_name varchar2(4000),
job_title varchar2(4000),
jo_type varchar2(4000),
job_vaccancy varchar2(4000),
job_location varchar2(4000),
salary varchar2(4000),
deadline varchar2(4000),
job_desc varchar2(4000),
skill_qualification varchar2(4000),
posted_date varchar2(4000)
);

create sequence job_post_seq
start with 1
increment by 1;


create or replace trigger job_post_trig
before insert on job_post
for each row
begin
select job_post_seq.nextval into :new.job_id from dual;
end;
======================================

5. job Apply
create table job_apply(
app_id number primary key,
recrutier_id number,
user_id number,
job_id number,
resume_pdf varchar2(4000),
ques1 varchar2(4000),
ques2 varchar2(4000),
resume_status varchar2(4000),
apti_score number,
apti_status varchar2(4000),
interview_status varchar2(4000),
submitted_date varchar2(4000)
);
alter table job_apply  add corrected number;

create sequence job_apply_seq
start with 1
increment by 1;


create or replace trigger job_apply_trig
before insert on job_apply
for each row
begin
select job_apply_seq.nextval into :new.app_id from dual;
end;
=============================================

6. Non-IT Job

create table non_it_job_post(
job_id number primary key,
job_title varchar2(4000),
jo_type varchar2(4000),
job_vaccancy varchar2(4000),
job_location varchar2(4000),
salary varchar2(4000),
deadline varchar2(4000),
job_desc varchar2(4000),
skill_qualification varchar2(4000),
posted_date varchar2(4000)
);

create sequence non_it_job_post_seq
start with 1
increment by 1;


create or replace trigger non_it_job_post_trig
before insert on non_it_job_post
for each row
begin
select non_it_job_post_seq.nextval into :new.job_id from dual;
end;
======================================
7. Notification


create table notification(
    userid number(10),
    notify_id number(10),
    msg varchar2(4000)
);
create sequence seq_not
start with 1
increment by 1;

create or replace trigger trig_not
before insert on notification
for each row
begin
select seq_not.nextval into :new.notify_id from dual;
end;
======================================