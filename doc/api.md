# 미니 블로그 서버 API

- [미니 블로그 서버 API](#미니-블로그-서버-api)
  - [API 목록](#api-목록)
    - [`GET /`](#get-)
    - [`GET /post?search_query="검색내용"`](#get-postsearch_query검색내용)
    - [`GET /login/`](#get-login)
    - [`POST /login/`](#post-login)
    - [`GET /signup/`](#get-signup)
    - [`POST /signup/`](#post-signup)
    - [`GET /resize/`](#get-resize)
    - [`POST /resize/`](#post-resize)
    - [`GET /password-find/`](#get-password-find)
    - [`POST /password-find`](#post-password-find)
    - [`GET /user/:id`](#get-userid)
    - [`PUT /info/:id`](#put-infoid)
    - [`GET POST/:id`](#get-postid)
    - [`](#)

## API 목록

### `GET /`

초기 페이지를 요청합니다.
3가지 경우로 나뉩니다.

1. 로그인되지 않은 경우
2. 로그인된 경우
3. 관리자인 경우

### `GET /post?search_query="검색내용"`

게시물 목록을 보여줍니다. 제목에 검색 내용이 일부 포함되어 있는 자료만 보여줍니다.

body에
section과 tag 정보를 추가한다.

로그인되지 않은 경우와 로그인된 경우 모두 게시물을 보여줍니다.

관리자인 경우, 글쓰기 버튼이 나오도록 해야합니다.

로그인되지 않은 경우는 유저 아이콘을 클릭할 때, login 화면이 보여야 하고 로그인된 경우에는 info(유저 정보 변경) 화면이 보여야 합니다.

### `GET /login/`

login 화면을 요청합니다.

### `POST /login/`

login 요청을 하고 유저 세션을 가져옵니다.
body에 id와 password를 추가합니다.

### `GET /signup/`

회원가입 화면을 요청 합니다.

### `POST /signup/`

회원가입을 시도합니다.
body에 email, 이름, 비밀번호, 썸네일 이미지가 포함되어 갑니다.

### `GET /resize/`

회원가입 창에서 얼굴 사진을 조절하는 화면을 가져옵니다.

### `POST /resize/`

회원가입 화면으로 돌아갑니다.
등록한 thumbnail 그림은 클라이언트에서 가지고 있도록 합니다.

### `GET /password-find/`

비밀번호 찾기 화면을 요청합니다.

### `POST /password-find`

body에 이메일 주소를 넣습니다.
이메일로 새 비밀번호를 넣었다는 화면을 보여줍니다.

### `GET /user/:id`

유저 정보 수정 화면을 보여준다.

### `PUT /info/:id`

body에 thumbnail 이미지와 새 비밀번호를 넣습니다.

유저 정보를 변경합니다.

### `GET POST/:id`

게시글 화면을 보여줍니다.

### `