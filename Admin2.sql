GO
create database DBProject

GO
use DBProject

go



create table LoginTable
(
	LoginID int identity(1,1) primary key,
	Password varchar(20) not null,
	Email varchar(30) not null unique,
	Type int not null,
)

create table RegService
(
	StaffID int identity(1,1) primary key,
	Name varchar(30) not null,
	Phone char(11),
	Address varchar(30)
)


use DBProject
GO



INSERT INTO LoginTable VALUES ('admin@admin.com' ,'1q2w3e4r' ,   3)


--LOGIN TABLE INSERTIION
INSERT INTO LoginTable(Email, Password, Type) VALUES('viktors.arzanajevs@gmail.com', '1q2w3e4r', 3)

----------------------------------Split Function--------------------------------------

GO
create FUNCTION [dbo].[fnSplitString] 
( 
    @string NVARCHAR(MAX), 
    @delimiter CHAR(1) 
) 
RETURNS @output TABLE(splitdata NVARCHAR(MAX) 
) 
BEGIN 
    DECLARE @start INT, @end INT 
    SELECT @start = 1, @end = CHARINDEX(@delimiter, @string) 
    WHILE @start < LEN(@string) + 1 BEGIN 
        IF @end = 0  
            SET @end = LEN(@string) + 1
       
        INSERT INTO @output (splitdata)  
        VALUES(SUBSTRING(@string, @start, @end - @start)) 
        SET @start = @end + 1 
        SET @end = CHARINDEX(@delimiter, @string, @start)
        
    END 
    RETURN 
END

-----------------------------------------------------------------



---------------------------------------------------------------------------------
--								STORED PROCEDURES							   --
---------------------------------------------------------------------------------
-------------AddService--------------------

GO

CREATE procedure AddService
@Name varchar(50),  
@phone varchar(30),
@Address varchar(50)
AS
BEGIN

INSERT INTO RegService VALUES(@Name , @Phone , @Address)

END

----------------------------------------------
-------------DELETESERVICE--------------------
GO


CREATE PROCEDURE DELETESERVICE
@id int 
AS
BEGIN

delete from RegService where StaffID = @id

END 
----------------------------------------------

-------------GET_SERVICE--------------------
GO



create PROCEDURE GET_SERVICE
@id int ,

@name varchar(20) output,
@phone char(15) output,
@address varchar(100) output
AS

BEGIN

SELECT @name = Name , @phone = RegService.Phone , @address = RegService.Address FROM RegService  where RegService.StaffID = @id

END
----------------------------------------------

-------------GET_SERVICE--------------------


---------------------------------------------------------------------------------
--									TRIGGERS								   --
---------------------------------------------------------------------------------



------------------------------------------------------

GO
------------------------------------------(5)---------------------------------------
/*THIS TRIGGER RESTRICTS TABLE DELETE*/
CREATE TRIGGER DontDeleteTable
ON DATABASE
FOR DROP_TABLE
AS
BEGIN
	PRINT('Table Deletion Not Allowed.')
END




------------------------------------------(6)---------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
GO
/*THIS TRIGGER RESTRICS PROCEDURE DELETE*/
CREATE TRIGGER DontDeleteProcedure
ON DATABASE
FOR DROP_PROCEDURE
AS
BEGIN
	PRINT('Procedure Deletion Not Allowed.')
END



------------------------------------------(7)---------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
GO
/*THIS TRIGGER RESTRICTS VEIW DELETE*/
CREATE TRIGGER DontDeleteView
ON DATABASE
FOR DROP_VIEW
AS
BEGIN
	PRINT('View Deletion Not Allowed.')
END

-----------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------(8)---------------------------------------
GO
/*THIS TRIGGER RESTRICTS FUNCTION DELETE*/
CREATE TRIGGER DontDeleteFunction
ON DATABASE
FOR DROP_FUNCTION
AS
BEGIN
	PRINT('Function Deletion is Not Allowed')
END








--------------------------------------------------------------------------------
--								VIEWS										 --
--------------------------------------------------------------------------------

GO


------------------------------------------(6)---------------------------------------
create VIEW SERVICE_VIEW
AS
SELECT StaffID as ID , Name , Phone, Address from RegService



--------------------------------------------------------------------------------------




USE DBProject
GO

/*----------------------------------------------------------------*/
/*-----------------------------SignUp-----------------------------*/
/*----------------------------------------------------------------*/

----------------------------(1)-------------------------------

/*
returns status = 0 if successful
		status = 1 if email not found
		status = 2 if password is wrong


returns ID of person and type of person i.e patient, doctor, admin on success
returns ID = 0, type = 0 on failure
--Type: 1 -- Patient
--Type: 2 -- Doctor
--Type: 3 -- Admin
*/

create procedure Login

@email varchar(30),
@password varchar(20),
@status int output,
@ID int output,
@type int output

as
begin
	if exists(select * from LoginTable where email=@email)
	BEGIN
		if @password = (select password from LoginTable where email=@email)
		BEGIN
			select @ID = LoginID, @type = [type] from LoginTable where email=@email
			set @status = 0
		END

		else
		BEGIN
			set @status = 2
			set @ID = 0
			set @type = 0
		END
	END

	else
	BEGIN
		set @status = 1
		set @ID = 0
		set @type = 0
	END
end



----------------------------(2)-------------------------------
/*
Signups new patient

returns status = 1 on success
returns status = 0 if patient already exists
*/
GO
create procedure PatientSignup

@name varchar(20),
@phone char(15),
@address varchar(40),
@date Date,
@gender char(1),
@password varchar(20),
@email varchar(30),

@status int output,
@ID int output

as
begin

	if not exists(select * from LoginTable where email=@email)
	begin
		insert into LoginTable values(@password, @email, 1)

		select @id = LoginID from LoginTable where email=@email

		insert into Patient values(@id, @name, @phone, @address, @date, @gender)
		set @status = 1
	end
	
	else
	begin
		set @status = 0
	end

end



