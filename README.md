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

## 2021-11-04 (목) 진행현황
- WKWebView로 상세 페이지 구현
- 웹사이트 연결, 네비게이션 바 구현, 툴바는 80% 구현

#### 개발 중 이슈 
1. TableViewCell안의 CollectionViewCell을 클릭할 때 pushViewController로 넘어가고 싶었는데 안됨 -> Delegate 패턴으로 해결함
2. Toolbar에서 BarButtonItem이 레이아웃이 뒤죽박죽으로 됨 -> 아직 해결 X

## 2021-11-05 ~ 2021-11-06 (금, 토) 진행현황
- Toolbar를 UIView로 바꿔서 구현
- NavigationBar 수정
- 로그인 API 연결
- timer로 구현한 몇초뒤에 사라지는 View를 escaping closure를 통해 수정 구현(피드백 반영)

#### 개발 중 이슈 
1. 장바구니 버튼을 클릭했을때, 클릭이 안되는 문제 발생 -> NavigationBar를 구현할때, UIView안에 버튼들을 배치하고 그 UIView를 customView로 구현한 것이 문제여서 UIButton을 customView로 지정해서 각각 rightBarButtonItem으로 지정해줬더니 문제가 해결됨

## 2021-11-07 (일) 진행현황
- 장바구니 View 구현
- 장바구니의 전체 선택 버튼 구현
- Home의 기본 상품을 보여주는 API 연결

#### 개발 중 이슈 
1. TableViewCell 안의 CollectionViewCell의 정보들을 수정해야했기 때문에 TableViewCell에서 API 연결을 하려고 했으나 그러면 셀의 개수만큼 API통신을 해야함 -> 결국 제일 상위의 ViewController에서 API 통신을 한 뒤, static한 List들을 만들어서 저장 후, TableViewCell에서 사용하여 해결

## 2021-11-08 (월) 진행현황
- 장바구니 Cell안의 버튼 선택 구현
- 로그인 여부 확인할 수 있게 변경
- Home의 배너 자동으로 스크롤될 수 있도록 구현
- 결제 대략적인 UI 구현

## 2021-11-09 (화) 진행현황
- 상세 페이지 View 수정
- 결제 View의 세부 UI 구현
- 스토어 파트에 tabman을 이용하여 위의 탭바 구현
- 모아보기의 View 구현

#### 개발 중 이슈 
1. tableView의 특정 section위에 headerView를 커스텀하고 싶었는데 스토리보드에서 하는 방법을 찾지 못함 -> SnapKit으로 오토레이아웃을 짜고 코드로 추가함

## 2021-11-10 (수) 진행현황
- 찜 View 구현
- 마이페이지 View 구현
- 주문, 리뷰, 쿠폰, 포인트 View 연결 
- Home 추천 아이템 API 연결
- Store 쇼핑몰 랭킹 API 연결 
