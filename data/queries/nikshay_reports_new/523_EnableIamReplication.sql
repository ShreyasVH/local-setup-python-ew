CREATE TABLE iam_adhtech( id bigint NOT NULL, created_date datetime NULL, name nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, CONSTRAINT PK__iam_adht__3213E83F2172EC14 PRIMARY KEY (id));

INSERT INTO iam_adhtech (id, created_date, name) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM iam_adhtech), '2019-03-20', '99 Dots');
INSERT INTO iam_adhtech (id, created_date, name) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM iam_adhtech), '2019-03-20', 'Video Dots');
INSERT INTO iam_adhtech (id, created_date, name) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM iam_adhtech), '2019-03-20', 'MERM Technology');
INSERT INTO iam_adhtech (id, created_date, name) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM iam_adhtech), '2019-03-23', 'Operation Asha');
INSERT INTO iam_adhtech (id, created_date, name) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM iam_adhtech), '2019-07-01', 'None');
INSERT INTO iam_adhtech (id, created_date, name) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM iam_adhtech), '2021-08-01', '99 Dots Lite');

CREATE function [getAdherenceDoses]( @startDate DATE = NULL, @endDate DATE = NULL, @noOfDays INT = 0, @findString NVARCHAR(10), @adhString NVARCHAR(MAX)) RETURNS INT AS BEGIN DECLARE @totalDoses int SET @totalDoses = ( SELECT CASE WHEN @endDate is not null THEN (LEN(right(@adhString, @noOfDays)) - LEN(REPLACE(right(@adhString, @noOfDays),@findString,''))) ELSE CASE WHEN LEN(@adhString) - DATEDIFF(day,@startDate,GETDATE()) + @noOfDays > 0 THEN LEN(right(@adhString,LEN(@adhString) - DATEDIFF(day,@startDate,GETDATE()) + @noOfDays)) - LEN(REPLACE(right(@adhString,LEN(@adhString) - DATEDIFF(day,@startDate,GETDATE()) + @noOfDays),@findString ,'')) ELSE 0 END END ) RETURN ISNULL(@totalDoses, 0) END;