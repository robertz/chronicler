# Chronicler

### Installation

```bash
box install
```

### Schema

``` sql
create table Author
(
    id           varchar(36) default (uuid()) not null
        primary key,
    display_name varchar(50)                  null
);

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

create table PostAuthor
(
    post_id   varchar(36) not null,
    author_id varchar(36) not null,
    primary key (post_id, author_id),
    constraint PostAuthor_Author_id_fk
        foreign key (author_id) references Author (id),
    constraint PostAuthor_Post_id_fk
        foreign key (post_id) references Post (id)
);
```

### THE DAILY BREAD

 > "I am the way, and the truth, and the life; no one comes to the Father, but by me (JESUS)" Jn 14:1-12
