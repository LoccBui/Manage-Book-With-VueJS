Create database QLSach
Go
Use QLSach

--drop database QLSach

CREATE TABLE [dbo].[NhaXuatBan](
	[MaNXB] [int] IDENTITY(1,1) NOT NULL,
	[TenNXB] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[DienThoai] [decimal](18, 0) NULL,
	[Image] [nvarchar](100) NULL,
 CONSTRAINT [PK_NhaXuatBan] PRIMARY KEY CLUSTERED 
(
	[MaNXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[Sach](
	[MaSach] [int] IDENTITY(1,1) NOT NULL,
	[TenSach] [nvarchar](100) NULL,
	[MoTa] [nvarchar](max) NULL,
	[NgayCapNhat] [datetime] NULL,
	[MaNXB] [int] NULL,
	[Image] [nvarchar](100) NULL,
 CONSTRAINT [PK_Sach] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[UserPass] [varbinary](100) NULL,
	[UserRight] [tinyint] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET IDENTITY_INSERT [dbo].[NhaXuatBan] ON 

GO
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [DienThoai], [Image]) VALUES (1, N'Nhà xuất bản Trẻ', N'124 Nguyễn Văn Cừ Q.1 Tp.HCM', CAST(1900156045 AS Decimal(18, 0)), 'NXB-Tre.jpg')
GO
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [DienThoai], [Image]) VALUES (2, N'NXB Thống kê', N'Biên Hòa-Đồng Nai', CAST(1900151112 AS Decimal(18, 0)), 'NXB-ThongKe.jpg')
GO
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [DienThoai], [Image]) VALUES (3, N'Kim đồng', N'Tp.HCM', CAST(1900157090 AS Decimal(18, 0)), 'NXB-KimDong.jpg')
GO
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [DienThoai], [Image]) VALUES (4, N'Đại học quốc gia', N'Tp.HCM', CAST(908419981 AS Decimal(18, 0)), 'NXB-DaiHocQuocGia.jpg')
GO
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [DienThoai], [Image]) VALUES (5, N'Văn hóa nghệ thuật', N'Đà Nẵng', CAST(903118833 AS Decimal(18, 0)), 'NXB-VanHoaNgheThuat.jpg')
GO
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [DienThoai], [Image]) VALUES (6, N'Văn hóa', N'Bình Dương', CAST(913336677 AS Decimal(18, 0)), 'NXB-VanHoa.jpg')
GO
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [DienThoai], [Image]) VALUES (7, N'NXB Lao động - Xã hội', N'Tp.HCM', CAST(989888888 AS Decimal(18, 0)), 'NXB-LaoDong.jpg')
GO
SET IDENTITY_INSERT [dbo].[NhaXuatBan] OFF
GO
SET IDENTITY_INSERT [dbo].[Sach] ON 
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [MoTa], [NgayCapNhat],  [MaNXB], [Image]) VALUES (1, N'Sketchup & Vray Trong Thiết Kế 1 Kiến Trúc', N'SketchUp Pro là một chương trình đồ họa kiến trúc tuyệt vời, dễ học cũng như dễ sử dụng. Ngay từ khi xuất hiện vào năm 2000, SketchUp giúp cho việc phác thảo và thiết kế ý tưởng được thuận tiện, chương trình tập hợp nhiều công cụ tiện ích giúp cho việc thể hiện ý tưởng cho việc phác thảo những phối cảnh trong kiến trúc. Ứng dụng trong Sketchup rất linh hoạt. Chương trình đoạt nhiều giải thưởng về thiết kế sáng tạo và được nhiều người công nhận. ', CAST(N'2014-11-09 00:00:00.000' AS DateTime),  1,  N'Sketchup & Vray Trong Thiết Kế 1 Kiến Trúc.jpg')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach],  [MoTa], [NgayCapNhat], [MaNXB], [Image]) VALUES (2, N'3DS Max-Thủ Thuật Render Phối Cảnh kiến Trúc Ban Ngày Và Đêm Với V-Ray 1.50 RC3', N'Cuốn sách 3DS Max giới thiệu đến các bạn những kỹ năng sử dụng phần mềm hỗ trợ V-ray mới nhất đang được nhiều người trên thế giới quan tâm. ', CAST(N'2012-03-31 00:00:00.000' AS DateTime), 2, N'3DS Max-Thủ Thuật Render Phối Cảnh kiến Trúc Ban Ngày Và Đêm Với V-Ray 1.50 RC3.jpg')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach],  [MoTa], [NgayCapNhat], [MaNXB], [Image]) VALUES (3, N'Tự Học InDesign CS3', N'InDesign CS3 là chương trình dàn trang rất hiện đại và tiện dụng dành cho việc trình bày sách, báo, tạp chí...', CAST(N'2012-03-31 00:00:00.000' AS DateTime),  3, N'Tự Học InDesign CS3.jpg')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach],  [MoTa], [NgayCapNhat], [MaNXB], [Image]) VALUES (4, N'Đắc Nhân Tâm - Cuốn Sách Hay Nhất Của Mọi Thời Đại Đưa Bạn Đến Thành Công!', N'Đắc nhân tâm – How to win friends and Influence People của Dale Carnegie là quyển sách nổi tiếng nhất, bán chạy nhất và có tầm ảnh hưởng nhất của mọi thời đại. ', CAST(N'2012-03-31 00:00:00.000' AS DateTime), 4, N'đắc nhân tâm.jpg')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach],  [MoTa], [NgayCapNhat], [MaNXB], [Image]) VALUES (5, N'Tự Học Photoshop CS5 Qua Hình Ảnh Minh Họa (Sách Kèm CD)', N'Nhằm đáp ứng nhu cầu tự học Photoshop, một phần mềm xử lý ảnh ngày càng nhiều. Sách " Tự Học Photoshop CS5 Qua Hình Ảnh Minh Họa" được chia thành 11 chương kèm với hình ảnh minh họa và CD bài tập được kèm theo sách. ', CAST(N'2012-03-31 00:00:00.000' AS DateTime), 6, N'Tự Học Photoshop CS5 Qua Hình Ảnh Minh Họa (Sách Kèm CD).jpg')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach],  [MoTa], [NgayCapNhat], [MaNXB], [Image]) VALUES (6, N'180 Thủ Thuật Và Mẹo Hay Trong Flash CS4',  N'Adobe Flash Professional CS4 là phiên bản mới nhất của công cụ thiết kế Web đang rất thịnh hành hiện nay. ', CAST(N'2012-03-31 00:00:00.000' AS DateTime), 5, N'180 Thủ Thuật Và Mẹo Hay Trong Flash CS4.jpg')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach],  [MoTa], [NgayCapNhat], [MaNXB], [Image]) VALUES (7, N'Microsoft Office 2010 - Dành Cho Người Tự Học', N'Trong lĩnh vực tin học văn phòng, Microsoft Word, Excel, PowerPoint, Visio là những chương trình thuộc bộ Microsoft Office đã và đang được ứng dụng rộng rãi trong nhiều lĩnh vực: kinh tế, kế toán, thương mại, quản lý, vẽ kỹ thuật và nhiều hơn nữa. Với Office 2010, bạn có trong tay đầy đủ các công cụ và lệnh để thực hiện các tiện ích trong diện toán văn phòng .', CAST(N'2012-03-31 00:00:00.000' AS DateTime), 7, N'Microsoft Office 2010 - Dành Cho Người Tự Học.jpg')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach],  [MoTa], [NgayCapNhat], [MaNXB], [Image]) VALUES (8, N'Tự học Microsoft Excel 2010', N'Sách được chia thành 11 bài, từ căn bản đến nâng cao kèm theo CD bài tập thực hành nhằm giúp bạn học một cách nhanh chóng và dễ hiểu như:', CAST(N'2012-03-31 00:00:00.000' AS DateTime), 2, N'Tự học Microsoft Excel 2010.jpg')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach],  [MoTa], [NgayCapNhat], [MaNXB], [Image]) VALUES (9, N'C# Dành Cho Người Tự Học - Tập 1', N'Sách được chia thành 11 bài, từ căn bản đến nâng cao kèm theo CD bài tập thực hành nhằm giúp bạn học một cách nhanh chóng và dễ hiểu như:', CAST(N'2012-03-31 00:00:00.000' AS DateTime), 1, N'Tự Học 1.jpg')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach],  [MoTa], [NgayCapNhat], [MaNXB], [Image]) VALUES (10, N'C# Dành Cho Người Tự Học - Tập 2', N'Trong tập 2 này, các bạn sẽ tìm hiểu ứng dụng C# trong Windows Form qua 2 phần, mỗi phần là một bài tập lớn xây dựng lên ứng dụng Quản lý bán hàng và Quản lý tuyển sinh để bạn đọc hiểu rõ và khai thác có hiệu quả những công cụ và lệnh của C# đã trình bày trong tập 1.', CAST(N'2012-03-31 00:00:00.000' AS DateTime), 1, N'Tự Học 2.jpg')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach],  [MoTa], [NgayCapNhat], [MaNXB], [Image]) VALUES (11, N'Nghệ Thuật Sống An Lạc ', N'"Nghệ thuật sống An lạc là tuyển tập các bài giảng liên quan tới chủ đề nghệ thuật sống của Đức Nhiếp Chính Vương Khamtrul Rinpoche đời thứ IX Jigme Pema Nyinjadh . ', CAST(N'2012-03-31 00:00:00.000' AS DateTime),4, N'Nghệ thuật sống an lạc.jpg')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach],  [MoTa], [NgayCapNhat], [MaNXB], [Image]) VALUES (12, N'Phương Pháp Quản Lý Nhân Sự Trong Công Ty', N'Những người sử dụng lao động đã hiểu dần các giá trị mà con người tạo ra cho tổ chức của họ. ', CAST(N'2012-03-31 00:00:00.000' AS DateTime), 7, N'Phương Pháp Quản Lý Nhân Sự Trong Công Ty.jpg')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach],  [MoTa], [NgayCapNhat], [MaNXB], [Image]) VALUES (13, N'Ngọc Sáng Trong Hoa Sen', N'Trong nửa thế kỷ qua, số người phương Tây thăm viếng phương Đông không phải là ít nhưng đã có mấy ai lĩnh hội được tinh hoa của phương Đông? ', CAST(N'2012-03-31 00:00:00.000' AS DateTime),3, N'Ngọc Sáng Trong Hoa Sen.jpg')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach],  [MoTa], [NgayCapNhat], [MaNXB], [Image]) VALUES (14, N'Hành Trình Về Phương Đông', N'"Hành trình về phương đông" kể về những trải nghiệm của một đoàn khoa học gồm các chuyên gia hàng đầu của Hội Khoa Học Hoàng Gia Anh được cử sang Ấn Độ nghiên cứu về huyền học và những khả năng siêu nhiên của con người. ', CAST(N'2012-03-31 00:00:00.000' AS DateTime), 6, N'Hành Trình Về Phương Đông.jpg')
GO
SET IDENTITY_INSERT [dbo].[Sach] OFF

