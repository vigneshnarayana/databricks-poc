-- Employee
Create Table employee (
 empno number not null,
 firstname varchar(100),
 lastname varchar(100),
 gender varchar(100),
 deptno number,
 salary number,
 Constraint empno_pk PRIMARY KEY (empno)
 );
 
 
 Insert into employee values (1001,	'Clark',	'Kent',	'Male',	10,	250000);
 Insert into employee values (1002,	'Louis',	'Lane',	'Female',	20,	200000);
 Insert into employee values (1003,	'Lex',	'Luther',	'Male',	30,	150000);
 Insert into employee values (1004, 'Amanda',	'Waller',	'Female',	10,	150000	);
 Insert into employee values (1005, 'Barry',	'Allen',	'Male',	20,	300000	);
 Insert into employee values (1006, 'Wally',	'West',	'Male',	30,	200000	);
 Insert into employee values (1007,	'Bart',	'Allen',	'Male',	10,	200000);
 Insert into employee values (1008,	'Nora',	'Allen',	'Female',	30,	150000);
 Insert into employee values (1009,	'Jay',	'Garrick',	'Male',	20,	120000);
 Insert into employee values (1010,	'Caitlyn',	'Snow',	'Female',	10,	150000);
 Insert into employee values (1011,	'Bruce',	'Wayne',	'Male',	20,	200000);
 Insert into employee values (1012,	'Alfred',	'Pennyworth',	'Male',	30,	110000);
 Insert into employee values (1013,	'Dick',	'Grayson',	'Male',	10,	100000);
 Insert into employee values (1014, 'Selena',	'Kyle',	'Female',	20,	150000	);
 Insert into employee values (1015, 'Barbara',	'Gordon',	'Female',	30,	280000	);
 Commit;
 
 
-- Department
 Create Table department (
  deptno number not null,
  deptname varchar(100),
  deptlocation varchar(100),
  depthead_empno number,
  Constraint deptno_pk Primary key (deptno),
  Constraint depthead_empno_fk Foreign Key (depthead_empno) References employee (empno)
 );
 
 
Insert Into department Values (10, 'Command Ops', 'Building C', 1004);
Insert Into department Values (20, 'Frontline',	'Building A', 1005 );
Insert Into department Values (30, 'Search and Rescue', 'Building B', 1003);
commit;