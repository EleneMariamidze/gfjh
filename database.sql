CREATE TABLE [university] (
  [id] int PRIMARY KEY,
  [name] nvarchar(255),
  [address] nvarchar(255),
  [country] nvarchar(255),
  [phone_number] nvarchar(255)
)
GO

CREATE TABLE [course] (
  [id] int PRIMARY KEY,
  [name] nvarchar(255),
  [startdate] date,
  [duration] int,
  [price] decimal
)
GO

CREATE TABLE [subject] (
  [id] int PRIMARY KEY,
  [name] nvarchar(255),
  [startdate] date,
  [duration] int,
  [credit] int
)
GO

CREATE TABLE [timetable] (
  [id] int,
  [subject_id] int,
  [day] nvarchar(255),
  [start_time] datetime
)
GO

CREATE TABLE [student] (
  [id] int PRIMARY KEY,
  [user] int,
  [name] nvarchar(255),
  [lastname] nvarchar(255),
  [email] nvarchar(255),
  [address] nvarchar(255),
  [second_address] nvarchar(255),
  [flat_number] nvarchar(255),
  [birthdate] date,
  [gender] nvarchar(255),
  [phone_number] nvarchar(255),
  [GPA] decimal,
  [status] nvarchar(255)
)
GO

CREATE TABLE [student_subject] (
  [id] int,
  [student_id] int,
  [subject_id] int
)
GO

CREATE TABLE [lecturer_subject] (
  [id] int,
  [lecturer_id] int,
  [subject_id] int
)
GO

CREATE TABLE [lecturer] (
  [id] int PRIMARY KEY,
  [user] int,
  [email] nvarchar(255),
  [name] nvarchar(255),
  [lastname] nvarchar(255),
  [address] nvarchar(255),
  [second_address] nvarchar(255),
  [flat_number] nvarchar(255),
  [birthdate] date,
  [gender] nvarchar(255),
  [phone_number] nvarchar(255),
  [accountnumber] nvarchar(255),
  [degree] nvarchar(255)
)
GO

CREATE TABLE [Assistant] (
  [id] int PRIMARY KEY,
  [user] int,
  [email] nvarchar(255),
  [name] nvarchar(255),
  [lastname] nvarchar(255),
  [address] nvarchar(255),
  [second_address] nvarchar(255),
  [flat_number] nvarchar(255),
  [birthdate] date,
  [gender] nvarchar(255),
  [phone_number] nvarchar(255),
  [accountnumber] nvarchar(255)
)
GO

ALTER TABLE [university] ADD FOREIGN KEY ([id]) REFERENCES [course] ([id])
GO

ALTER TABLE [course] ADD FOREIGN KEY ([id]) REFERENCES [subject] ([id])
GO

ALTER TABLE [course] ADD FOREIGN KEY ([id]) REFERENCES [student] ([id])
GO

ALTER TABLE [timetable] ADD FOREIGN KEY ([subject_id]) REFERENCES [subject] ([id])
GO

ALTER TABLE [lecturer_subject] ADD FOREIGN KEY ([lecturer_id]) REFERENCES [lecturer] ([id])
GO

ALTER TABLE [lecturer_subject] ADD FOREIGN KEY ([subject_id]) REFERENCES [subject] ([id])
GO

ALTER TABLE [lecturer] ADD FOREIGN KEY ([id]) REFERENCES [Assistant] ([id])
GO

ALTER TABLE [Assistant] ADD FOREIGN KEY ([id]) REFERENCES [subject] ([id])
GO

ALTER TABLE [student_subject] ADD FOREIGN KEY ([student_id]) REFERENCES [subject] ([id])
GO

ALTER TABLE [student_subject] ADD FOREIGN KEY ([subject_id]) REFERENCES [student] ([id])
GO