SET IDENTITY_INSERT [dbo].[Users] ON 

GO
INSERT [dbo].[Users] ([UserID], [UserName], [UserPass], [UserRight]) VALUES (1, N'admin', 0x0200BB89D3BAD30E63E2A7C472E354099014FCC23E5E56FB091375B6D6D972DCE82DD572C0C975A5E620ACE39093B0E8F885DBB43022B4D877E4A14EB08D708CE4593020F435, 0 )
GO
INSERT [dbo].[Users] ([UserID], [UserName], [UserPass], [UserRight]) VALUES (2, N'user1', 0x0200BB89D3BAD30E63E2A7C472E354099014FCC23E5E56FB091375B6D6D972DCE82DD572C0C975A5E620ACE39093B0E8F885DBB43022B4D877E4A14EB08D708CE4593020F435, 1)
GO
INSERT [dbo].[Users] ([UserID], [UserName], [UserPass], [UserRight]) VALUES (3, N'user2', 0x0200BB89D3BAD30E63E2A7C472E354099014FCC23E5E56FB091375B6D6D972DCE82DD572C0C975A5E620ACE39093B0E8F885DBB43022B4D877E4A14EB08D708CE4593020F435, 1)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF

Go
CREATE proc [dbo].spSach_Delete
	@MaSach int
