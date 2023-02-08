create table users
(
    id        bigint generated by default as identity
        primary key,
    email     varchar(120) not null
        constraint uk_6dotkott2kjsp8vw4d0m25fb7
            unique,
    name      varchar(60)  not null,
    nick_name varchar(50)  not null
        constraint uk_pl4047a5k5enw6up4sjs8lyut
            unique,
    password  varchar(256) not null,
    phone     varchar(15)
        constraint uk_du5v5sr43g5bfnji4vb8hg5s3
            unique
);

alter table users
    owner to postgres;


create table friendship
(
    id        bigint generated by default as identity,
    friend_id bigint
        constraint fk3xu72n4ht9qij4qc7wdpb2whd
            references users,
    user_id   bigint
        constraint fkgc658l9wcttfpk0c1d3englh9
            references users,

            PRIMARY KEY (friend_id, user_id)
);

alter table friendship
    owner to postgres;

create table posts
(
    id      bigint generated by default as identity
        primary key,
    date    timestamp,
    head    varchar(1000),
    user_id bigint
        constraint fk5lidm6cqbc7u4xhqpxm898qme
            references users
);

alter table posts
    owner to postgres;

create table if not exists attachments
(
    id      bigint generated by default as identity
        primary key,
    body    varchar(255) not null,
    post_id bigint
        constraint fkpeivhpes6blw5rflv2ty65erl
            references posts
);

alter table attachments
    owner to postgres;




