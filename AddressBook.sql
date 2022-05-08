--UC-1-Create-Address-Book-Service-Database--
create database AddressBookServiceDB;
use AddressBookServiceDB;

--UC-2-Add-Addressbook-Table--
create table AddressBook(
FirstName varchar(100),
LastName varchar(100),
Address varchar(100),
City varchar(100),
State varchar (100),
Zip bigint,
PhoneNumber bigint,
Email varchar(100)
);

select * from AddressBook;

--UC-3-Insert-Contact-Details-Into-Table--
insert into AddressBook(FirstName,LastName,Address,City,State,Zip,PhoneNumber,Email)
values('Akshay','Sayre','Ahinsa Chowk','Jabalpur','MP',482002,7999837990,'akshaysayre@gmail.com'),
('Poorva','Rao','Medical Collg','Jabalpur','MP',482002,9584858998,'poorvarao@gmail.com'),
('Anuj','Pandey','Vijay Nagar','Indore','MP',462004,8819096553,'anujpandey@gmail.com'),
('Manali','Chaurasia','Ghadii Chowk','Bhopal','MP',468400,7894561234,'manalichaurasia@gmail.com');

insert into AddressBook(FirstName,LastName,Address,City,State,Zip,PhoneNumber,Email)
values('Rahul','Sayre','Ahinsa Chowk','Jabalpur','MP',482002,9424727909,'rahulsayre@gmail.com');

select * from AddressBook;

--UC-4-Edit-Contact-By-Person's-Name--
update AddressBook set PhoneNumber=9678923184 where FirstName='Rahul';

select * from AddressBook;

--UC-5-Delete-Existing-Contact-Using-Name--
delete AddressBook where FirstName='Rahul';

select * from AddressBook;

--UC-6-Retrieve-Person-Belonging-To-City-Or-State--
select * from AddressBook where City = 'Jabalpur' or State = 'MP';

--UC-7-Size-Of-Addressbook--
select COUNT(*) as StateCount, State from AddressBook group by State;
select COUNT(*) as StateCount, City from AddressBook group by City; 

--UC-8-Sort-Entries-By-Name-Alphabetically--
select * from AddressBook order by FirstName;

--UC-9-Identify-Each-Addressbook-With-Name-And-Type--
alter table Addressbook add ContactType varchar(100) not null default 'Friend';
update AddressBook set ContactType = 'Family' where FirstName = 'Anuj';
select * from AddressBook;

--UC-10-Get-Contact-Count-By-Type--
select COUNT(*) as Type, ContactType from AddressBook group by ContactType;

--UC-11-Add-Person-To-Both-Family-And-Friend--
insert into AddressBook(FirstName,LastName,Address,City,State,Zip,PhoneNumber,Email,ContactType)
values('Akshay','Sayre','Ahinsa Chowk','Jabalpur','MP',482002,7999837990,'akshaysayre@gmail.com','Friend'),
('Akshay','Sayre','Ahinsa Chowk','Jabalpur','MP',482002,7999837990,'akshaysayre@gmail.com','Family');

select * from AddressBook;