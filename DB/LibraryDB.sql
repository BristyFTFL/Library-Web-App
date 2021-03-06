USE [master]
GO
/****** Object:  Database [LibraryDB]    Script Date: 29/01/2015 13:19:45 ******/
CREATE DATABASE [LibraryDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibraryDB', FILENAME = N'D:\Exam\25-Jan-2014Exam\LibraryManagementSystem\DB\LibraryDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LibraryDB_log', FILENAME = N'D:\Exam\25-Jan-2014Exam\LibraryManagementSystem\DB\LibraryDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LibraryDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LibraryDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LibraryDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibraryDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LibraryDB] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [LibraryDB]
GO
/****** Object:  Table [dbo].[t_book]    Script Date: 29/01/2015 13:19:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_book](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[author] [varchar](50) NOT NULL,
	[publisher] [varchar](50) NOT NULL,
 CONSTRAINT [PK_t_book] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_borrow]    Script Date: 29/01/2015 13:19:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_borrow](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[member_id] [int] NOT NULL,
	[book_id] [int] NOT NULL,
	[book_return] [bit] NOT NULL,
 CONSTRAINT [PK_t_borrow] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_member]    Script Date: 29/01/2015 13:19:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_member](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[number] [varchar](50) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_t_member] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[v_book]    Script Date: 29/01/2015 13:19:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_book]
AS
SELECT        dbo.t_book.title, dbo.t_book.author, dbo.t_book.publisher, dbo.t_borrow.book_return, dbo.t_member.number, dbo.t_borrow.id
FROM            dbo.t_book INNER JOIN
                         dbo.t_borrow ON dbo.t_book.id = dbo.t_borrow.book_id INNER JOIN
                         dbo.t_member ON dbo.t_borrow.member_id = dbo.t_member.id

GO
/****** Object:  View [dbo].[v_not_return_book]    Script Date: 29/01/2015 13:19:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_not_return_book]
AS
SELECT        COUNT(dbo.t_borrow.book_id) AS no_of_not_returned_books, dbo.t_member.number, dbo.t_member.name
FROM            dbo.t_book INNER JOIN
                         dbo.t_borrow ON dbo.t_book.id = dbo.t_borrow.book_id INNER JOIN
                         dbo.t_member ON dbo.t_borrow.member_id = dbo.t_member.id
GROUP BY dbo.t_member.number, dbo.t_member.name, dbo.t_borrow.book_return
HAVING        (dbo.t_borrow.book_return = 0)

GO
SET IDENTITY_INSERT [dbo].[t_book] ON 

INSERT [dbo].[t_book] ([id], [title], [author], [publisher]) VALUES (1, N'Java', N'Jackson', N'javaBook')
INSERT [dbo].[t_book] ([id], [title], [author], [publisher]) VALUES (2, N'C#', N'Davit', N'c#Book')
INSERT [dbo].[t_book] ([id], [title], [author], [publisher]) VALUES (1002, N'ObjectiveC', N'Sameuls', N'cBook')
INSERT [dbo].[t_book] ([id], [title], [author], [publisher]) VALUES (1003, N'DBMS', N'Danison', N'dbmsBook')
INSERT [dbo].[t_book] ([id], [title], [author], [publisher]) VALUES (1004, N'Algorithm', N'Asiams', N'A-Book')
INSERT [dbo].[t_book] ([id], [title], [author], [publisher]) VALUES (1005, N'Java Script', N'Json', N'Java Book House')
INSERT [dbo].[t_book] ([id], [title], [author], [publisher]) VALUES (1006, N'Data Structure', N'Davidson', N'D-Book House')
INSERT [dbo].[t_book] ([id], [title], [author], [publisher]) VALUES (1007, N'Oracle', N'Oman', N'DB-House')
SET IDENTITY_INSERT [dbo].[t_book] OFF
SET IDENTITY_INSERT [dbo].[t_borrow] ON 

INSERT [dbo].[t_borrow] ([id], [member_id], [book_id], [book_return]) VALUES (1, 1, 1002, 1)
INSERT [dbo].[t_borrow] ([id], [member_id], [book_id], [book_return]) VALUES (2, 1, 1002, 1)
INSERT [dbo].[t_borrow] ([id], [member_id], [book_id], [book_return]) VALUES (3, 1, 1002, 1)
INSERT [dbo].[t_borrow] ([id], [member_id], [book_id], [book_return]) VALUES (4, 8, 1002, 1)
INSERT [dbo].[t_borrow] ([id], [member_id], [book_id], [book_return]) VALUES (5, 7, 1, 1)
INSERT [dbo].[t_borrow] ([id], [member_id], [book_id], [book_return]) VALUES (6, 10, 1003, 1)
INSERT [dbo].[t_borrow] ([id], [member_id], [book_id], [book_return]) VALUES (7, 8, 2, 0)
INSERT [dbo].[t_borrow] ([id], [member_id], [book_id], [book_return]) VALUES (8, 1, 1004, 1)
INSERT [dbo].[t_borrow] ([id], [member_id], [book_id], [book_return]) VALUES (9, 1, 1003, 1)
INSERT [dbo].[t_borrow] ([id], [member_id], [book_id], [book_return]) VALUES (10, 7, 2, 1)
INSERT [dbo].[t_borrow] ([id], [member_id], [book_id], [book_return]) VALUES (11, 10, 1004, 1)
INSERT [dbo].[t_borrow] ([id], [member_id], [book_id], [book_return]) VALUES (12, 7, 1005, 0)
INSERT [dbo].[t_borrow] ([id], [member_id], [book_id], [book_return]) VALUES (13, 11, 1005, 0)
INSERT [dbo].[t_borrow] ([id], [member_id], [book_id], [book_return]) VALUES (14, 11, 1003, 1)
INSERT [dbo].[t_borrow] ([id], [member_id], [book_id], [book_return]) VALUES (15, 11, 1, 1)
INSERT [dbo].[t_borrow] ([id], [member_id], [book_id], [book_return]) VALUES (16, 7, 1004, 1)
INSERT [dbo].[t_borrow] ([id], [member_id], [book_id], [book_return]) VALUES (17, 7, 1002, 1)
INSERT [dbo].[t_borrow] ([id], [member_id], [book_id], [book_return]) VALUES (18, 7, 1002, 0)
INSERT [dbo].[t_borrow] ([id], [member_id], [book_id], [book_return]) VALUES (19, 10, 1006, 1)
INSERT [dbo].[t_borrow] ([id], [member_id], [book_id], [book_return]) VALUES (20, 13, 1006, 0)
INSERT [dbo].[t_borrow] ([id], [member_id], [book_id], [book_return]) VALUES (21, 13, 1005, 0)
SET IDENTITY_INSERT [dbo].[t_borrow] OFF
SET IDENTITY_INSERT [dbo].[t_member] ON 

INSERT [dbo].[t_member] ([id], [number], [name]) VALUES (1, N'101', N'Sopna')
INSERT [dbo].[t_member] ([id], [number], [name]) VALUES (2, N'102', N'Amir')
INSERT [dbo].[t_member] ([id], [number], [name]) VALUES (3, N'103', N'Sumon')
INSERT [dbo].[t_member] ([id], [number], [name]) VALUES (4, N'104', N'Arfan')
INSERT [dbo].[t_member] ([id], [number], [name]) VALUES (5, N'105', N'Dalim')
INSERT [dbo].[t_member] ([id], [number], [name]) VALUES (6, N'106', N'Sakib')
INSERT [dbo].[t_member] ([id], [number], [name]) VALUES (7, N'101-Bristy', N'Bristy')
INSERT [dbo].[t_member] ([id], [number], [name]) VALUES (8, N'102-Masud', N'Masud')
INSERT [dbo].[t_member] ([id], [number], [name]) VALUES (9, N'103-Shawon', N'Shawon')
INSERT [dbo].[t_member] ([id], [number], [name]) VALUES (10, N'104-Ratna', N'Ratna')
INSERT [dbo].[t_member] ([id], [number], [name]) VALUES (11, N'101-Mukit', N'Mukit')
INSERT [dbo].[t_member] ([id], [number], [name]) VALUES (12, N'101-Jitu', N'Jitu')
INSERT [dbo].[t_member] ([id], [number], [name]) VALUES (13, N'101-Rafi', N'Rafi')
SET IDENTITY_INSERT [dbo].[t_member] OFF
ALTER TABLE [dbo].[t_borrow] ADD  CONSTRAINT [DF_t_borrow_book_return]  DEFAULT ((0)) FOR [book_return]
GO
ALTER TABLE [dbo].[t_borrow]  WITH CHECK ADD  CONSTRAINT [FK_t_borrow_t_book] FOREIGN KEY([book_id])
REFERENCES [dbo].[t_book] ([id])
GO
ALTER TABLE [dbo].[t_borrow] CHECK CONSTRAINT [FK_t_borrow_t_book]
GO
ALTER TABLE [dbo].[t_borrow]  WITH CHECK ADD  CONSTRAINT [FK_t_borrow_t_member] FOREIGN KEY([member_id])
REFERENCES [dbo].[t_member] ([id])
GO
ALTER TABLE [dbo].[t_borrow] CHECK CONSTRAINT [FK_t_borrow_t_member]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "t_book"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t_borrow"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t_member"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 102
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_book'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_book'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "t_book"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t_borrow"
            Begin Extent = 
               Top = 6
               Left = 262
               Bottom = 136
               Right = 448
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t_member"
            Begin Extent = 
               Top = 6
               Left = 486
               Bottom = 119
               Right = 672
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_not_return_book'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_not_return_book'
GO
USE [master]
GO
ALTER DATABASE [LibraryDB] SET  READ_WRITE 
GO
