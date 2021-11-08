# 미니 블로그 서버 API

- [미니 블로그 서버 API](#미니-블로그-서버-api)
  - [게시물 관련 API 목록](#게시물-관련-api-목록)
    - [`GET /`](#get-)
      - [Request Body](#request-body)
      - [Response Body](#response-body)
    - [`GET /post?search_query="검색내용"`](#get-postsearch_query검색내용)
      - [Request Body](#request-body-1)
      - [Response Body](#response-body-1)
    - [`GET /post/:id`](#get-postid)
      - [Request Body](#request-body-2)
      - [Response Body](#response-body-2)
    - [`GET /post/:id/thumbnail`](#get-postidthumbnail)
      - [Request Body](#request-body-3)
      - [Response Body](#response-body-3)
    - [`POST /post`](#post-post)
      - [Request Body](#request-body-4)
      - [Response Body](#response-body-4)
    - [`PUT /post/:id`](#put-postid)
      - [Request Body](#request-body-5)
      - [Response Body](#response-body-5)
    - [`DELETE /post/:id`](#delete-postid)
      - [Request Body](#request-body-6)
      - [Response Body](#response-body-6)
  - [댓글 관련 API 목록](#댓글-관련-api-목록)
    - [`GET /comment/`](#get-comment)
      - [Request Body](#request-body-7)
      - [Response Body](#response-body-7)
    - [`POST /comment/`](#post-comment)
      - [Request Body](#request-body-8)
      - [Response Body](#response-body-8)
    - [`PUT /comment/:id`](#put-commentid)
      - [Request Body](#request-body-9)
      - [Response Body](#response-body-9)
    - [`DELETE /comment/:id`](#delete-commentid)
    - [Request Body](#request-body-10)
    - [Rsponse Body](#rsponse-body)
  - [대댓글 관련 API 목록](#대댓글-관련-api-목록)
    - [`GET /reply/`](#get-reply)
      - [Request Body](#request-body-11)
      - [Response Body](#response-body-10)
    - [`POST /reply/`](#post-reply)
      - [Request Body](#request-body-12)
      - [Response Body](#response-body-11)
    - [`PUT /reply/:id`](#put-replyid)
      - [Request Body](#request-body-13)
      - [Response Body](#response-body-12)
    - [`DELETE /reply/:id`](#delete-replyid)
    - [Request Body](#request-body-14)
    - [Rsponse Body](#rsponse-body-1)
  - [유저 관련 API 목록](#유저-관련-api-목록)
    - [`GET /user/:id`](#get-userid)
      - [Request Body](#request-body-15)
      - [Response Body](#response-body-13)
    - [`GET /user/:id/thumbnail`](#get-useridthumbnail)
      - [Request Body](#request-body-16)
      - [Response Body](#response-body-14)
    - [`PATCH /user/:id`](#patch-userid)
      - [Request Body](#request-body-17)
      - [Response Body](#response-body-15)
    - [`POST /login`](#post-login)
      - [Request Body](#request-body-18)
      - [Response Body](#response-body-16)
    - [`POST /signup/`](#post-signup)
      - [Request Body](#request-body-19)
      - [Response Body](#response-body-17)
    - [`POST /password-find`](#post-password-find)
      - [Request Body](#request-body-20)
      - [Response Body](#response-body-18)

## 게시물 관련 API 목록

### `GET /`

#### Request Body

```json
```

#### Response Body

```json
```

초기 페이지를 요청합니다.

### `GET /post?search_query="검색내용"`

#### Request Body

```json
{
  "section" : ["1", "2"],
  "tag" : ["1", "2"],
}
```

#### Response Body

```json
{
  "posts" : [
    {
      "name" : "",
      "section" : "",
      "tag" : ["1", "2"],
      "creation-date" : 2021-08-23-13:30:28,
      "views" : 23,
      "thumbnail" : "image_url"
    },
    {
      "name" : "",
      "section" : "",
      "tag" : ["1", "2"],
      "creation-date" : 2021-08-23-13:30:28,
      "views" : 23,
      "thumbnail" : "image_url"
    }
  ]
}
```

게시물 목록을 보여줍니다. 제목에 검색 내용이 일부 포함되어 있는 자료만 보여줍니다.

로그인되지 않은 경우와 로그인된 경우 모두 게시물을 보여줍니다.

관리자인 경우, 글쓰기 버튼이 나오도록 해야합니다.

로그인되지 않은 경우는 유저 아이콘을 클릭할 때, login 화면이 보여야 하고 로그인된 경우에는 info(유저 정보 변경) 화면이 보여야 합니다.

### `GET /post/:id`

#### Request Body

```json
```


#### Response Body

```json
{
  "id" : 10,
  "name" : "NAME",
  "views" : 23,
  "creation_date" : 2021-08-27 13:04:30,
  "thumbnail" : "URL",
  "content" : "",
}
```

게시글 화면을 보여줍니다.

로그인되지 않은 경우와 로그인된 경우 모두 게시물을 보여줍니다.
관리자인 경우, 글쓰기 버튼이 나오도록 해야합니다.

:id 에 들어갈 내용은 user id 입니다.

### `GET /post/:id/thumbnail`

#### Request Body

```json
```

#### Response Body

```json
---
thumbnail 이미지
```

해당 게시물의 thumbnail 이미지를 가져옵니다.

### `POST /post`

#### Request Body

```json
{
  "name" : "NAME",
  "content" : "",
}
---
thumbnail 이미지
```

#### Response Body

```json
```

게시글을 생성합니다.
세션에 해당하는 유저가 관리자 권한을 가지고 있어야지만, 해당 요청이 받아들여집니다.

### `PUT /post/:id`

#### Request Body

```json
{
  "name" : "NAME",
  "content" : "",
}
---
thumbnail 이미지
```

#### Response Body

```json
```

게시글을 수정합니다.
세션에 해당하는 유저가 관리자 권한을 가지고 있어야지만, 해당 요청이 받아들여집니다.

### `DELETE /post/:id`

#### Request Body

```json
```

#### Response Body

```json
```

해당 id의 게시글을 삭제합니다.
세션에 해당하는 유저가 관리자 권한을 가지고 있어야지만, 해당 요청이 받아들여집니다.

## 댓글 관련 API 목록

### `GET /comment/`

#### Request Body

```json
{
  "post_id" : 23
}
```

#### Response Body

```json
{
  "comments" : [
    {
      "id" : 34,
      "user" : {
        "id" : 21,
        "name" : 이름,
        "thumbnail" : 썸네일 이미지 주소
      },
      "creation-date" : 생성일자,
      "content" : 글자,
    },
    {
      "id" : 23,
      "user" : {
        "id" : 22,
        "name" : 이름,
        "thumbnail" : 썸네일 이미지 주소
      },
      "creation-date" : 생성일자,
      "content" : 내용,
    }
  ]
}
```

post id에 해당하는 게시글에 있는 모든 댓글을 가져옵니다.

### `POST /comment/`

#### Request Body

```json
{
  "post_id" : 22,
  "user" : {
    "id" : 21,
  },
  "content" : 글자,
},
```

#### Response Body

```json
```

게시글에 댓글을 추가합니다.

### `PUT /comment/:id`

#### Request Body

```json
{
  "user" : {
    "id" : 21,
  },
  "content" : 글자,
},
```

#### Response Body

```json
```

해당 id의 댓글을 수정합니다. 해당 세션의 유저 아이디와 댓글의 유저 아이디가 맞을 때만 유효하게 변경될 수 있습니다.

### `DELETE /comment/:id`

### Request Body
```
```

### Rsponse Body
```
```

댓글을 삭제합니다.


## 대댓글 관련 API 목록

### `GET /reply/`

#### Request Body

```json
{
  "comment_id" : 23
}
```

#### Response Body

```json
{
  "comments" : [
    {
      "id" : 34,
      "user" : {
        "id" : 21,
        "name" : 이름,
        "thumbnail" : 썸네일 이미지 주소
      },
      "creation-date" : 생성일자,
      "content" : 글자,
    },
    {
      "id" : 23,
      "user" : {
        "id" : 22,
        "name" : 이름,
        "thumbnail" : 썸네일 이미지 주소
      },
      "creation-date" : 생성일자,
      "content" : 내용,
    }
  ]
}
```

post id에 해당하는 댓글에 있는 모든 대댓글을 가져옵니다.

### `POST /reply/`

#### Request Body

```json
{
  "comment_id" : 22,
  "user" : {
    "id" : 21,
  },
  "content" : 글자,
},
```

#### Response Body

```json
```

게시글에 대댓글을 추가합니다.

### `PUT /reply/:id`

#### Request Body

```json
{
  "user" : {
    "id" : 21,
  },
  "content" : 글자,
},
```

#### Response Body

```json
```

해당 id의 대댓글을 수정합니다. 해당 세션의 유저 아이디와 댓글의 유저 아이디가 맞을 때만 유효하게 변경될 수 있습니다.

### `DELETE /reply/:id`

### Request Body
```
```

### Rsponse Body
```
```

대댓글을 삭제합니다.

## 유저 관련 API 목록

### `GET /user/:id`

#### Request Body

```json
```

#### Response Body

```json
{
  "id" : 유저_ID,
  "e-mail" : 유저_EMAIL,
  "name" : 유저_별명,
  "thumbnail" : 썸네일_URL,
}
```

해당 유저의 정보를 가져옵니다.

### `GET /user/:id/thumbnail`

#### Request Body

```json
```

#### Response Body

```
Thumbnail 이미지
```

해당 유저의 썸네일 이미지를 가져옵니다.


### `PATCH /user/:id`

#### Request Body

```json
{
  "e-mail" : ""
}
---
thumbnail 이미지
```

해당 유저의 썸네일을 수정합니다.
세션이 접속한 유저와 일치하지 않으면, 거절합니다.


#### Response Body

```json
{
}
```

해당 유저의 thumbnail 이미지와 새 비밀번호를 변경합니다.
세션에 해당하는 유저 id가 아니라면 거절합니다.

### `POST /login`

#### Request Body

```json
{
  "e-mail" : "",
  "password" : "", // 어느 정도 암호화해서 가야되나?
}
```

#### Response Body

```json
{
  "id" : "",
}
```

login 요청을 하고 유저 세션을 가져옵니다.
body에 e-mail와 password를 추가합니다.

Response로 info 화면에 접속할 떄 사용하는 id를 받습니다.


### `POST /signup/`

#### Request Body

```json
{
  "e-mail" : "",
  "name" : "",
  "password" : "", // 어느 정도 암호화해서 가야되나?
}
```
---
thumbnail 파일 multi 뭐시기로

#### Response Body

```json
{
}
```

회원가입을 시도합니다.
body에 email, 이름, 비밀번호, 썸네일 이미지가 포함되어 갑니다.

### `POST /password-find`

#### Request Body

```json
{
  "e-mail" : ""
}
```

#### Response Body

```json
{
}
```

서버에 해당 e-mail 주소로 새로 변경된 password를 보내도록 요청합니다.