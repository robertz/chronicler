# Chronicler

### Installation

```bash
box install
```

### Schema

``` sql
create table Post
(
    id           varchar(36) default (uuid())          not null
        primary key,
    title        varchar(255)                          not null,
    slug         varchar(255)                          not null,
    description  varchar(500)                          not null,
    cover_image  varchar(1000)                         null,
    body         text                                  not null,
    created      timestamp   default CURRENT_TIMESTAMP null,
    last_updated timestamp   default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP,
    publish_date timestamp                             null
);

create table Tag
(
    id  varchar(36) default (uuid()) not null
        primary key,
    tag varchar(50)                  not null,
    constraint Tag_tag_uindex
        unique (tag)
);

create table TagPost
(
    tag_id  varchar(36) not null,
    post_id varchar(36) not null,
    primary key (tag_id, post_id),
    constraint TagPost_Post_id_fk
        foreign key (post_id) references Post (id),
    constraint TagPost_Tag_id_fk
        foreign key (tag_id) references Tag (id)
);

create table User
(
    id           varchar(36) default (uuid()) not null
        primary key,
    display_name varchar(50)                  not null,
    email        varchar(255)                 not null,
    password     varchar(1000)                not null,
    constraint User_email_uindex
        unique (email)
);

create table UserPost
(
    user_id varchar(36) not null,
    post_id varchar(36) not null,
    primary key (user_id, post_id),
    constraint UserPost_Post_id_fk
        foreign key (post_id) references Post (id),
    constraint UserPost_User_id_fk
        foreign key (user_id) references User (id)
);

create table Views
(
    post_id     varchar(36)                         not null,
    views       int       default 0                 not null,
    last_viewed timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP,
    constraint Views_Post_id_fk
        foreign key (post_id) references Post (id)
);


```

### THE DAILY BREAD

 > "I am the way, and the truth, and the life; no one comes to the Father, but by me (JESUS)" Jn 14:1-12
