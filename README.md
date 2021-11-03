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

## 2021-11-01 (월) 진행현황
- 회원가입 로직 구현
- 자세히는 회원가입 PanModal, 약관 동의 View, 휴대폰 인증 View, 이메일과 비밀번호 세팅 View, 가입 완료 View를 구현
- 홈 화면의 MenuBar를 구현 => Bar가 넘어가는 애니메이션이 살짝 달라서 피드백 때 어떻게 할지 결정
- 1주차 구현 계획의 85% 완료 (홈 화면에서 PageViewController만 연결하면 됨)
#### 개발 중 이슈 
1. 구현 계획 중 이메일 찾기와 비밀번호 찾기는 우선순위에서 밀림 -> 홈 화면 먼저 구현중
2. PanModal 화면에서 가입하기를 눌렀을 때 panModal이 사라지고 기존 화면에서 NavigationController의 Push로 넘어가야하는데 구현이 막막했음
=> 가입하기를 누를 때 기존 LoginVC에 static Bool 변수를 생성하여 PanModal에서 왔을 시 변수 값을 바꾸는 식으로 해결
3. 약관 동의 View에서 버튼 알고리즘을 구현하기 어려움 (RxSwift를 사용해야할 것 같음) -> 일일이 직접 조건문으로 구현하였는데 SMS, 이메일 부분은 조건문으로 한계가 있어서 완벽히 구현하지는 못함
4. 홈 화면의 MenuBar를 구현할 때, 초기값으로 홈의 밑에만 밑줄이 있게 설정을 하였는데 다른 menu를 선택했을때도 밑줄이 사라지지 않음 -> 구글링을 통해 해결

## 2021-11-02 (화) 진행현황
- 홈 화면의 MenuBar를 CollectionView로 구현하였었는데 Tabman 라이브러리로 교체함
- 홈 화면의 UI를 80% 정도 구현 (해결 못한 이슈 2개와 하트 버튼 추가)

#### 개발 중 이슈 
1. TableView의 rowHeight을 AutoDimension으로 설정하면 제멋대로 설정이 되버림 -> 아직 해결 X
2. Cell안의 ImageView의 width Constraints를 정하지 않으면 제멋대로 Cell 크기가 변함 -> width Constraints를 주어서 해결은 했지만 다른 기종에서의 AutoLayout이 원하는 대로 적용이 안됨

## 2021-11-03 (수) 진행현황
- 회원가입 API를 엮어서 구현, 회원가입 실패시 밑에 경고창으로 보여주는 식으로 구현
- 홈 화면의 UI rowHeight 버그 해결, 하트 버튼 추가

