
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/14/2014 00:19:41
-- Generated from EDMX file: C:\Users\Robert\Documents\Visual Studio 2013\Projects\ProjectWhiteWave\ProjectWhiteWave\Models\WhiteWaveModels.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [WhiteWaveDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_EmployeeTypeEmployee]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[People_Employee] DROP CONSTRAINT [FK_EmployeeTypeEmployee];
GO
IF OBJECT_ID(N'[dbo].[FK_ItemTypeItem]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Items] DROP CONSTRAINT [FK_ItemTypeItem];
GO
IF OBJECT_ID(N'[dbo].[FK_PhoneNumberTypePhoneNumber]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PhoneNumbers] DROP CONSTRAINT [FK_PhoneNumberTypePhoneNumber];
GO
IF OBJECT_ID(N'[dbo].[FK_EmployeeCLOU]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CLOUs] DROP CONSTRAINT [FK_EmployeeCLOU];
GO
IF OBJECT_ID(N'[dbo].[FK_AccountTypeAccount]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Accounts] DROP CONSTRAINT [FK_AccountTypeAccount];
GO
IF OBJECT_ID(N'[dbo].[FK_EventTypeEvent]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Events] DROP CONSTRAINT [FK_EventTypeEvent];
GO
IF OBJECT_ID(N'[dbo].[FK_PriorityTicket]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tickets] DROP CONSTRAINT [FK_PriorityTicket];
GO
IF OBJECT_ID(N'[dbo].[FK_StatusTicket]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tickets] DROP CONSTRAINT [FK_StatusTicket];
GO
IF OBJECT_ID(N'[dbo].[FK_TicketSupportEvent]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SupportEvents] DROP CONSTRAINT [FK_TicketSupportEvent];
GO
IF OBJECT_ID(N'[dbo].[FK_AccountTicket]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tickets] DROP CONSTRAINT [FK_AccountTicket];
GO
IF OBJECT_ID(N'[dbo].[FK_EmployeeTicket]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tickets] DROP CONSTRAINT [FK_EmployeeTicket];
GO
IF OBJECT_ID(N'[dbo].[FK_EmployeeSupportEvent_Employee]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EmployeeSupportEvent] DROP CONSTRAINT [FK_EmployeeSupportEvent_Employee];
GO
IF OBJECT_ID(N'[dbo].[FK_EmployeeSupportEvent_SupportEvent]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EmployeeSupportEvent] DROP CONSTRAINT [FK_EmployeeSupportEvent_SupportEvent];
GO
IF OBJECT_ID(N'[dbo].[FK_Employee_inherits_Person]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[People_Employee] DROP CONSTRAINT [FK_Employee_inherits_Person];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Tickets]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tickets];
GO
IF OBJECT_ID(N'[dbo].[SupportEvents]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SupportEvents];
GO
IF OBJECT_ID(N'[dbo].[Status]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Status];
GO
IF OBJECT_ID(N'[dbo].[People]', 'U') IS NOT NULL
    DROP TABLE [dbo].[People];
GO
IF OBJECT_ID(N'[dbo].[EmployeeTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EmployeeTypes];
GO
IF OBJECT_ID(N'[dbo].[Items]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Items];
GO
IF OBJECT_ID(N'[dbo].[ItemTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ItemTypes];
GO
IF OBJECT_ID(N'[dbo].[MailingAddresses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MailingAddresses];
GO
IF OBJECT_ID(N'[dbo].[EmailAddresses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EmailAddresses];
GO
IF OBJECT_ID(N'[dbo].[PhoneNumbers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PhoneNumbers];
GO
IF OBJECT_ID(N'[dbo].[PhoneNumberTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PhoneNumberTypes];
GO
IF OBJECT_ID(N'[dbo].[Suppliers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Suppliers];
GO
IF OBJECT_ID(N'[dbo].[CLOUs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CLOUs];
GO
IF OBJECT_ID(N'[dbo].[MOUs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MOUs];
GO
IF OBJECT_ID(N'[dbo].[Accounts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Accounts];
GO
IF OBJECT_ID(N'[dbo].[AccountTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AccountTypes];
GO
IF OBJECT_ID(N'[dbo].[Projects]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Projects];
GO
IF OBJECT_ID(N'[dbo].[Events]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Events];
GO
IF OBJECT_ID(N'[dbo].[EventTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EventTypes];
GO
IF OBJECT_ID(N'[dbo].[ReceivedPayments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ReceivedPayments];
GO
IF OBJECT_ID(N'[dbo].[ContactInformations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ContactInformations];
GO
IF OBJECT_ID(N'[dbo].[Priorities]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Priorities];
GO
IF OBJECT_ID(N'[dbo].[People_Employee]', 'U') IS NOT NULL
    DROP TABLE [dbo].[People_Employee];
GO
IF OBJECT_ID(N'[dbo].[EmployeeSupportEvent]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EmployeeSupportEvent];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Tickets'
CREATE TABLE [dbo].[Tickets] (
    [TicketId] int IDENTITY(1,1) NOT NULL,
    [DateOpened] datetime  NOT NULL,
    [DateClosed] datetime  NULL,
    [PriorityId] int  NOT NULL,
    [StatusId] int  NOT NULL,
    [AccountId] int  NOT NULL,
    [EmployeeId] int  NOT NULL
);
GO

-- Creating table 'SupportEvents'
CREATE TABLE [dbo].[SupportEvents] (
    [SupportEventId] int IDENTITY(1,1) NOT NULL,
    [DateOpened] datetime  NOT NULL,
    [DateClosed] datetime  NULL,
    [TicketId] int  NOT NULL
);
GO

-- Creating table 'Status'
CREATE TABLE [dbo].[Status] (
    [StatusId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'People'
CREATE TABLE [dbo].[People] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'EmployeeTypes'
CREATE TABLE [dbo].[EmployeeTypes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Type] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Items'
CREATE TABLE [dbo].[Items] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Cost] decimal(18,0)  NOT NULL,
    [Value] decimal(18,0)  NOT NULL,
    [ItemTypeId] int  NOT NULL
);
GO

-- Creating table 'ItemTypes'
CREATE TABLE [dbo].[ItemTypes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Type] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'MailingAddresses'
CREATE TABLE [dbo].[MailingAddresses] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Street] nvarchar(max)  NOT NULL,
    [City] nvarchar(max)  NOT NULL,
    [State] nvarchar(max)  NOT NULL,
    [Zip] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'EmailAddresses'
CREATE TABLE [dbo].[EmailAddresses] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Address] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PhoneNumbers'
CREATE TABLE [dbo].[PhoneNumbers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [AreaCode] nvarchar(max)  NOT NULL,
    [Number] nvarchar(max)  NOT NULL,
    [Ext] nvarchar(max)  NULL,
    [PhoneNumberTypeId] int  NOT NULL
);
GO

-- Creating table 'PhoneNumberTypes'
CREATE TABLE [dbo].[PhoneNumberTypes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Type] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Suppliers'
CREATE TABLE [dbo].[Suppliers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CLOUs'
CREATE TABLE [dbo].[CLOUs] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Year] datetime  NOT NULL,
    [Text] varbinary(max)  NOT NULL,
    [EmployeeId] int  NOT NULL
);
GO

-- Creating table 'MOUs'
CREATE TABLE [dbo].[MOUs] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Text] varbinary(max)  NOT NULL
);
GO

-- Creating table 'Accounts'
CREATE TABLE [dbo].[Accounts] (
    [AccountId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [AccountTypeId] int  NOT NULL
);
GO

-- Creating table 'AccountTypes'
CREATE TABLE [dbo].[AccountTypes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Type] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Projects'
CREATE TABLE [dbo].[Projects] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [DateStarted] datetime  NOT NULL,
    [DateEnded] datetime  NULL
);
GO

-- Creating table 'Events'
CREATE TABLE [dbo].[Events] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Date] nvarchar(max)  NOT NULL,
    [EventTypeId] int  NOT NULL
);
GO

-- Creating table 'EventTypes'
CREATE TABLE [dbo].[EventTypes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Type] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ReceivedPayments'
CREATE TABLE [dbo].[ReceivedPayments] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Amount] decimal(18,0)  NOT NULL,
    [Date] datetime  NOT NULL
);
GO

-- Creating table 'ContactInformations'
CREATE TABLE [dbo].[ContactInformations] (
    [ContactId] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'Priorities'
CREATE TABLE [dbo].[Priorities] (
    [PriorityId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'People_Employee'
CREATE TABLE [dbo].[People_Employee] (
    [EmployeeTypeId] int  NOT NULL,
    [SSN] nvarchar(max)  NOT NULL,
    [Id] int  NOT NULL
);
GO

-- Creating table 'EmployeeSupportEvent'
CREATE TABLE [dbo].[EmployeeSupportEvent] (
    [Employees_Id] int  NOT NULL,
    [SupportEvents_SupportEventId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [TicketId] in table 'Tickets'
ALTER TABLE [dbo].[Tickets]
ADD CONSTRAINT [PK_Tickets]
    PRIMARY KEY CLUSTERED ([TicketId] ASC);
GO

-- Creating primary key on [SupportEventId] in table 'SupportEvents'
ALTER TABLE [dbo].[SupportEvents]
ADD CONSTRAINT [PK_SupportEvents]
    PRIMARY KEY CLUSTERED ([SupportEventId] ASC);
GO

-- Creating primary key on [StatusId] in table 'Status'
ALTER TABLE [dbo].[Status]
ADD CONSTRAINT [PK_Status]
    PRIMARY KEY CLUSTERED ([StatusId] ASC);
GO

-- Creating primary key on [Id] in table 'People'
ALTER TABLE [dbo].[People]
ADD CONSTRAINT [PK_People]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'EmployeeTypes'
ALTER TABLE [dbo].[EmployeeTypes]
ADD CONSTRAINT [PK_EmployeeTypes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Items'
ALTER TABLE [dbo].[Items]
ADD CONSTRAINT [PK_Items]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ItemTypes'
ALTER TABLE [dbo].[ItemTypes]
ADD CONSTRAINT [PK_ItemTypes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MailingAddresses'
ALTER TABLE [dbo].[MailingAddresses]
ADD CONSTRAINT [PK_MailingAddresses]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'EmailAddresses'
ALTER TABLE [dbo].[EmailAddresses]
ADD CONSTRAINT [PK_EmailAddresses]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PhoneNumbers'
ALTER TABLE [dbo].[PhoneNumbers]
ADD CONSTRAINT [PK_PhoneNumbers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PhoneNumberTypes'
ALTER TABLE [dbo].[PhoneNumberTypes]
ADD CONSTRAINT [PK_PhoneNumberTypes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Suppliers'
ALTER TABLE [dbo].[Suppliers]
ADD CONSTRAINT [PK_Suppliers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id], [Year] in table 'CLOUs'
ALTER TABLE [dbo].[CLOUs]
ADD CONSTRAINT [PK_CLOUs]
    PRIMARY KEY CLUSTERED ([Id], [Year] ASC);
GO

-- Creating primary key on [Id] in table 'MOUs'
ALTER TABLE [dbo].[MOUs]
ADD CONSTRAINT [PK_MOUs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [AccountId] in table 'Accounts'
ALTER TABLE [dbo].[Accounts]
ADD CONSTRAINT [PK_Accounts]
    PRIMARY KEY CLUSTERED ([AccountId] ASC);
GO

-- Creating primary key on [Id] in table 'AccountTypes'
ALTER TABLE [dbo].[AccountTypes]
ADD CONSTRAINT [PK_AccountTypes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Projects'
ALTER TABLE [dbo].[Projects]
ADD CONSTRAINT [PK_Projects]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Events'
ALTER TABLE [dbo].[Events]
ADD CONSTRAINT [PK_Events]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'EventTypes'
ALTER TABLE [dbo].[EventTypes]
ADD CONSTRAINT [PK_EventTypes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ReceivedPayments'
ALTER TABLE [dbo].[ReceivedPayments]
ADD CONSTRAINT [PK_ReceivedPayments]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [ContactId] in table 'ContactInformations'
ALTER TABLE [dbo].[ContactInformations]
ADD CONSTRAINT [PK_ContactInformations]
    PRIMARY KEY CLUSTERED ([ContactId] ASC);
GO

-- Creating primary key on [PriorityId] in table 'Priorities'
ALTER TABLE [dbo].[Priorities]
ADD CONSTRAINT [PK_Priorities]
    PRIMARY KEY CLUSTERED ([PriorityId] ASC);
GO

-- Creating primary key on [Id] in table 'People_Employee'
ALTER TABLE [dbo].[People_Employee]
ADD CONSTRAINT [PK_People_Employee]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Employees_Id], [SupportEvents_SupportEventId] in table 'EmployeeSupportEvent'
ALTER TABLE [dbo].[EmployeeSupportEvent]
ADD CONSTRAINT [PK_EmployeeSupportEvent]
    PRIMARY KEY CLUSTERED ([Employees_Id], [SupportEvents_SupportEventId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [EmployeeTypeId] in table 'People_Employee'
ALTER TABLE [dbo].[People_Employee]
ADD CONSTRAINT [FK_EmployeeTypeEmployee]
    FOREIGN KEY ([EmployeeTypeId])
    REFERENCES [dbo].[EmployeeTypes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_EmployeeTypeEmployee'
CREATE INDEX [IX_FK_EmployeeTypeEmployee]
ON [dbo].[People_Employee]
    ([EmployeeTypeId]);
GO

-- Creating foreign key on [ItemTypeId] in table 'Items'
ALTER TABLE [dbo].[Items]
ADD CONSTRAINT [FK_ItemTypeItem]
    FOREIGN KEY ([ItemTypeId])
    REFERENCES [dbo].[ItemTypes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ItemTypeItem'
CREATE INDEX [IX_FK_ItemTypeItem]
ON [dbo].[Items]
    ([ItemTypeId]);
GO

-- Creating foreign key on [PhoneNumberTypeId] in table 'PhoneNumbers'
ALTER TABLE [dbo].[PhoneNumbers]
ADD CONSTRAINT [FK_PhoneNumberTypePhoneNumber]
    FOREIGN KEY ([PhoneNumberTypeId])
    REFERENCES [dbo].[PhoneNumberTypes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PhoneNumberTypePhoneNumber'
CREATE INDEX [IX_FK_PhoneNumberTypePhoneNumber]
ON [dbo].[PhoneNumbers]
    ([PhoneNumberTypeId]);
GO

-- Creating foreign key on [EmployeeId] in table 'CLOUs'
ALTER TABLE [dbo].[CLOUs]
ADD CONSTRAINT [FK_EmployeeCLOU]
    FOREIGN KEY ([EmployeeId])
    REFERENCES [dbo].[People_Employee]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_EmployeeCLOU'
CREATE INDEX [IX_FK_EmployeeCLOU]
ON [dbo].[CLOUs]
    ([EmployeeId]);
GO

-- Creating foreign key on [AccountTypeId] in table 'Accounts'
ALTER TABLE [dbo].[Accounts]
ADD CONSTRAINT [FK_AccountTypeAccount]
    FOREIGN KEY ([AccountTypeId])
    REFERENCES [dbo].[AccountTypes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_AccountTypeAccount'
CREATE INDEX [IX_FK_AccountTypeAccount]
ON [dbo].[Accounts]
    ([AccountTypeId]);
GO

-- Creating foreign key on [EventTypeId] in table 'Events'
ALTER TABLE [dbo].[Events]
ADD CONSTRAINT [FK_EventTypeEvent]
    FOREIGN KEY ([EventTypeId])
    REFERENCES [dbo].[EventTypes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_EventTypeEvent'
CREATE INDEX [IX_FK_EventTypeEvent]
ON [dbo].[Events]
    ([EventTypeId]);
GO

-- Creating foreign key on [PriorityId] in table 'Tickets'
ALTER TABLE [dbo].[Tickets]
ADD CONSTRAINT [FK_PriorityTicket]
    FOREIGN KEY ([PriorityId])
    REFERENCES [dbo].[Priorities]
        ([PriorityId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PriorityTicket'
CREATE INDEX [IX_FK_PriorityTicket]
ON [dbo].[Tickets]
    ([PriorityId]);
GO

-- Creating foreign key on [StatusId] in table 'Tickets'
ALTER TABLE [dbo].[Tickets]
ADD CONSTRAINT [FK_StatusTicket]
    FOREIGN KEY ([StatusId])
    REFERENCES [dbo].[Status]
        ([StatusId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_StatusTicket'
CREATE INDEX [IX_FK_StatusTicket]
ON [dbo].[Tickets]
    ([StatusId]);
GO

-- Creating foreign key on [TicketId] in table 'SupportEvents'
ALTER TABLE [dbo].[SupportEvents]
ADD CONSTRAINT [FK_TicketSupportEvent]
    FOREIGN KEY ([TicketId])
    REFERENCES [dbo].[Tickets]
        ([TicketId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TicketSupportEvent'
CREATE INDEX [IX_FK_TicketSupportEvent]
ON [dbo].[SupportEvents]
    ([TicketId]);
GO

-- Creating foreign key on [AccountId] in table 'Tickets'
ALTER TABLE [dbo].[Tickets]
ADD CONSTRAINT [FK_AccountTicket]
    FOREIGN KEY ([AccountId])
    REFERENCES [dbo].[Accounts]
        ([AccountId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_AccountTicket'
CREATE INDEX [IX_FK_AccountTicket]
ON [dbo].[Tickets]
    ([AccountId]);
GO

-- Creating foreign key on [EmployeeId] in table 'Tickets'
ALTER TABLE [dbo].[Tickets]
ADD CONSTRAINT [FK_EmployeeTicket]
    FOREIGN KEY ([EmployeeId])
    REFERENCES [dbo].[People_Employee]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_EmployeeTicket'
CREATE INDEX [IX_FK_EmployeeTicket]
ON [dbo].[Tickets]
    ([EmployeeId]);
GO

-- Creating foreign key on [Employees_Id] in table 'EmployeeSupportEvent'
ALTER TABLE [dbo].[EmployeeSupportEvent]
ADD CONSTRAINT [FK_EmployeeSupportEvent_Employee]
    FOREIGN KEY ([Employees_Id])
    REFERENCES [dbo].[People_Employee]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [SupportEvents_SupportEventId] in table 'EmployeeSupportEvent'
ALTER TABLE [dbo].[EmployeeSupportEvent]
ADD CONSTRAINT [FK_EmployeeSupportEvent_SupportEvent]
    FOREIGN KEY ([SupportEvents_SupportEventId])
    REFERENCES [dbo].[SupportEvents]
        ([SupportEventId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_EmployeeSupportEvent_SupportEvent'
CREATE INDEX [IX_FK_EmployeeSupportEvent_SupportEvent]
ON [dbo].[EmployeeSupportEvent]
    ([SupportEvents_SupportEventId]);
GO

-- Creating foreign key on [Id] in table 'People_Employee'
ALTER TABLE [dbo].[People_Employee]
ADD CONSTRAINT [FK_Employee_inherits_Person]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[People]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------