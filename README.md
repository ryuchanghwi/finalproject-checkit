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

# ⚠️Trouble Shooting
### 1.출석부 수정 시 네트워크 통신을 최소화하기 위한 고민
#### 문제점
- Firebase FireStore를 통해 서버를 구축해 사용량에 제한이 있었고, 실제로 앱 개발을 하면서 사용량을 넘어 Firebase 프로젝트를 다시 만들었던 경험이 있었습니다. 특히 정보를 수정하는 ‘출석부 수정’ 부분에는 출석부를 수정할 때마다 서버를 호출했기 때문에 사용량에 부담을 주고 있다는 것을 알게 되었습니다. 
#### 해결 방안
- 서버에서 호출한 Published된 출석 명단 배열 값과 .onAppear 시에 `@State 변수`에 할당해 변화된 값을 관찰할 수 있게끔 했습니다. 또한 `.onChange 메서드`를 이용해 배열의 값이 변화하는 것을 비교해 버튼 활성화 여부를 결정했습니다. 출석 상태 배열의 값이 변하고 수정 버튼을 눌렀을 시, Published 된 값과 State에 할당한 배열을 비교해, 출석 상태가 변한 유저만 서버와 통신을 할 수 있게끔 했고 서버와의 통신을 최소화할 수 있었습니다.
  
`onAppear 시 @State 변수에 서버에서 가져온 데이터 할당`
``` swift
        .onAppear {
            changedAttendancList = attendanceStore.attendanceList
        }
```

`onChange 메서드를 통해 데이터 변화를 감지, 변화 된다면 버튼 활성화`
``` swift
        .onChange(of: changedAttendancList) { _ in
            if changedAttendancList != attendanceStore.attendanceList {
                changedAttendance = true
            }
            else {
                changedAttendance = false
            }
        }
```

`출석부 수정 버튼 클릭 시 변화된 데이터만 서버에 요청`

``` swift
if changedAttendancList[index] != attendanceStore.attendanceList[index] {
    attendanceStore.updateAttendace(attendanceData: changedAttendancList[index], scheduleID: schedule.id, uid: attendanceStore.attendanceList[index].id)
}
```

# 📱 주요 화면 및 기능

> 🔖 온보딩, 로그인 플로우 - 앱의 설명과 앱을 사용하기 위한 소셜 로그인이 있습니다.
<div align=leading>
<img src="https://github.com/ryuchanghwi/finalproject-checkit/assets/78063938/d728d061-94ea-4da8-b6a7-bb408f65494f" width=200>
</div>

> 🔖 출석 체크 플로우 - 오프라인 장소 인근 50m에 다가가면 출석체크 버튼이 활성화됩니다. 버튼이 활성화되지 않을 경우 QR코드 스캔을 통해 출석체크가 가능합니다. 
<div align=leading>
<img src="https://github.com/ryuchanghwi/finalproject-checkit/assets/78063938/f7e11fff-ed19-4543-b056-251f40cb97cd" width=200>
<img src="https://github.com/ryuchanghwi/finalproject-checkit/assets/78063938/3e29bb8d-4863-484e-8d6a-4f99ae2a0509" width=200>
</div>

<br>

> 🔖 일정 확인 플로우 - 캘린더를 통해 동아리 모임의 일정을 확인할 수 있습니다. 
<div align=leading>
<img src="https://user-images.githubusercontent.com/114602459/219415926-9f99b934-9f61-4426-a65e-a417e7dcdad3.gif" width=200>
</div>

<br>

> 🔖 출석 관리 플로우 - 방장은 자신의 동아리원의 출석을 직접 수정할 수 있습니다. 
<div align=leading>
<img src="https://github.com/ryuchanghwi/finalproject-checkit/assets/78063938/940d756d-5a9e-47eb-a519-1bb98ea63d4a" width=200>
</div>


<br/>

## 3. 사용자 흐름도 및 아키텍쳐
|<img src="https://user-images.githubusercontent.com/114602459/218664674-71695d53-bc57-4502-b29f-623f1613ac05.png" width=500></img>|<img src="https://user-images.githubusercontent.com/114602459/218670095-ef797fff-a1e2-4445-85e3-b0def6bbacbb.png" width=500></img>|<img src="https://user-images.githubusercontent.com/114602459/218669916-fb598978-0029-4466-b97a-86805dc97333.png" width=500></img>|
|:-:|:-:|:-:|
|`User Flow`|`Wire-frame`|`Wire-frame`|

<br/>

## 개발 환경

|개발환경|선택한 방식|
|:---:|:---:|
|브랜치 전략|git-flow|
|이슈 관리|github-Issues|
|구조 관리|MVVM 디자인 패턴|
|Communication|Github와 & Discord를 Webhook 연동|
|Design|Figma|
|문서화|Notion|

<br/>



## 라이센스

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
