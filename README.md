# ✅ 프로젝트 소개
-  사용자가 가입한 동아리의 출석체크를 도와주는 앱
-  실제 동아리 활동을 하면서 겪은 불편함을 바탕으로 직접 사용하기 위해서 앱 개발이 시작 되었습니다.
-  기획, 디자인, 개발을 모두 함께 진행했습니다. 

🔗 [앱 다운로드 링크](https://apps.apple.com/kr/app/check-it/id1671302814)


# Check It !

<img src="https://user-images.githubusercontent.com/114602459/219393259-154fa9eb-4d3f-40cb-925a-08c50f1de041.png" width=150></img>&nbsp;&nbsp;<img src="https://user-images.githubusercontent.com/114602459/219393295-0285e3a2-a2b9-4487-9a41-362659e35f45.png" width=150></img>&nbsp;&nbsp;<img src="https://user-images.githubusercontent.com/114602459/219393301-0175a676-3e57-4cdc-b3ca-3bada492b241.png" width=150></img>&nbsp;&nbsp;<img src="https://user-images.githubusercontent.com/114602459/219393310-9f9a604a-f92a-4a50-9f67-0443d1ac126e.png" width=150></img>&nbsp;&nbsp;<img src="https://user-images.githubusercontent.com/114602459/219393314-f240605d-b9a3-41c9-ba43-00cb70d49d95.png" width=150></img>&nbsp;&nbsp;

- 진행 기간
    - 개발 : 2023.01.16 ~ 2023.02
- 출시
    - 1.0.0 : 2023.02
- 기술 스택
    - iOS : SwiftUI, VisionKit
    - Deployment Target : iOS 16.0
    - VisionKit 프레임워크를 사용하기 위해 16버전을 사용했습니다.

<br/>

# 📱 주요 화면 및 기능

> 🔖 온보딩, 로그인 플로우 - 앱의 설명과 앱을 사용하기 위한 소셜 로그인이 있습니다.
<div align=leading>
<img src="https://user-images.githubusercontent.com/114602459/219415770-1c2fc0ba-bf89-4c06-b406-cfd7b97e7d9a.gif" width=200>
</div>

> 🔖 출석 체크 플로우 - 오프라인 장소 인근 50m에 다가가면 출석체크 버튼이 활성화됩니다. 버튼이 활성화되지 않을 경우 QR코드 스캔을 통해 출석체크가 가능합니다. 
<div align=leading>
<img src="https://user-images.githubusercontent.com/114602459/219385438-bf4cac84-1912-4ee5-88f9-8cfe1f479d7a.gif" width=200>
<img src="https://github.com/ryuchanghwi/finalproject-checkit/assets/78063938/3e29bb8d-4863-484e-8d6a-4f99ae2a0509" width=200>
</div>

<br>

> 🔖 일정 확인 플로우 - 캘린더를 통해 동아리 모임의 일정을 확인할 수 있습니다. 
<div align=leading>
<img src="https://user-images.githubusercontent.com/114602459/219415926-9f99b934-9f61-4426-a65e-a417e7dcdad3.gif" width=200>
</div>

<br>


### 버튼 하나로 간편하게 출석하기
> 사용자는 위치 기반 출첵 서비스, 길찾기, QR code 등, 다양한 방법으로 출석할 수 있어요!  
>**약속된 일정 Check It! ➔ 반경 50m 이내 출석하기 버튼 활성화 ➔ 출석 완료 알림**

|<img src="https://user-images.githubusercontent.com/114602459/219385715-09013c0b-5bb4-4071-bff0-26b36d0758ac.gif" width=300></img>|<img src="https://user-images.githubusercontent.com/114602459/219385462-ae5a5870-8ae4-46a2-bc65-4367058337aa.gif" width=300></img>|
|:-:|:-:|
|`2. MapView`|`3. MyPage View`|

<br/>

### 동아리 더 쉽고 효율적으로 관리하기
> 방장과 운영진 및 구성원 각자에게 보여지는 뷰가 달라서 디테일하게 출석부를 관리할 수 있어요!  
>**동아리 개설 ➔ 초대 코드 공유로 가입 ➔ 일정 추가 및 수정 ➔ 출석부 관리**

|<img src="https://user-images.githubusercontent.com/114602459/219385384-6422f1e5-bc96-4517-8c96-4e960ddc038e.gif" width=300></img>|<img src="https://user-images.githubusercontent.com/114602459/219385397-7e8cb939-2713-4b93-bf56-a33dc64f028b.gif" width=300></img>|
|:-:|:-:|
|`4. 동아리 개설`|`5. 동아리 참가`|

|<img src="https://user-images.githubusercontent.com/114602459/219385423-2a66dc89-95b5-42e4-9da9-07f35df094f4.gif" width=300></img>|<img src="https://user-images.githubusercontent.com/114602459/219385438-bf4cac84-1912-4ee5-88f9-8cfe1f479d7a.gif" width=300></img>|
|:-:|:-:|
|`6. 방장 출석부`|`7. 개인 출석부`|

<br/>

## 3. 사용자 흐름도 및 아키텍쳐
|<img src="https://user-images.githubusercontent.com/114602459/218664674-71695d53-bc57-4502-b29f-623f1613ac05.png" width=500></img>|<img src="https://user-images.githubusercontent.com/114602459/218670095-ef797fff-a1e2-4445-85e3-b0def6bbacbb.png" width=500></img>|<img src="https://user-images.githubusercontent.com/114602459/218669916-fb598978-0029-4466-b97a-86805dc97333.png" width=500></img>|
|:-:|:-:|:-:|
|`User Flow`|`Wire-frame`|`Wire-frame`|

<br/>

## 4. 개발 환경

```
- Xcode Version 14.2
- SwiftUI, iOS 16.0
- Auto layoout
- Dark mode, Horizontal mode not supported
```

|개발환경|선택한 방식|
|:---:|:---:|
|브랜치 전략|git-flow|
|이슈 관리|github-Issues|
|구조 관리|MVVM 디자인 패턴|
|Communication|Github와 & Discord를 Webhook 연동|
|Design|Figma|
|문서화|Notion|

<br/>

## 5. 기술 스택


 [**Platforms**]

 <img src="https://img.shields.io/badge/iOS-000000?style=flat&logo=Apple&logoColor=white"/> 

 [**Language & Tools**]

 <img src="https://img.shields.io/badge/Swift-dd2c00?style=flat&logo=swift&logoColor=white"/> <img src="https://img.shields.io/badge/SwiftUI-0D0D0D?style=flat&logo=swift&logoColor=blue"/> <img src="https://img.shields.io/badge/Xcode-00b0ff?style=flat&logo=Xcode&logoColor=white"/>
<img src="https://img.shields.io/badge/Firebase-ff6d00?style=flat&logo=Firebase&logoColor=white"/> <img src="https://img.shields.io/badge/Figma-ff4081?style=flat&logo=Figma&logoColor=white"/>

 [**SNS Login**]

 <img src="https://img.shields.io/badge/kakaotalk-ffcd00?style=flat&logo=kakaotalk&logoColor=000000"/> <img src="https://img.shields.io/badge/Naver-00C300?style=flat&logo=naver&logoColor=white"/> <img src="https://img.shields.io/badge/Google-0288d1?style=flat&logo=Google&logoColor=white"/>
 

<br/>


## 6. 참여자

|허혜민<br/>[@soletree](https://github.com/soletree)|류창휘<br/>[@ryuchanghwi](https://github.com/ryuchanghwi)|윤예린<br/>[@blaire-pi](https://github.com/blaire-pi)|이학진<br/>[@LEEHAKJIN-VV](https://github.com/LEEHAKJIN-VV)|조현호<br/>[@HHCHO0220](https://github.com/HHCHO0220)|황예리<br/>[@hwangyeri](https://github.com/hwangyeri)|
|:-:|:-:|:-:|:-:|:-:|:-:|
|<img src="https://avatars.githubusercontent.com/u/97100404?v=4" width=150>|<img src="https://avatars.githubusercontent.com/u/78063938?v=4" width=150>|<img src="https://avatars.githubusercontent.com/u/56533266?v=4" width=150>|<img src="https://avatars.githubusercontent.com/u/52197436?v=4" width=150>|<img src="https://avatars.githubusercontent.com/u/109830398?v=4" width=150>|<img src="https://avatars.githubusercontent.com/u/114602459?v=4" width=150>

<br/>

## 7. 라이센스

```
Alamofire
- https://github.com/Alamofire/Alamofire

SDWebImage
- https://github.com/SDWebImage/SDWebImage

SwiftyJSON
- https://github.com/SwiftyJSON/SwiftyJSON

Kakao Login SDK for iOS
- https://developers.kakao.com/docs/latest/ko/kakaologin/ios

Firebase Apple Open Source Development
- https://github.com/firebase/firebase-ios-sdk
                
FirebaseUI
- https://github.com/firebase/FirebaseUI-iOS
                
AlertToast
- https://github.com/elai950/AlertToast
```

<br/>
