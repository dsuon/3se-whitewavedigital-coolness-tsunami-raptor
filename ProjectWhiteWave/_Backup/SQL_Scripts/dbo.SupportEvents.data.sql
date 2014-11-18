SET IDENTITY_INSERT [dbo].[SupportEvents] ON
INSERT INTO [dbo].[SupportEvents] ([SupportEventId], [DateOpened], [DateClosed], [TicketId], [Description]) VALUES (1, N'2014-01-12 12:02:00', N'2014-01-12 14:25:00', 1, N'Fixed loggin issues.')
INSERT INTO [dbo].[SupportEvents] ([SupportEventId], [DateOpened], [DateClosed], [TicketId], [Description]) VALUES (2, N'2014-01-13 07:05:00', N'2014-01-14 12:02:00', 1, N'Created new VPN.')
INSERT INTO [dbo].[SupportEvents] ([SupportEventId], [DateOpened], [DateClosed], [TicketId], [Description]) VALUES (4, N'2014-02-14 06:02:00', N'2014-02-14 14:45:00', 1, N'Added roles to db.')
INSERT INTO [dbo].[SupportEvents] ([SupportEventId], [DateOpened], [DateClosed], [TicketId], [Description]) VALUES (5, N'2014-03-12 15:45:00', NULL, 1, N'Configure intranet.')
INSERT INTO [dbo].[SupportEvents] ([SupportEventId], [DateOpened], [DateClosed], [TicketId], [Description]) VALUES (6, N'2011-04-05 12:30:00', N'2011-05-28 08:05:00', 2, N'Set up auto deposit.')
INSERT INTO [dbo].[SupportEvents] ([SupportEventId], [DateOpened], [DateClosed], [TicketId], [Description]) VALUES (7, N'2013-12-20 00:00:00', NULL, 3, N'Design IT system.')
SET IDENTITY_INSERT [dbo].[SupportEvents] OFF
