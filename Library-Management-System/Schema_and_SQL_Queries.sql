
create table CATEGORY(
category_id int not null auto_increment,
name varchar(250) not null,
PRIMARY KEY(category_id)
)

create table PUBLISHER(
pub_id int not null auto_increment,
name varchar(250) not null,
address varchar(250) not null,
PRIMARY KEY(pub_id)
)

create table BOOK(
book_id int not null,
title varchar(30) not null,
price float not null,
pub_id int not null,
category_id int not null,
PRIMARY KEY(book_id)
FOREIGN KEY(category_id) references CATEGORY(category_id)
FOREIGN KEY(pub_id) references PUBLISHER(pub_id)
)

create table MEMBER(
member_id int not null,
name varchar(250) not null,
address varchar(250) not null,
join_date date not null,
PRIMARY KEY(member_id)
)

create table BORROWING_BOOK(
member_id int not null,
book_id int not null,
borrow_date date not null,
due_date date not null,
return_date date not null,
PRIMARY KEY(member_id, book_id, borrow_date)
FOREIGN KEY(member_id) references MEMBER(member_id)
FOREIGN KEY(book_id) references BOOK(book_id)
)