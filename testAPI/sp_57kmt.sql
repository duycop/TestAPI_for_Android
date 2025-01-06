USE [57kmt]
GO
/****** Object:  Table [dbo].[msg]    Script Date: 2025-01-06 20:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msg](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[body] [ntext] NOT NULL,
	[time] [datetime] NULL,
 CONSTRAINT [PK_msg] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[msg] ON 
GO
INSERT [dbo].[msg] ([id], [title], [body], [time]) VALUES (1, N'TEST', N'XIN CHAO', CAST(N'2025-01-06T14:20:30.437' AS DateTime))
GO
INSERT [dbo].[msg] ([id], [title], [body], [time]) VALUES (2, N'hello', N'xin chào các bạn sv 57KMT', CAST(N'2025-01-06T14:54:38.423' AS DateTime))
GO
INSERT [dbo].[msg] ([id], [title], [body], [time]) VALUES (3, N'Thông báo nộp giấy vụn', N'giấy để abc', CAST(N'2025-01-06T14:57:09.077' AS DateTime))
GO
INSERT [dbo].[msg] ([id], [title], [body], [time]) VALUES (4, N'Thông báo nộp giấy vụn', N'giấy để abc', CAST(N'2025-01-06T15:02:13.900' AS DateTime))
GO
INSERT [dbo].[msg] ([id], [title], [body], [time]) VALUES (5, N'Nộp bài tập', N'Bài tập cần tự làm, đẩy lên github, share link', CAST(N'2025-01-06T15:08:57.363' AS DateTime))
GO
INSERT [dbo].[msg] ([id], [title], [body], [time]) VALUES (6, N'cài đặt android studio', N'cài đặt và chạy 1 app test hello world', CAST(N'2025-01-06T15:23:16.273' AS DateTime))
GO
INSERT [dbo].[msg] ([id], [title], [body], [time]) VALUES (8, N'Đi chơi tết', N'An toàn là trên hết', CAST(N'2025-01-06T15:33:38.050' AS DateTime))
GO
INSERT [dbo].[msg] ([id], [title], [body], [time]) VALUES (9, N'7', N'Thầy Cốp đỉnh quá ', CAST(N'2025-01-06T15:34:16.317' AS DateTime))
GO
INSERT [dbo].[msg] ([id], [title], [body], [time]) VALUES (10, N'大风', N'đây là test', CAST(N'2025-01-06T15:35:08.200' AS DateTime))
GO
INSERT [dbo].[msg] ([id], [title], [body], [time]) VALUES (11, N'Thầy ơi', N'Thầy đỉnh quả', CAST(N'2025-01-06T15:35:52.710' AS DateTime))
GO
INSERT [dbo].[msg] ([id], [title], [body], [time]) VALUES (13, N'Vũ Trường Quang', N'Cả nhà hạnh phúc', CAST(N'2025-01-06T15:36:13.393' AS DateTime))
GO
INSERT [dbo].[msg] ([id], [title], [body], [time]) VALUES (14, N'Đức Thành', N'Đẳng Cấp Phát Sẽ', CAST(N'2025-01-06T15:37:06.780' AS DateTime))
GO
INSERT [dbo].[msg] ([id], [title], [body], [time]) VALUES (15, N'Đinh Trường An', N'Chúc Mừng Năm Mới', CAST(N'2025-01-06T15:38:43.533' AS DateTime))
GO
INSERT [dbo].[msg] ([id], [title], [body], [time]) VALUES (16, N'Chung', N'T vs cô ấy chỉ là bạn', CAST(N'2025-01-06T15:42:53.227' AS DateTime))
GO
INSERT [dbo].[msg] ([id], [title], [body], [time]) VALUES (17, N'Chung', N'T vs cô ấy chỉ là bạn', CAST(N'2025-01-06T15:42:56.087' AS DateTime))
GO
INSERT [dbo].[msg] ([id], [title], [body], [time]) VALUES (18, N'Đỗ Đức Chung', N'Anh nhớ em (NYC)', CAST(N'2025-01-06T15:42:59.640' AS DateTime))
GO
INSERT [dbo].[msg] ([id], [title], [body], [time]) VALUES (20, N'Thành ', N'T dại dột 123', CAST(N'2025-01-06T15:51:30.037' AS DateTime))
GO
INSERT [dbo].[msg] ([id], [title], [body], [time]) VALUES (21, N'Đỗ Đức Chung', N'Đã chơi some with Dũng', CAST(N'2025-01-06T15:52:58.490' AS DateTime))
GO
INSERT [dbo].[msg] ([id], [title], [body], [time]) VALUES (22, N'Đỗ Đức Chung', N'Đã chơi some with Dũng', CAST(N'2025-01-06T15:53:00.213' AS DateTime))
GO
INSERT [dbo].[msg] ([id], [title], [body], [time]) VALUES (23, N'Cao đức thành', N'A chung nghĩ sao về mối quan hệ đồng tính ?', CAST(N'2025-01-06T15:53:26.400' AS DateTime))
GO
INSERT [dbo].[msg] ([id], [title], [body], [time]) VALUES (24, N'ababab', N'ádfgdsadsfggf', CAST(N'2025-01-06T15:53:54.757' AS DateTime))
GO
INSERT [dbo].[msg] ([id], [title], [body], [time]) VALUES (25, N'sfdggdgfsdf', N'sdgf', CAST(N'2025-01-06T15:54:14.777' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[msg] OFF
GO
ALTER TABLE [dbo].[msg] ADD  CONSTRAINT [DF_msg_time]  DEFAULT (getdate()) FOR [time]
GO
ALTER TABLE [dbo].[msg]  WITH CHECK ADD  CONSTRAINT [CK_title] CHECK  (([title]<>''))
GO
ALTER TABLE [dbo].[msg] CHECK CONSTRAINT [CK_title]
GO
/****** Object:  StoredProcedure [dbo].[SP_MSG]    Script Date: 2025-01-06 20:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Do Duy Cop
-- Create date: 2025-01-06
-- Description:	SP_MSG for app android
-- =============================================
CREATE PROCEDURE [dbo].[SP_MSG]
	@action varchar(50)='list_all',
	@id int=null,
	@title nvarchar(255)=null,
	@body ntext=null
AS
BEGIN
	declare @json nvarchar(max)='';
	if(@action='add_new')
	begin
		if ((@title is null)or(@title='')or(@body is null)or(DATALENGTH(@body) = 0))
		begin
			raiserror(N'Phải nhập dữ liệu cho title và body',16,1);
			return;
		end
		insert into msg(title,body)values(@title,@body);
		select @json=(
			select 1 as [ok], @action+':ok' as [msg]
			for json path, WITHOUT_ARRAY_WRAPPER);
		select @json as [json];
	end
	else if(@action='list_all')
	begin		
		select @json=(
			select 1 as [ok], @action+':ok' as [msg],
			( select TOP 100 * 
			  from msg 
			  ORDER BY 1 DESC
			  for json path) as [data]
			for json path, WITHOUT_ARRAY_WRAPPER);
		select @json as [json];
	end
	else if(@action='get_id')
	begin		
		if not exists(select id from msg where id=@id)
		begin
			raiserror(N'Không tồn tại msg với id=%d',16,1,@id);
			return;
		end
		select @json=(
			select 1 as [ok], @action+':ok' as [msg],
			( select * 
			  from msg 
			  where id=@id
			  for json path) as [data],
			  isnull((select top 1 [id] from [msg] where [id]>@id order by [id]),0) as [next_id]
			for json path, WITHOUT_ARRAY_WRAPPER);
		select @json as [json];
	end
	else if(@action='next_id')
	begin		
		if not exists(select id from msg where id>@id)
		begin
			raiserror(N'Không có msg với id lớn hơn %d',16,1,@id);
			return;
		end
		select @json=(
			select 1 as [ok], @action+':ok' as [msg], (select top 1 [id] from [msg] where [id]>@id order by [id]) as [id]
			for json path, WITHOUT_ARRAY_WRAPPER);
		select @json as [json];
	end
	else if(@action='last_id')
	begin
		select @json=(
			select 1 as [ok], @action+':ok' as [msg], (select top 1 [id] from [msg] order by [id] desc) as [id]
		for json path,WITHOUT_ARRAY_WRAPPER);

		select @json as [json];
	end
END

GO