as
begin try

	delete	Sach
	where	MaSach = @MaSach

	select  N'Xoa sach thanh cong' errMsg
end try
begin catch
	declare @err nvarchar(1000) = ERROR_MESSAGE()
	raiserror (@err, 16, 1)
end catch
GO


create proc [dbo].spSach_SelectAll
as
	select * from Sach
GO


create proc [dbo].spSach_SelectByNXB
	@MaNXB int
as
	select * from Sach inner join NhaXuatBan on Sach.MaNXB = NhaXuatBan.MaNXB
	where Sach.MaNXB = @MaNXB
GO


CREATE proc [dbo].[spSach_UserLogin]
	@UserName varchar(50),
	@UserPass varchar(50)
as
begin try
	if not exists (select * from Users where UserName = @UserName and PWDCOMPARE(@UserPass, UserPass) = 1)
	begin
		raiserror(N'Ten dang nhap hoac mat khau khong chinh xac.', 16, 1)
		return
	end

	select	UserID, UserName
	from		Users 
	where	UserName = @UserName 
			and PWDCOMPARE(@UserPass, UserPass) = 1
end try
begin catch
	declare @err nvarchar(1000) = ERROR_MESSAGE()
	raiserror (@err, 16, 1)
end catch
go


create proc [dbo].[spSach_SelectAllNXB]
as
begin 
select * from NhaXuatBan
end

