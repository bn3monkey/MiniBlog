-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/R8ZUSn
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

CREATE TABLE BlogUser (
    id  SERIAL NOT NULL,
    email   varchar(256)    NOT NULL,
    name    varchar(64) NOT NULL,
    -- ENCRYPTED
    password    varchar(256)   NOT NULL,
    -- IMAGE URL
    profile varchar(256)    NOT NULL,
    is_superuser    boolean NOT NULL,
    CONSTRAINT pk_BlogUser PRIMARY KEY (
        id
     ),
    CONSTRAINT uc_BlogUser_Email UNIQUE (
        email
    )
);

CREATE TABLE Section (
    id SERIAL   NOT NULL,
    name varchar(64)   NOT NULL,
    CONSTRAINT pk_Section PRIMARY KEY (
        id
     ),
    CONSTRAINT uc_Section_Name UNIQUE (
        name
    )
);

CREATE TABLE Tag (
    id SERIAL   NOT NULL,
    name varchar(64)   NOT NULL,
    CONSTRAINT pk_Tag PRIMARY KEY (
        id
     ),
    CONSTRAINT uc_Tag_Name UNIQUE (
        name
    )
);

CREATE TABLE Post (
    id SERIAL   NOT NULL,
    title varchar(64)   NOT NULL,
    section_id integer   NOT NULL,
    views integer   NOT NULL,
    creation_date timestamp   NOT NULL,
    -- IMAGE URL
    thumbnail varchar(256)   NOT NULL,
    content text   NOT NULL,
    CONSTRAINT pk_Post PRIMARY KEY (
        id
     ),
    CONSTRAINT uc_Post_Title UNIQUE (
        title
    )
);

CREATE TABLE Comment (
    id SERIAL   NOT NULL,
    user_id integer   NOT NULL,
    content text   NOT NULL,
    creation_date timestamp   NOT NULL,
    CONSTRAINT pk_Comment PRIMARY KEY (
        id
     )
);

CREATE TABLE Reply (
    id SERIAL   NOT NULL,
    user_id integer   NOT NULL,
    content text   NOT NULL,
    creation_date timestamp   NOT NULL,
    CONSTRAINT pk_Reply PRIMARY KEY (
        id
     )
);

CREATE TABLE Tags_in_post (
    id SERIAL   NOT NULL,
    post_id integer   NOT NULL,
    tag_id integer   NOT NULL,
    CONSTRAINT pk_Tags_in_post PRIMARY KEY (
        id
     )
);

CREATE TABLE Comments_in_post (
    id SERIAL   NOT NULL,
    post_id integer   NOT NULL,
    comment_id integer   NOT NULL,
    CONSTRAINT pk_Comments_in_post PRIMARY KEY (
        id
     )
);

CREATE TABLE Replies_in_comment (
    id SERIAL   NOT NULL,
    post_id integer   NOT NULL,
    reply_id integer   NOT NULL,
    CONSTRAINT pk_Replies_in_comment PRIMARY KEY (
        id
     )
);

ALTER TABLE Post ADD CONSTRAINT fk_Post_SectionID FOREIGN KEY(section_id)
REFERENCES Section (id);

ALTER TABLE Comment ADD CONSTRAINT fk_Comment_UserId FOREIGN KEY(user_id)
REFERENCES BlogUser (id);

ALTER TABLE Reply ADD CONSTRAINT fk_Reply_UserId FOREIGN KEY(user_id)
REFERENCES BlogUser (id);

ALTER TABLE Tags_in_post ADD CONSTRAINT fk_Tags_in_post_PostID FOREIGN KEY(post_id)
REFERENCES Post (id);

ALTER TABLE Tags_in_post ADD CONSTRAINT fk_Tags_in_post_TagID FOREIGN KEY(tag_id)
REFERENCES Tag (id);

ALTER TABLE Comments_in_post ADD CONSTRAINT fk_Comments_in_post_PostID FOREIGN KEY(post_id)
REFERENCES Post (id);

ALTER TABLE Comments_in_post ADD CONSTRAINT fk_Comments_in_post_CommentId FOREIGN KEY(comment_id)
REFERENCES Comment (id);

ALTER TABLE Replies_in_comment ADD CONSTRAINT fk_Replies_in_comment_PostID FOREIGN KEY(post_id)
REFERENCES Post (id);

ALTER TABLE Replies_in_comment ADD CONSTRAINT fk_Replies_in_comment_ReplyID FOREIGN KEY(reply_id)
REFERENCES Reply (id);

CREATE INDEX idx_BlogUser_Name
ON BlogUser (name);

CREATE INDEX idx_Tags_in_post_PostID
ON Tags_in_post (post_id);

CREATE INDEX idx_Comments_in_post_PostID
ON Comments_in_post (post_id);

CREATE INDEX idx_Comments_in_post_CommentId
ON Comments_in_post (comment_id);

CREATE INDEX idx_Replies_in_comment_PostID
ON Replies_in_comment (post_id);

CREATE INDEX idx_Replies_in_comment_ReplyID
ON Replies_in_comment (reply_id);

