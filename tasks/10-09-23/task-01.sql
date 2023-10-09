-- Create the persons table
create table person
(
    fname varchar(20),
    lname varchar(20)
);


-- Create the first "Donald Duck" entry
insert into person
values ('Donald', 'Duck');

-- Select all persons to check if Donald exists
select *
from person;

-- Update all records to have the first name "Daisy"
update person
set fname = 'Daisy';

-- Select all persons again to check if the changes have been made
select *
from person;

-- Create two more "Donald Duck" entries
insert into person
values ('Donald', 'Duck');
insert into person
values ('Donald', 'Duck');

-- Delete entries with first name "Daisy" from the table
delete
from person
where fname = 'Daisy';

-- Get schemas
select *
from INFORMATION_SCHEMA.TABLES;

-- Create table again, just to see a pretty error message :)
create table person
(
    fname varchar(20),
    lname varchar(20)
);