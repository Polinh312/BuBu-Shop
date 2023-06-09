USE [Project]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 11/8/2022 9:40:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[loginName] [varchar](100) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[email] [varchar](100) NULL,
	[gender] [nvarchar](50) NULL,
	[dob] [date] NOT NULL,
	[address] [nvarchar](200) NOT NULL,
	[phone] [varchar](20) NOT NULL,
	[role] [varchar](50) NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[loginName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/8/2022 9:40:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [int] NOT NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](1000) NULL,
 CONSTRAINT [PK__Categori__3213E83FD82DF1E1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 11/8/2022 9:40:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[id] [nvarchar](100) NOT NULL,
	[name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/8/2022 9:40:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[loginName] [varchar](100) NOT NULL,
	[totalmoney] [money] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 11/8/2022 9:40:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[oid] [int] NOT NULL,
	[pid] [int] NOT NULL,
	[quantity] [float] NOT NULL,
	[price] [float] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[oid] ASC,
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/8/2022 9:40:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] NOT NULL,
	[name] [nvarchar](100) NULL,
	[price] [float] NULL,
	[description] [nvarchar](1000) NULL,
	[discount] [varchar](50) NULL,
	[stock] [int] NULL,
	[cid] [int] NULL,
	[image] [nvarchar](50) NULL,
	[weight] [varchar](50) NULL,
	[country] [nvarchar](50) NULL,
 CONSTRAINT [PK__Products__3213E83FBB60B140] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([loginName], [password], [fullname], [email], [gender], [dob], [address], [phone], [role]) VALUES (N'admin', N'123456', N'admin', N'admin@fpt.vn', N'0', CAST(N'2001-12-03' AS Date), N'Hà Nội', N'0981418885', N'Admin')
INSERT [dbo].[Accounts] ([loginName], [password], [fullname], [email], [gender], [dob], [address], [phone], [role]) VALUES (N'customer1', N'123', N'customer1', N'customer1@gmail.com', N'0', CAST(N'2002-12-10' AS Date), N'Hà Nội', N'123456', N'Customer')
INSERT [dbo].[Accounts] ([loginName], [password], [fullname], [email], [gender], [dob], [address], [phone], [role]) VALUES (N'customer2', N'123456', N'customer2', N'customer2@gmail.com', N'0', CAST(N'1998-02-24' AS Date), N'Cầu Giấy', N'123456', N'Customer')
INSERT [dbo].[Accounts] ([loginName], [password], [fullname], [email], [gender], [dob], [address], [phone], [role]) VALUES (N'sa', N'123', N'sa', N'sa@gmail.com', N'1', CAST(N'2000-01-06' AS Date), N'Hà Nội', N'123456', N'Customer')
INSERT [dbo].[Accounts] ([loginName], [password], [fullname], [email], [gender], [dob], [address], [phone], [role]) VALUES (N'staff1', N'123', N'staff1', N'staff1@.gmail.com', N'0', CAST(N'1999-08-19' AS Date), N'Hà Nội', N'123456', N'Staff')
INSERT [dbo].[Accounts] ([loginName], [password], [fullname], [email], [gender], [dob], [address], [phone], [role]) VALUES (N'staff2', N'123', N'staff2', N'staff2@gmail.com', N'1', CAST(N'2001-02-01' AS Date), N'Hà Nội', N'123456', N'Staff')
GO
INSERT [dbo].[Categories] ([id], [name], [description]) VALUES (1, N'Thức uống', N'Thức uống đa dạng')
INSERT [dbo].[Categories] ([id], [name], [description]) VALUES (2, N'Đồ khô', N'Các loại đồ sấy nội địa và nhập khẩu')
INSERT [dbo].[Categories] ([id], [name], [description]) VALUES (3, N'Bánh tươi', N'Các loại bánh tươi được làm hằng ngày')
INSERT [dbo].[Categories] ([id], [name], [description]) VALUES (4, N'Trái cây', N'Trái cây sấy đóng hộp thơm ngon')
INSERT [dbo].[Categories] ([id], [name], [description]) VALUES (5, N'Các loại mì, lẩu, miến', N'Các loại lẩu, miến, mì đóng hộp chưa bao giờ hết hot')
GO
INSERT [dbo].[Country] ([id], [name]) VALUES (N'America', N'Mỹ')
INSERT [dbo].[Country] ([id], [name]) VALUES (N'Australia', N'Úc')
INSERT [dbo].[Country] ([id], [name]) VALUES (N'China', N'Nội địa Trung')
INSERT [dbo].[Country] ([id], [name]) VALUES (N'Japan', N'Nhật Bản')
INSERT [dbo].[Country] ([id], [name]) VALUES (N'Korea', N'Hàn Quốc')
INSERT [dbo].[Country] ([id], [name]) VALUES (N'Thailand', N'Thái Lan')
INSERT [dbo].[Country] ([id], [name]) VALUES (N'Vietnam', N'Việt Nam')
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([id], [date], [loginName], [totalmoney]) VALUES (1, CAST(N'2022-10-29' AS Date), N'sa', 38000.0000)
INSERT [dbo].[Order] ([id], [date], [loginName], [totalmoney]) VALUES (2, CAST(N'2022-10-29' AS Date), N'sa', 38000.0000)
INSERT [dbo].[Order] ([id], [date], [loginName], [totalmoney]) VALUES (3, CAST(N'2022-10-29' AS Date), N'sa', 38000.0000)
INSERT [dbo].[Order] ([id], [date], [loginName], [totalmoney]) VALUES (4, CAST(N'2022-10-31' AS Date), N'customer1', 32000.0000)
INSERT [dbo].[Order] ([id], [date], [loginName], [totalmoney]) VALUES (5, CAST(N'2022-10-31' AS Date), N'customer1', 70000.0000)
INSERT [dbo].[Order] ([id], [date], [loginName], [totalmoney]) VALUES (6, CAST(N'2022-10-31' AS Date), N'customer2', 248000.0000)
INSERT [dbo].[Order] ([id], [date], [loginName], [totalmoney]) VALUES (7, CAST(N'2022-10-31' AS Date), N'customer2', 375000.0000)
INSERT [dbo].[Order] ([id], [date], [loginName], [totalmoney]) VALUES (8, CAST(N'2022-10-31' AS Date), N'sa', 165000.0000)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (1, 41, 1, 38000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (2, 41, 1, 38000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (3, 41, 1, 38000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (4, 6, 1, 32000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (5, 6, 1, 32000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (5, 41, 1, 38000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (6, 34, 1, 248000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (7, 37, 1, 375000)
INSERT [dbo].[OrderDetail] ([oid], [pid], [quantity], [price]) VALUES (8, 35, 1, 165000)
GO
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (1, N'Trà sữa bếp nấu', 29000, N'Bếp nấu trà sữa bán gần 5 năm rồi và ngày càng có nhiều khách biết tới và nghiện trà sữa bếp lắm luôn.Bếp nấu đảm bảo ngon- béo- ít ngọt thanh- an toàn ', N'15', 10, 1, N'image1.png', N'350ml', N'Vietnam')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (2, N'Tắc sên đường phèn', 88000, N'Tắc sên đường phèn là món truyền thống của Việt Nam, chua chua thanh mát', N'15', 30, 1, N'image2.png', N'200g', N'VietNam')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (3, N'Trà hoa cúc', 115000, N'Hoa cúc thường dùng làm trà có tên là Chrysanthemum morifolium Ramat, họ Asteraceae. Hoa cúc có vị đắng, ngọt, tính bình hoặc hơi hàn', N'20', 20, 1, N'image3.png', N'200g', N'China')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (4, N'Trà sữa Lipton Đài Loan', 210000, N'Bếp về thêm các loại trà sữa xách tay Đài Loan đồng giá 210k/ túi to. Trà Sữa Anh Lipton Đài Loan ( 15 gói ) Trà Sữa Olong Lipton Đài Loan ( 15 gói ) Trà Sữa Hoa Nhài...', N'10', 100, 1, N'image4.png', N'300g', N'Taiwan')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (5, N'Bột pha trái cây Vitamin Kool Aid Mỹ', 160000, N'Bột pha thơm ngon từ trẻ con đến người lớn đều thích', N'12', 60, 1, N'image5.png', N'350g', N'America')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (6, N'Trà trái cây Nongfu Đài Loan Taiwan', 32000, N'Sản phẩm của Nongfuspring là sự mix trộn hoàn hảo giữa lá trà tươi thơm đậm vị và trái cây tươi mát.', N'30', 88, 1, N'image6.png', N'350g', N'China')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (7, N'Soda chai nhôm Sangaria Nhật Bản  ', 35000, N'Ngon nhất khi dùng lạnh, soda mát rượi với vị trái cây tự nhiên thơm nồng tuyệt hảo. Dưa lưới nồng nàn, nho thơm nức nở và chanh mát rượi cực đã. Những ngày nóng mà có vài chai trong tủ lạnh là hết nấc', N'16', 110, 1, N'image7.png', N'480ml', N'Japan')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (8, N'Mật ong Hàn Quốc', 165000, N'Trà mật ong chanh Hàn Quốc chính là sự kết hợp của đặc sản chanh vàng Hàn Quốc & mật ong tự nhiên xứ Hàn.', N'29', 120, 1, N'image8.png', N'350ml', N'Korea')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (9, N'Ovaltine 3in1 Yen Crunchy Choco', 165000, N'Sự kết hợp bột socola nguyên chất, yến mạch và bánh ngũ cốc giòn tan chắc chắc sẽ làm tất cả team nghiện ovaltine phải hài lòng', N'11', 28, 1, N'image9.png', N'180ml', N'Thailand')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (10, N'Đậu Hà Lan Sấy DJ&A 75gr', 60000, N'Đậu Hà Lan sấy giòn DJ&A Nature’s Protein Green Peas Gói 75gr: 60.000đĐậu Hà Lan là một món ăn nhẹ như bánh snack, cung cấp protein thực vật thơm ngon, bổ dưỡng.', N'19', 30, 2, N'image10.png', N'200g', N'Vietnam')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (11, N'Hạnh Nhân Hàn Quốc Murgerbon', 118000, N'Hạnh nhân thơm, béo kết hợp với mật ong ngọt ngào. Hạnh nhân là chính là một “siêu thực phẩm” có chức năng chống lại những vấn đề về cân nặng. Nhờ có được lượng vitamin dồi dào cũng như chất béo đơn bão hòa (chất béo tốt), hạnh nhân cung cấp đủ năng lượng cho cơ thể bạn mà không làm bạn tăng cân.
Hạnh nhân có chứa nhiều vitamin như là: B,C,P, canxi, phốt pho, sắt, chất béo, giàu protein, carbohydrate và carotene. Bên cạnh đó lượng axit béo không bão hòa đơn có công dụng giảm lipid ở trong máu, lượng chất xơ tạo nên cảm giác mau no, giúp hỗ trợ việc giảm cân một cách hiệu quả.', N'21', 32, 2, N'image11.png', N'300g', N'Korea')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (12, N'Ngũ cốc Calbee Nội Địa Nhật Bản', 128000, N'ó thể nói ngũ cốc Calbee là một trong số các loại ngũ cốc có nhiều trái cây và các loạt hạt nhất đang được bán tại Việt Nam. Điều này đã tạo nên sự khác biệt duy nhất của Calbee so với các loại ngũ cốc khác trên thị trường.', N'5', 90, 2, N'image12.png', N'750g', N'Japan')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (13, N'Snack Nấm Hương Sấy Giòn Úc', 95000, N'Shiitake Mushroom Crisps là món ăn ngon miệng giàu chất dinh dưỡng của Úc được sản xuất theo công nghệ sạch ăn thỏa thích mà không phải lo về cân nặng.
Nấm Hương sấy khô Shiitake Mushroom Crisps là loại nấm hoàn toàn tự nhiên, không chứa hóa chất độc hại.
Shiitake Mushroom Crisps có hương vị thơm ngon, giòn tan trong miệng, ăn hoài không chán.
Đặc biệt, món ăn này còn giúp bạn ngăn ngừa ung thư, lao, hạch, tăng khả năng đề kháng, giảm cholesterol và tốt cho người tiểu đường ...
Trong nấm Hương còn có chứa 7 loại amino acid cần thiết cho cơ thể và chứa 1 số lượng provitamin ergosterol rất cao mang lại nhiều lợi ích cho sức khỏe của bạn.
Không chứa gluten
Không đột biến gen', N'6', 80, 2, N'image13.png', N'500g', N'Australia')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (14, N'Hạt bí tách vỏ rang tỏi', 78000, N'Bùi béo thơm phức nức mũi luôn , càng ăn càng phát ngất với hương vị đậm đà lắm luôn HẠT BÍ RANG TỎI nhưng ăn vừa thôi nghen ăn nhiều nóng lắm luôn.', N'8', 20, 2, N'image14.png', N'600g', N'Vietnam')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (15, N'Bánh Bông Lan Gấu ( Order trước 1 ngày )', 290000, N'Dễ thương, thơm ngon ai cũng thích', N'25', 89, 3, N'image15.png', N'900g', N'Vietnam')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (16, N'Bông Lan Phô Mai', 155000, N'Bánh bông lan với 2 loại sốt độc quyền không lẫn lộn chỗ nào bán hết. Bánh bông lan mềm xốp chứ không khô cứng tạo cảm giác ăn quá ngán', N'5', 72, 3, N'image16.png', N'800g', N'Vietnam')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (17, N'Mousse Chanh Dây', 75000, N'Chanh Dây Bếp sử dụng cốt nguyên chất 100% không dùng syrup tạo vị, nguyên liệu kem và bánh đều là hàng chất lượng tốt.Khách hàng yên tâm về chất lượng', N'15', 16, 3, N'image17.png', N'800g', N'Vietnam')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (18, N'Bánh Tươi Tiramisu', 75000, N'Cắn một miếng bánh TIRAMISU với lớp bánh mềm mềm, hòa cùng mùi cà phê ca cao thơm phức và đặc biệt là lớp kem béo ngậy tạo cảm giác ăn hoài không hề ngán', N'18', 18, 3, N'image18.png', N'800g', N'Vietnam')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (19, N'Bánh Brownie', 90000, N'Brownie có kích thước nhỏ, vuông vắn, mềm, khi ăn có vị đắng của Socola, vị ngọt của đường và mùi thơm nhẹ của bột bánh', N'10', 100, 3, N'image19.png', N'800g', N'Vietnam')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (20, N'Nho Khô Mỹ Không Hạt', 80000, N'Nho khô Mỹ không hạt Sunview Raisins là một món ăn ngon miệng và tốt cho sức khỏe đến từ thương hiệu Raisins của Mỹ. Nho Khô được chế biến từ những trái nho thơm ngon với công nghệ chế biến đảm bảo an toàn, hiện đại. Sản phẩm có chứa hàm lượng chất béo bão hòa rất thấp, ít cholesterol và bổ sung natri rất tốt cho tim mạch.', N'5', 12, 4, N'image20.png', N'425g', N'America')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (21, N'Dâu Sấy Dẻo Thái Lan', 95000, N'Dâu tây sấy derp được sấy dẻo - sử dụng nhiệt độ cao (50 - 70 độ C) trên dây chuyền công nghệ hiện đại, để làm mất đi một phần hơi nước của sản phẩm rồi đem đi làm mát nên sản phẩm mềm dẻo, vị chua ngọt tự nhiên không đường', N'6', 160, 4, N'image21.png', N'300g', N'Thailand')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (22, N'Hạt Mác Ca Úc Nhập Khẩu', 160000, NULL, N'8', 30, 4, N'image22.png', N'400g', N'Australia')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (23, N'Lang Mật Sấy Dẻo', 90000, N'LANG MẬT SẤY DẺO- người ta nói ngọt thanh ngọt bùi thơm lắm nha cả nhà.
Khoai bảo quản ngăn mát khoai sẽ dẻo cứng ngon hơn nhiều', N'9', 40, 4, N'image23.png', N'380g', N'Vietnam')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (24, N'Lẩu ly viên HongKong', 74000, N' Vị lẩu chua cay dễ ăn, đậm đà, đảm bảo là ai cũng sẽ húp sạch sẽ nước lẩu cho xem', N'10', 90, 5, N'image24.png', N'100g', N'China')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (25, N'Chà là khô  ', 139000, N'Chà là khô nguyên cành Hosna được lấy từ những cành chà là ngon, chất lượng tại vùng đất Tunisia chứa hàm lượng chất dinh dưỡng cao. Mỗi cành chà là Hosna được làm sạch và để khô nguyên cành nên mang hương vị thơm ngon, dẻo, ngọt nước rất đặc trưng', N'12', 80, 4, N'image25.png', N'500g', N'Vietnam')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (26, N'Nho Khô Nguyên Cành Úc ', 489000, N'Nho khô nguyên cành Alison Dried Grapes Adora là sự lựa chọn tuyệt vời cho cả gia đình bạn, nho hữu cơ được để khô tự nhiên trên cành trong 1 tháng, không chất bảo quản nên giữ được toàn vẹn khoáng chất, vitamin và chất dinh dưỡng. Sản phẩm phù hợp với mọi đối tượng, mọi lứa tuổi đều có thể sử dụng nho khô hàng ngày, rất ngon và bổ dưỡng.', N'16', 100, 4, N'image26.png', N'1000g', N'Australia')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (27, N'TÁO ĐỎ HÀN QUỐC', 109, N'Táo đỏ Hàn Quốc nổi tiếng là loại trái cây mang hương vị thơm ngon không những thế còn cực kỳ tốt cho sức khỏe của con người, chẳng hạn như trong việc bồi bổ cơ thể, nhuận phổi, dạ dày, và bồi bổ cơ thể.', N'18', 110, 4, N'image27.png', N'1000g', N'Korea')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (28, N'Kiwi sấy dẻo Thaifruitz', 51000, N'Kiwi sấy dẻo, thơm thơm, ngọt ăn dai dai rất vui miệng. Kiwi sấy dẻo Thaifruitz gói 100g sấy dẻo bằng cách sử dụng nhiệt độ cao (50 - 70 độ C) để làm mất đi một phần hơi nước của sản phẩm rồi đem đi làm mát. Trái cây sấy Thaifruitz chất lượng, vệ sinh và hấp dẫn.', N'19', 29, 4, N'image28.png', N'100g', N'Thailand')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (29, N'Miến ăn liền', 48000, N'Thành phần sử dụng nhiều nguyên liệu để tạo nên gia vị cũng như nước sốt đậm đà. Tuy nhiên, sản phẩm không hề sử dụng các loại hương liệu độc hại. Do đó, mẹ hoàn toàn có thể yên tâm khi cho bé sử dụng.Sợi miến được làm từ gạo Nhật với nước súp cô đặc từ Hải sản , thịt heo , rong biển , đậu nành cùng với cải thảo , cà rốt , củ cải tạo nên nhiều hương vị thơm ngon - Mỗi gói miến pha chế với 160ml nước nóng, đậy kín trong vòng 3 phút cho miến chín, trộn đều và dùng ngay. - Miến dạng hộp tiện lợi, dễ mang theo sử dụng khi đi picnic, dã ngoại', N'12', 37, 5, N'image29.png', N'200g', N'China')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (30, N'Lẩu tự sôi Hàn Quốc', 109000, N'Lẩu cực dậy mùi từ chanh, xả, cay cay từ ớt tươi, Đặc biệt là vị béo từ cốt dừa, siêu đỉnh chuẩn vị Chua - cay - mặn - ngọt hài hoà, thơm ngon đến tận giọt cuối cùng', N'11', 48, 5, N'image30.png', N'600g', N'Korea')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (31, N'Mì rau củ 3 màu Surifarm', 66000, N'Mì Rau Củ Hữu Cơ SuriFarm giàu chất xơ, vitamin, khoáng chất...là nguồn thực phẩm lành mạnh cho mọi thành viên trong gia đình Phù hợp với tất cả mọi người, kể cả người ăn chay, ăn kiêng eatclean, trẻ em ăn dặm. Mì Rau Củ Hữu Cơ SuriFarm là mì không chiên, không dầu mỡ - với nguyên liệu được tuyển chọn kỹ lưỡng. 1 hộp mì rau củ hữu cơ SuriFarm 400g/15 vắt được mix 3 loại, mỗi loại 5 vắt : Mì Bí Đỏ Mì Rau Chùm Ngây Mì Củ Dền', N'9', 59, 5, N'image31.png', N'450g', N'Vietnam')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (32, N'Gạo lứt sấy mix rong biển', 68000, N'Gạo lứt sấy rong biển là sự kết hợp của rất nhiều nguyên liệu tạo thành một món ăn có hương vị vô cùng thơm ngon và đặc sắc. Cùng với đó là một công dụng vô cùng đặc biệt đó là giúp giảm cân. Được kết hợp rất nhiều nguyên liệu đa dạng và phong phú như là gạo lứt, rong biển thì trong gạo lứt sấy rong biển còn có những nguyên liệu rất quen thuộc nhưng vô cùng bổ dưỡng như là muối, dầu mè thực vật, tỏi được rang thơm. Tất cả kết hợp lại với nhau tạo thành một món ăn đầy bổ dưỡng.', N'5', 120, 2, N'image32.png', N'500g', N'Vietnam')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (33, N'Kẹo socola bọc dâu tây', 62000, N'Những viên socola  nhỏ xinh bọc những quả dâu tây sấy khô giòn. Kèm vị ngọt ngào của socola, vị chua dịu nhẹ của dâu tây là sự kết hợp tuyệt hảo, ăn hoài không thấy chán.
Sản phẩm phù hợp cho các tín đồ ăn uống, vị ngọt của sô cô la.
Hình ảnh bắt mắt hợp lý xuất hiện trong các tiệc cưới, sinh nhât..', N'5', 560, 2, N'image33.png', N'200g', N'China')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (34, N'Khô gà bơ tỏi ', 248000, N'Snack khô gà Ponnie là sản phẩm ăn vặt thế hệ mới được làm từ 100% Phi-lê Ức gà tươi chất lượng cao.

- Thơm ngon giòn rụm ăn đã miệng, càng ăn càng cuống, ăn không thể dừng
- Sản phẩm snack cao cấp từ thịt của thương hiệu Ponnie 
Sản phẩm được đóng gói bao bì bắt mắt, đa dạng kích cỡ cho bạn thoả sức lựa chọn

- Gói nhỏ 25g,50g nhâm nhi ăn vặt
- Hũ lớn 300g chiêu đãi bạn bè, đồng nghiệp, ăn vặt xem phim, Chơi game nhâm nhi khi ở nhà
- Chai Siêu To Khổng lồ cho bạn thoả thích tiệc tùng hoặc làm quà tặng rất sang.', N'5', 119, 2, N'image34.png', N'650g', N'Vietnam')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (35, N'Lẩu tự sôi HuangLong', 165000, N'Lẩu này 1-2 người nhé! Đi du lịch hay công tác nửa đêm đói k cần đun nước hay bỏ lò vi sóng j cả, có gói tự làm nóng sùng sục lun ^^ 410g

Gồm:
- Thịt bò
- Gói mỳ tươi
- Gia vị cốt lẩu
- Rau củ quả hầm
Hộp lẩu đầy đặn tiện lợi, hương vị cay cay kết hợp vị tê đầu lưỡi đem lại hương vị mới lạ thơm ngon. Đặc biệt thích hợp với các "đại lãn" với vài bước đơn giản có ngay nồi lẩu nóng hổi.', N'15', 59, 5, N'image35.png', N'300g', N'China')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (36, N'Phở bò Quảng Đông', 39000, N'Sâu hót ai xem tik tok biết mì này ngon như thế nào rồi ạ
em k cần quảng cáo nhiều
nhìn các bác ý ăn mà em mlem mlem 🦴🦴

🍲 Phở thịt bò quảng đông tok tok 4 hương vị : 
Mì bò cube
Súp béo bò vàng
Ớt chua thịt bò
Súp béo bò cay', N'15', 160, 5, N'image36.png', N'112g', N'China')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (37, N'Hồng treo gió Dalavi', 375000, N'Hồng treo gió Đà Lạt được thực hiện theo công nghệ Nhật Bản, công nghệ này có tên Hoshigaki – là phương pháp sấy hồng truyền thống của đất nước mặt trời mọc, dùng nắng và gió tự nhiên để cho ra những quả hồng đậm vị và đầy ngon lành. Sự kiện này đánh dấu mốc quan trọng đối với Lâm Đồng nói chung và người nông dân nói riêng và giúp nâng tầm trái hồng Đà Lạt lên một tầm cao mới.', N'15', 79, 4, N'image37.png', N'500g', N'Vietnam')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (38, N'Bánh bò thốt nốt', 90000, N'Bánh bò thốt nốt có kích cỡ nhỏ, đặt vừa trong lòng bàn tay và có màu vàng ươm đặc trưng. Khi ăn, du khách sẽ thấy một hương vị ngọt ngào, mùi thơm nồng nàn và miếng bánh tơi xốp rất vừa miệng. Bánh bò thốt nốt là món ăn vặt dân dã đồng thời cũng là món bánh có thể dùng trong các bữa tiệc gia đình làm món tráng miệng.

Bánh bò thốt nốt làm chuẩn vị và được bảo quản tốt có thể được giữ trong tủ lạnh khoảng 1 tuần lễ. Tuy là món ăn vặt nhưng món này rất giàu năng lượng vì chứa nhiều bột, đường. Vị ngọt thanh, không gắt, không ngán của thốt nốt khiến món bánh bò này trở nên rất dễ ăn và khác biệt so với nhiều loại bánh bò khác.', N'10', 60, 3, N'image38.png', N'500g', N'Vietnam')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (39, N'Bánh Macaron', 90000, N'Macaron là một loại bánh ngọt dựa trên bánh trứng đường (một loại bánh bánh tráng miệng đặc trưng của ẩm thực Pháp, được làm bằng cách đánh lòng trứng đều lên và thêm chút đường cùng chút axit từ chanh tây hay giấm).

Ngoài lòng trắng trứng đánh lên, macaron còn được làm từ các nguyên liệu khác như đường bột, đường hạt và màu thực phẩm, nhờ vậy mà bánh trông vô cùng bắt mắt và hấp dẫn.', N'5', 750, 3, N'image39.png', N'300g', N'Vietnam')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (40, N'Bánh crepe trà xanh ngàn lớp ', 185000, N'Bánh Crepe như chiếm trọn cảm tình của thực khách bởi hương vị cực kỳ lôi cuốn, hấp dẫn. Món bánh này vốn dĩ đã ấn tượng nay càng độc đáo hơn khi được kết hợp với nhiều loại nguyên liệu khác để làm ra bánh Crepe ngàn lớp vừa lạ mắt vừa ngon miệng. Hương vị trà xanh sẽ làm cho những ai thích hương matcha phải đắm đuối.', N'15', 80, 3, N'image40.png', N'400g', N'Vietnam')
INSERT [dbo].[Products] ([id], [name], [price], [description], [discount], [stock], [cid], [image], [weight], [country]) VALUES (41, N'Trà xanh Oi Ocha', 38000, N'Sự hòa trộn độc đáo giữa trà xanh nguyên chất cùng bột matcha được nghiền mịn nhiều lần, cho ra loại nước trà thơm và sắc trà tươi xanh và vị trà đậm chất Nhật, giúp bạn bắt đầu ngày mới thật năng động và tỉnh táo với hàm lượng chất chống oxy hóa dồi dào', N'5', 156, 1, N'image41.png', N'500ml', N'Japan')
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([oid])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Products] FOREIGN KEY([pid])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK__Products__cid__2A4B4B5E] FOREIGN KEY([cid])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK__Products__cid__2A4B4B5E]
GO
