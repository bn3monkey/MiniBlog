# 윈도우 로컬에서 리눅스 환경설정

1. WSL2로 Ubuntu 20.08 설정함
https://docs.microsoft.com/ko-kr/windows/wsl/install-manual

2. Docker Desktop 설치
https://www.docker.com/products/docker-desktop

3. WSL2 내부에서 Docker 적용
https://docs.microsoft.com/ko-kr/windows/wsl/tutorials/wsl-containers

4. 패키지 업데이트 및 업그레이드
```
sudo apt update && sudo apt upgrade
```

5. VS-Code Remote-WSL 확장, VS-Code Remote-Containers 확장, VS-Code Docker 확장 설치

6. WSL로 Visual studio code 열기

7. MINI BLOG에서 server 디렉토리를 Remote-Container: Open Folder in Container로 Node.js & Postgresql 개발 환경으로 개발 컨데이너 생성

8. 가상환경을 실행하면 5432 포트가 열려있는 DB용 Container와 Node가 설치되어있는 개발환경용 Container가 분리되어 있다.
기본적으로 Node가 설치되어있는 환경에 접속되어 있다. DB용 Container에 있는 postgresql에 접근하려면, 같은 losthost의 5432 포트에 있는 postgresql로 접근해야 한다. 

9. 가상환경 내에서 psql 설치
```
sudo apt update
sudo apt install postgresql postgresql-contrib
```

10. psql -h localhost -p 5432 -d postgres -U postgres (postgres란 DB의 유저이름 postgres이며 로컬호스트의 5432 포트로 접속)

11. 내 계정을 만들고 권한 부여
```bash
CREATE USER bn3monkey WITH PASSWORD 'password';
ALTER ROLE bn3monkey CREATEDB REPLICATION;
\du # 유저 확인
```

12. 내 계정으로 데이터 베이스 생성
```bash
CREATE DATABASE mini_blog with owner bn3monkey;
\l # 데이터베이스 확인
```

13. QuickDBD를 이용하여 Diagram 생성

14. SQL 관련 batch 파일과 sql 파일로 postgresql 서버에 DB 생성

15. UI 보고 API 명세서 만들어야 함

16. server container에서 express 설치
```bash
npm install express --save
```

17. server container에서 pg (postgresql client) 설치
```bash
npm install pg --save
```

18. server container에서 pg (express 세션 기능) 설치
```bash
npm install express-session --save
```

19. server container에서 pg (postgressql를 이용한 세션) 설치
```bash
npm install express-pg-session --save
```

20. server container에서 multer 설치 (이미지 저장 관련 모듈)
```bash
npm install multer --save
```

21. server container에서 bcrypt 설치 (비밀번호 암호화 모듈)
```bash
npm install bcrpyt --save
```

22. sh가 안 되면 개행문자 제거하는거 찾아보자
```
seb -i 
```

23. postman을 다운로드받아서 rest api 테스트를 할 수 있다.

24. server container에서 pg를 위한 session table sql을 받는다.
```bash
npm install connect-pg-simple --save
```

25. post 보낼 때 body에 있는 내용을 분석하기 위해 bodyParser를 받는다.
body Parser 안 써도 되는듯
```bash
npm install body-parser --save
```