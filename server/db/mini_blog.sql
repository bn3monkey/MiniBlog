-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/R8ZUSn
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "User" (
    "Id" integer   NOT NULL,
    "Email" varchar(256)   NOT NULL,
    "Name" varchar(64)   NOT NULL,
    -- ENCRYPTED
    "password" varchar(256)   NOT NULL,
    -- IMAGE URL
    "Profile" varchar(256)   NOT NULL,
    "IsSuperUser" boolean   NOT NULL,
    CONSTRAINT "pk_User" PRIMARY KEY (
        "Id"
     ),
    CONSTRAINT "uc_User_Email" UNIQUE (
        "Email"
    )
);

CREATE TABLE "Section" (
    "Id" integer   NOT NULL,
    "Name" varchar(64)   NOT NULL,
    CONSTRAINT "pk_Section" PRIMARY KEY (
        "Id"
     ),
    CONSTRAINT "uc_Section_Name" UNIQUE (
        "Name"
    )
);

CREATE TABLE "Tag" (
    "Id" integer   NOT NULL,
    "Name" varchar(64)   NOT NULL,
    CONSTRAINT "pk_Tag" PRIMARY KEY (
        "Id"
     ),
    CONSTRAINT "uc_Tag_Name" UNIQUE (
        "Name"
    )
);

CREATE TABLE "Post" (
    "Id" integer   NOT NULL,
    "Title" varchar(64)   NOT NULL,
    "SectionID" integer   NOT NULL,
    "views" integer   NOT NULL,
    "creation_date" timestamp   NOT NULL,
    -- IMAGE URL
    "thumbnail" varchar(256)   NOT NULL,
    "content" text   NOT NULL,
    CONSTRAINT "pk_Post" PRIMARY KEY (
        "Id"
     ),
    CONSTRAINT "uc_Post_Title" UNIQUE (
        "Title"
    )
);

CREATE TABLE "Comment" (
    "Id" integer   NOT NULL,
    "UserId" integer   NOT NULL,
    "content" text   NOT NULL,
    "creation_date" timestamp   NOT NULL,
    CONSTRAINT "pk_Comment" PRIMARY KEY (
        "Id"
     )
);

CREATE TABLE "Reply" (
    "Id" integer   NOT NULL,
    "UserId" integer   NOT NULL,
    "content" text   NOT NULL,
    "creation_date" timestamp   NOT NULL,
    CONSTRAINT "pk_Reply" PRIMARY KEY (
        "Id"
     )
);

CREATE TABLE "Tags_in_post" (
    "Id" integer   NOT NULL,
    "PostID" integer   NOT NULL,
    "TagID" integer   NOT NULL,
    CONSTRAINT "pk_Tags_in_post" PRIMARY KEY (
        "Id"
     )
);

CREATE TABLE "Comments_in_post" (
    "Id" integer   NOT NULL,
    "PostID" integer   NOT NULL,
    "CommentId" integer   NOT NULL,
    CONSTRAINT "pk_Comments_in_post" PRIMARY KEY (
        "Id"
     )
);

CREATE TABLE "Replies_in_comment" (
    "Id" integer   NOT NULL,
    "PostID" integer   NOT NULL,
    "ReplyID" integer   NOT NULL,
    CONSTRAINT "pk_Replies_in_comment" PRIMARY KEY (
        "Id"
     )
);

ALTER TABLE "Post" ADD CONSTRAINT "fk_Post_SectionID" FOREIGN KEY("SectionID")
REFERENCES "Section" ("Id");

ALTER TABLE "Comment" ADD CONSTRAINT "fk_Comment_UserId" FOREIGN KEY("UserId")
REFERENCES "User" ("Id");

ALTER TABLE "Reply" ADD CONSTRAINT "fk_Reply_UserId" FOREIGN KEY("UserId")
REFERENCES "User" ("Id");

ALTER TABLE "Tags_in_post" ADD CONSTRAINT "fk_Tags_in_post_PostID" FOREIGN KEY("PostID")
REFERENCES "Post" ("Id");

ALTER TABLE "Tags_in_post" ADD CONSTRAINT "fk_Tags_in_post_TagID" FOREIGN KEY("TagID")
REFERENCES "Tag" ("Id");

ALTER TABLE "Comments_in_post" ADD CONSTRAINT "fk_Comments_in_post_PostID" FOREIGN KEY("PostID")
REFERENCES "Post" ("Id");

ALTER TABLE "Comments_in_post" ADD CONSTRAINT "fk_Comments_in_post_CommentId" FOREIGN KEY("CommentId")
REFERENCES "Comment" ("Id");

ALTER TABLE "Replies_in_comment" ADD CONSTRAINT "fk_Replies_in_comment_PostID" FOREIGN KEY("PostID")
REFERENCES "Post" ("Id");

ALTER TABLE "Replies_in_comment" ADD CONSTRAINT "fk_Replies_in_comment_ReplyID" FOREIGN KEY("ReplyID")
REFERENCES "Reply" ("Id");

CREATE INDEX "idx_User_Name"
ON "User" ("Name");

CREATE INDEX "idx_Tags_in_post_PostID"
ON "Tags_in_post" ("PostID");

CREATE INDEX "idx_Comments_in_post_PostID"
ON "Comments_in_post" ("PostID");

CREATE INDEX "idx_Comments_in_post_CommentId"
ON "Comments_in_post" ("CommentId");

CREATE INDEX "idx_Replies_in_comment_PostID"
ON "Replies_in_comment" ("PostID");

CREATE INDEX "idx_Replies_in_comment_ReplyID"
ON "Replies_in_comment" ("ReplyID");

