# 지그재그 앱 클론코딩 (라이징 테스트)
<img src="https://user-images.githubusercontent.com/61138164/139539071-10d09d8d-0664-4331-adb7-1b10ec9a3a88.jpeg" width="200" height="200"/>

## 2021-10-30 (토) 진행현황
- 템플릿 형태에 맞게 폴더 구성 및 info.plist 설정
- LaunchScreen으로 스플래시 화면 구현
- TabBarController로 VC들을 연결
- 1주차 구현 계획의 10% 완료 (스플래시 화면 완료, 뼈대 레이아웃 구성중) 

## 2021-10-31 (일) 진행현황
- 메인 5개의 화면 NavigationBar 구현 (뼈대 레이아웃 구성 완료)
- 로그인 시작 View, 이메일로 로그인 View 구현 (로그인 API 제외 완료)
- 1주차 구현 계획의 35% 완료 (로그인 View, 뼈대 레이아웃 구성 완료)
#### 개발 중 이슈 
1. BarButtonItem에 직접 로고 이미지를 등록했을 때 이미지가 안나타남 -> Button을 생성 후 setBackgroundImage를 지정하고 BarButtonItem의 customView에 Button을 지정하는 식으로 해결함
2. 간단한 Segue가 자꾸 안되서 확인해보니 UIViewController를 새로 생성할때 UITabController로 잘못 지정해서 오류가 발생했음
