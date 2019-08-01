-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/huN6HB
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [Employee] (
    [EmployeeNo] int  NOT NULL ,
    [BirthDate] Date  NOT NULL ,
    [FirstName] str  NOT NULL ,
    [LastName] Str  NOT NULL ,
    [Gender] str  NOT NULL ,
    [HireDate] Date  NOT NULL ,
    CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED (
        [EmployeeNo] ASC
    )
)

CREATE TABLE [Departments] (
    [DeptNo] str  NOT NULL ,
    [DeptName] str  NOT NULL ,
    CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED (
        [DeptNo] ASC
    )
)

CREATE TABLE [Employee_Department] (
    [EmployeeNo] int  NOT NULL ,
    [DeptNo] str  NOT NULL ,
    [FromDate] str  NOT NULL ,
    [ToDate] str  NOT NULL 
)

CREATE TABLE [Dept_manager] (
    [DeptNo] str  NOT NULL ,
    [EmployeeNo] int  NOT NULL ,
    [FromDate] date  NOT NULL ,
    [ToDate] date  NOT NULL 
)

CREATE TABLE [Salaries] (
    [EmployeeNo] int  NOT NULL ,
    [Salary] int  NOT NULL ,
    [FromDate] date  NOT NULL ,
    [ToDate] date  NOT NULL 
)

CREATE TABLE [Titles] (
    [EmployeeNo] int  NOT NULL ,
    [Title] str  NOT NULL ,
    [FromDate] date  NOT NULL ,
    [ToDate] date  NOT NULL ,
    CONSTRAINT [PK_Titles] PRIMARY KEY CLUSTERED (
        [FromDate] ASC
    )
)

ALTER TABLE [Employee_Department] WITH CHECK ADD CONSTRAINT [FK_Employee_Department_EmployeeNo] FOREIGN KEY([EmployeeNo])
REFERENCES [Employee] ([EmployeeNo])

ALTER TABLE [Employee_Department] CHECK CONSTRAINT [FK_Employee_Department_EmployeeNo]

ALTER TABLE [Employee_Department] WITH CHECK ADD CONSTRAINT [FK_Employee_Department_DeptNo] FOREIGN KEY([DeptNo])
REFERENCES [Departments] ([DeptNo])

ALTER TABLE [Employee_Department] CHECK CONSTRAINT [FK_Employee_Department_DeptNo]

ALTER TABLE [Dept_manager] WITH CHECK ADD CONSTRAINT [FK_Dept_manager_DeptNo] FOREIGN KEY([DeptNo])
REFERENCES [Departments] ([DeptNo])

ALTER TABLE [Dept_manager] CHECK CONSTRAINT [FK_Dept_manager_DeptNo]

ALTER TABLE [Dept_manager] WITH CHECK ADD CONSTRAINT [FK_Dept_manager_EmployeeNo] FOREIGN KEY([EmployeeNo])
REFERENCES [Employee] ([EmployeeNo])

ALTER TABLE [Dept_manager] CHECK CONSTRAINT [FK_Dept_manager_EmployeeNo]

ALTER TABLE [Salaries] WITH CHECK ADD CONSTRAINT [FK_Salaries_EmployeeNo] FOREIGN KEY([EmployeeNo])
REFERENCES [Employee] ([EmployeeNo])

ALTER TABLE [Salaries] CHECK CONSTRAINT [FK_Salaries_EmployeeNo]

ALTER TABLE [Titles] WITH CHECK ADD CONSTRAINT [FK_Titles_EmployeeNo] FOREIGN KEY([EmployeeNo])
REFERENCES [Employee] ([EmployeeNo])

ALTER TABLE [Titles] CHECK CONSTRAINT [FK_Titles_EmployeeNo]

COMMIT TRANSACTION QUICKDBD