go

create proc [dbo].[spSach_DetailNXB]
@MaNXB int
as
begin 
select * from Sach
where MaNXB = @MaNXB
end


go

create PROCEDURE spSach_AddSach
	@TenSach nvarchar(100),
	@MoTa nvarchar(MAX),
	@MaNXB int, 
	@Image nvarchar(100)
AS
BEGIN
	INSERT INTO Sach(TenSach, MoTa, NgayCapNhat, MaNXB, Image)
	VALUES (@TenSach, @MoTa, GETDATE(), @MaNXB, @Image)
			select  N'Thêm sách thành công' errMsg

END

go

CREATE PROCEDURE spUsers_AddNew
	@Username varchar(50),
	@UserPass varchar(50)
AS
BEGIN
	INSERT INTO Users(UserName, UserPass, UserRight )
	VALUES (@Username, PWDENCRYPT(@UserPass), 1)
		select  N'Thêm tài khoản thành công' errMsg
END

GO

CREATE PROCEDURE spSach_SelectSachByID
	@MaSach int
as
BEGIN
	select * from Sach
	where MaSach = @MaSach
END


go


create PROCEDURE spSach_UpdateSach
	@MaSach int,
	@TenSach nvarchar(100),
	@MoTa nvarchar(MAX),
	@Image nvarchar(100)
AS
BEGIN
	UPDATE Sach
	SET TenSach = @TenSach, MoTa = @MoTa, NgayCapNhat = GETDATE(), Image = @Image
	where MaSach = @MaSach
END

go

CREATE PROCEDURE spUser_SelectAll
AS
BEGIN
	Select * from Users
END

GO


CREATE PROCEDURE spUser_ChangeToAdmin
@UserID int
AS
BEGIN
	UPDATE Users
	SET UserRight = 0
	where UserID = @UserID 
END
GO


CREATE PROCEDURE spUser_ChangeToUser
@UserID int
AS
BEGIN
	UPDATE Users
	SET UserRight = 1
	where UserID = @UserID 
END
GO

CREATE PROCEDURE spUser_AuthenUser
	@UserID int
AS
BEGIN
	select UserRight
	from Users
	where UserID = @UserID
END
GO

Create PROCEDURE spSach_FindSachInNXB
	@TenSach nvarchar(100),
	@MaNXB int
AS
BEGIN
select * from Sach
where TenSach like  N'%'+@TenSach+'%' and MaNXB = @MaNXB
END
GO