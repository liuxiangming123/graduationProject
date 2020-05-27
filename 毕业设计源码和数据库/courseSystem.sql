create database courseSystem
go
use courseSystem
go

--��¼��
create table Logins(
   LoginID int primary key identity(1,1),
   LoginName nvarchar(50) ,--�˺�
   LoginPwd int ,--����
   LoginType int ,--���ͣ�0:����Ա 1:ѧ��
   stuID int foreign key references Students(stuID)
)
insert into Logins(LoginName,LoginPwd,LoginType,stuID) values('201817380114','123','1','2'),('admin','147','0','1')
insert into Logins(LoginName,LoginPwd,LoginType,stuID) values('201817380113','123','1',null)


--ѧ����Ϣ��
create table Students(
   stuID int primary key identity(1,1),
   classID int foreign key references Class(classID),--�༶���
   stuNumber  nvarchar(50) , --ѧ��
   stuName nvarchar(50),--ѧ������
   stuSex  int,--0:Ů 1:��
   stuPhone int,--�绰
   stuGrade int ,--�꼶
   stuDeaprtment nvarchar(50),--Ժϵ
   stuMajor nvarchar(100),--רҵ
   stuRemark nvarchar(100) --��ע
)

--�γ̱�
create table Courses(
   courseID int primary key identity(1,1),
   courseName nvarchar(50),--�γ�����
   courseScorse int,--�γ�ѧ��
   courseCapacity int ,--������
   courseCompus nvarchar(50),--У��
   courseUnit nvarchar(50),--���ε�λ
   courseStart nvarchar(50),--�Ͽ�ʱ��--���ڼ��ڼ����Ǽ���
   coursePlace  nvarchar(50),--�Ͽεص�
   courseRemark nvarchar(50)--��ע

)

--��ʦ��
create table Teachers(
    teaID int primary key identity(1,1),
	teaName nvarchar(50),--����
	teaSex  int ,--0:Ů 1:��
	teaPhone int, --�绰
	teaHireDate nvarchar(50),  --��ְʱ��
	teaPatent  nvarchar(50),--����
	teaProfessional nvarchar(50),--ְ��
	teaDegree  nvarchar(50),--ѧλ
	teaEdcation  nvarchar(50),--ѧ��
	teaDuty nvarchar(50),--ְ��
	DepID int foreign key references Departments(DepID),--��������ԺϵID
	teaReamrk  nvarchar(50)  --���
)

--Ժϵ��
create table Departments(
    DepID int primary key identity(1,1),
	DepName nvarchar(100),--����
)
--�༶��
create table Class(
  classID int primary key identity(1,1),
  className nvarchar(50),--�༶����
  classNumber int ,--�༶���
  teaID int foreign key references Teachers(teaID),--��ʦ�����������Ա��
  classNum int --���ѡ������

)

--�γ�ѧ����ϵ��
create table Course_Student(
  ID int primary key identity(1,1),
  C_ID int foreign key references Courses(courseID), --���ӿγ̱�ID
  S_ID int foreign key references Students(stuID), --����ѧ����ID
  delete_ID int --���ڸ���ʷ�α� 0��ɾ�� 1��ѡ��

)
--�γ���ʦ��ϵ��
create table Course_Teacher(
   ID int primary key identity(1,1),
   C_ID int foreign key references Courses(courseID),--���ӿγ̱�ID
   T_ID int foreign key references Teachers(teaID)--������ʦ��ID

)


select * from Course_Teacher a,Courses b where a.C_ID=b.courseID