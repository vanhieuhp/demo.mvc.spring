insert into role(code, name) values ('ADMIN', 'admin');
insert into role(code, name) values ('USER', 'user');

insert into user(username, password, fullname, status)
values ('admin', 'vanhieudepzai', 'admin', 1);
insert into user(username, password, fullname, status)
values ('vanhieu', 'vanhieudepzai', 'Nguyen Van Hieu', 1);
insert into user(username, password, fullname, status)
values ('thanhphu', 'vanhieudepzai', 'Le Thanh Phu', 1);

insert into user_role(user_id, role_id) values (1, 1);
insert into user_role(user_id, role_id) values (2, 2);
insert into user_role(user_id, role_id) values (2, 2);

