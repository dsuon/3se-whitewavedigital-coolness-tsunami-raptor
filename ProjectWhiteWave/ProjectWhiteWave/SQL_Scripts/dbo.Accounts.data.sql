SET IDENTITY_INSERT [dbo].[Accounts] ON
INSERT INTO [dbo].[Accounts] ([AccountId], [Name], [AccountTypeId]) VALUES (1, N'Wally World', 1)
INSERT INTO [dbo].[Accounts] ([AccountId], [Name], [AccountTypeId]) VALUES (2, N'John Doe', 2)
INSERT INTO [dbo].[Accounts] ([AccountId], [Name], [AccountTypeId]) VALUES (3, N'State of California', 3)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
