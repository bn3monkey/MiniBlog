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

11. QuickDBD를 이용하여 Diagram 생성