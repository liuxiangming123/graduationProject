create database courseSystem
go
use courseSystem
go

--登录表
create table Logins(
   LoginID int primary key identity(1,1),
   LoginName nvarchar(50) ,--账号
   LoginPwd int ,--密码
   LoginType int ,--类型，0:管理员 1:学生
   stuID int foreign key references Students(stuID)
)
insert into Logins(LoginName,LoginPwd,LoginType,stuID) values('201817380114','123','1','2'),('admin','147','0','1')
insert into Logins(LoginName,LoginPwd,LoginType,stuID) values('201817380113','123','1',null)


--学生信息表
create table Students(
   stuID int primary key identity(1,1),
   classID int foreign key references Class(classID),--班级外键
   stuNumber  nvarchar(50) , --学号
   stuName nvarchar(50),--学生姓名
   stuSex  int,--0:女 1:男
   stuPhone int,--电话
   stuGrade int ,--年级
   stuDeaprtment nvarchar(50),--院系
   stuMajor nvarchar(100),--专业
   stuRemark nvarchar(100) --备注
)

--课程表
create table Courses(
   courseID int primary key identity(1,1),
   courseName nvarchar(50),--课程名称
   courseScorse int,--课程学分
   courseCapacity int ,--课容量
   courseCompus nvarchar(50),--校区
   courseUnit nvarchar(50),--开课单位
   courseStart nvarchar(50),--上课时间--星期几第几节那几周
   coursePlace  nvarchar(50),--上课地点
   courseRemark nvarchar(50)--备注

)

--老师表
create table Teachers(
    teaID int primary key identity(1,1),
	teaName nvarchar(50),--姓名
	teaSex  int ,--0:女 1:男
	teaPhone int, --电话
	teaHireDate nvarchar(50),  --入职时间
	teaPatent  nvarchar(50),--民族
	teaProfessional nvarchar(50),--职称
	teaDegree  nvarchar(50),--学位
	teaEdcation  nvarchar(50),--学历
	teaDuty nvarchar(50),--职务
	DepID int foreign key references Departments(DepID),--连接所属院系ID
	teaReamrk  nvarchar(50)  --简介
)

--院系表
create table Departments(
    DepID int primary key identity(1,1),
	DepName nvarchar(100),--名称
)
--班级表
create table Class(
  classID int primary key identity(1,1),
  className nvarchar(50),--班级名称
  classNumber int ,--班级编号
  teaID int foreign key references Teachers(teaID),--老师表外键（辅导员）
  classNum int --最大选课数量

)

--课程学生关系表
create table Course_Student(
  ID int primary key identity(1,1),
  C_ID int foreign key references Courses(courseID), --连接课程表ID
  S_ID int foreign key references Students(stuID), --连接学生表ID
  delete_ID int --用于搞历史课表 0：删除 1：选择

)
--课程老师关系表
create table Course_Teacher(
   ID int primary key identity(1,1),
   C_ID int foreign key references Courses(courseID),--连接课程表ID
   T_ID int foreign key references Teachers(teaID)--连接老师表ID

)


select * from Course_Teacher a,Courses b where a.C_ID=b.courseID