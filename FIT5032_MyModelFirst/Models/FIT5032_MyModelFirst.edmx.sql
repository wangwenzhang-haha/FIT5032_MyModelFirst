
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 07/28/2024 14:05:29
-- Generated from EDMX file: C:\Users\Admin\source\repos\FIT5032_MyModelFirst\FIT5032_MyModelFirst\Models\FIT5032_MyModelFirst.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [FIT5032_MyModelFirst];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'UsersSet'
CREATE TABLE [dbo].[UsersSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [userName] nvarchar(max)  NOT NULL,
    [email] nvarchar(max)  NOT NULL,
    [password] nvarchar(max)  NOT NULL,
    [role] nvarchar(max)  NOT NULL,
    [createdAt] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CoursesSet'
CREATE TABLE [dbo].[CoursesSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [intro] nvarchar(max)  NOT NULL,
    [duration] nvarchar(max)  NOT NULL,
    [createdAt] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'TutorsSet'
CREATE TABLE [dbo].[TutorsSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [firstname] nvarchar(max)  NOT NULL,
    [surname] nvarchar(max)  NOT NULL,
    [intro] nvarchar(max)  NOT NULL,
    [position] nvarchar(max)  NOT NULL,
    [createdAt] nvarchar(max)  NOT NULL,
    [Users_Id] int  NOT NULL
);
GO

-- Creating table 'StudentsSet'
CREATE TABLE [dbo].[StudentsSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [firstname] nvarchar(max)  NOT NULL,
    [surname] nvarchar(max)  NOT NULL,
    [dob] nvarchar(max)  NOT NULL,
    [createdAt] nvarchar(max)  NOT NULL,
    [Users_Id] int  NOT NULL
);
GO

-- Creating table 'ServicesSet'
CREATE TABLE [dbo].[ServicesSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [intro] nvarchar(max)  NOT NULL,
    [price] nvarchar(max)  NOT NULL,
    [content] nvarchar(max)  NOT NULL,
    [createdAt] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PostsSet'
CREATE TABLE [dbo].[PostsSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [title] nvarchar(max)  NOT NULL,
    [subtitle] nvarchar(max)  NOT NULL,
    [content] nvarchar(max)  NOT NULL,
    [createdAt] nvarchar(max)  NOT NULL,
    [UsersId] int  NOT NULL
);
GO

-- Creating table 'ClassesSet'
CREATE TABLE [dbo].[ClassesSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [startDate] nvarchar(max)  NOT NULL,
    [endDate] nvarchar(max)  NOT NULL,
    [createdAt] nvarchar(max)  NOT NULL,
    [TutorsId] int  NOT NULL,
    [CoursesId] int  NOT NULL
);
GO

-- Creating table 'RegistrationsSet'
CREATE TABLE [dbo].[RegistrationsSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [createdAt] nvarchar(max)  NOT NULL,
    [StudentsId] int  NOT NULL,
    [ClassesId] int  NOT NULL,
    [ServicesId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'UsersSet'
ALTER TABLE [dbo].[UsersSet]
ADD CONSTRAINT [PK_UsersSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CoursesSet'
ALTER TABLE [dbo].[CoursesSet]
ADD CONSTRAINT [PK_CoursesSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TutorsSet'
ALTER TABLE [dbo].[TutorsSet]
ADD CONSTRAINT [PK_TutorsSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'StudentsSet'
ALTER TABLE [dbo].[StudentsSet]
ADD CONSTRAINT [PK_StudentsSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ServicesSet'
ALTER TABLE [dbo].[ServicesSet]
ADD CONSTRAINT [PK_ServicesSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PostsSet'
ALTER TABLE [dbo].[PostsSet]
ADD CONSTRAINT [PK_PostsSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ClassesSet'
ALTER TABLE [dbo].[ClassesSet]
ADD CONSTRAINT [PK_ClassesSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'RegistrationsSet'
ALTER TABLE [dbo].[RegistrationsSet]
ADD CONSTRAINT [PK_RegistrationsSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Users_Id] in table 'StudentsSet'
ALTER TABLE [dbo].[StudentsSet]
ADD CONSTRAINT [FK_UsersStudents]
    FOREIGN KEY ([Users_Id])
    REFERENCES [dbo].[UsersSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UsersStudents'
CREATE INDEX [IX_FK_UsersStudents]
ON [dbo].[StudentsSet]
    ([Users_Id]);
GO

-- Creating foreign key on [TutorsId] in table 'ClassesSet'
ALTER TABLE [dbo].[ClassesSet]
ADD CONSTRAINT [FK_TutorsClasses]
    FOREIGN KEY ([TutorsId])
    REFERENCES [dbo].[TutorsSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TutorsClasses'
CREATE INDEX [IX_FK_TutorsClasses]
ON [dbo].[ClassesSet]
    ([TutorsId]);
GO

-- Creating foreign key on [StudentsId] in table 'RegistrationsSet'
ALTER TABLE [dbo].[RegistrationsSet]
ADD CONSTRAINT [FK_StudentsRegistrations]
    FOREIGN KEY ([StudentsId])
    REFERENCES [dbo].[StudentsSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StudentsRegistrations'
CREATE INDEX [IX_FK_StudentsRegistrations]
ON [dbo].[RegistrationsSet]
    ([StudentsId]);
GO

-- Creating foreign key on [ClassesId] in table 'RegistrationsSet'
ALTER TABLE [dbo].[RegistrationsSet]
ADD CONSTRAINT [FK_ClassesRegistrations]
    FOREIGN KEY ([ClassesId])
    REFERENCES [dbo].[ClassesSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClassesRegistrations'
CREATE INDEX [IX_FK_ClassesRegistrations]
ON [dbo].[RegistrationsSet]
    ([ClassesId]);
GO

-- Creating foreign key on [CoursesId] in table 'ClassesSet'
ALTER TABLE [dbo].[ClassesSet]
ADD CONSTRAINT [FK_ClassesCourses]
    FOREIGN KEY ([CoursesId])
    REFERENCES [dbo].[CoursesSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClassesCourses'
CREATE INDEX [IX_FK_ClassesCourses]
ON [dbo].[ClassesSet]
    ([CoursesId]);
GO

-- Creating foreign key on [Users_Id] in table 'TutorsSet'
ALTER TABLE [dbo].[TutorsSet]
ADD CONSTRAINT [FK_UsersTutors]
    FOREIGN KEY ([Users_Id])
    REFERENCES [dbo].[UsersSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UsersTutors'
CREATE INDEX [IX_FK_UsersTutors]
ON [dbo].[TutorsSet]
    ([Users_Id]);
GO

-- Creating foreign key on [UsersId] in table 'PostsSet'
ALTER TABLE [dbo].[PostsSet]
ADD CONSTRAINT [FK_UsersPosts]
    FOREIGN KEY ([UsersId])
    REFERENCES [dbo].[UsersSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UsersPosts'
CREATE INDEX [IX_FK_UsersPosts]
ON [dbo].[PostsSet]
    ([UsersId]);
GO

-- Creating foreign key on [ServicesId] in table 'RegistrationsSet'
ALTER TABLE [dbo].[RegistrationsSet]
ADD CONSTRAINT [FK_ServicesRegistrations]
    FOREIGN KEY ([ServicesId])
    REFERENCES [dbo].[ServicesSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ServicesRegistrations'
CREATE INDEX [IX_FK_ServicesRegistrations]
ON [dbo].[RegistrationsSet]
    ([ServicesId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------