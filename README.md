# RxSwift Study
뱀장어와 함께 달려봅시다.

# Observable
RxSwift의 핵심이자 제일 중요한 요소 `Observable`<br>
`Observable`은 하나의 `Sequenence` 이며 비동기로(async) 동작하고 이것을 통하여 발생 하는 이벤트들을 `emit`한다라고 표현한다.<br>

### Create
- 단일 element<br>
`let observable = Observable<Int>.just(one)`
- 배열 element<br>
`let observable = Observable<Int>.from([one,two,three])`
- 복수 element<br>
`let observable = Observable<Int>.of(one,two,three)`
- empty element<br>
`let observable = Observable<Void>.empty()`(이거 솔직히 어따 써먹는지 모르겠음)<br>
- never<br>
`let observable = Observable<Any>.never()`(no emit,no finish 방출도없고 끝도없음 이것도 어따 써먹는지..흠..)<br>
- range<br>
`let observable = Observable<Int>.range(start: 1, count: 10)`(시퀸스대로 1~10까지 구독자한테 전달 for문과 비슷한)<br>

이렇게 3가지 정도로 Observable을 생성 할 수 있다.

### Subscribe

Observable은 subscribe 를 통하여 구독 할 수 있는데 (subscribe = 구독 같은말이다 사실상...=_=)<br>
구독을 통해서 `Observable`의 각기 다른 3가지 이벤트 및 데이터를 알 수 있다.(Observable 이벤트를 발생 시킴)<br>
 - next <br>
 요소들을 포함하고있는 Observable은 이벤트들을 밑에 두 가지 중 하나의 이벤트가 발생하기전까지 계속 발생하고 내보낸다.
- completed<br>
 이벤트들을 성공적으로 모두다 emit 했을 경우 발생한다.
- error<br>
 에러가 발생 할 경우.<br>
 
 <img width="500" alt="portfolio_view" src="https://github.com/jinlee1206/RJRxSwift/blob/master/resource/Subscribe1.png">
 <img width="500" alt="portfolio_view" src="https://github.com/jinlee1206/RJRxSwift/blob/master/resource/Subscribe2.png">
 
 이렇게 subscribe 를 통하여 이벤트에 대한 관찰 및 핸들링도 가능하다.

[ReactiveX Doc Observable](http://reactivex.io/documentation/ko/observable.html).<br>
[고무망치님의 좋은 Observable 예시](http://rhammer.tistory.com/283?category=649741.)<br>

### Dispose and terminating
`Observable`은 `subscribe`를 하지 않는 이상 아무런 동작도 하지않는다.<br>
**completed**나 **error** 가 발생하기전까지는 계속 next이벤트를 발생시킨다.<br>
- updating -



# Subject
`Subject`는 `Observable` 과 `Observer`의 역할을 동시에 수행한다.<br>
RxSwift에서는 4가지의 타입이 존재하지만 Variable은 조만간 deprecate 될 예정이므로 3가지만 소개 하겠음.<br>
밑에 `Subject`에 관한 3가지 타입을 설명할때 이해를 돕도록 **신문사**와 **구독자**라는 용어를 사용 하겠습니다.

### PublishSubject
`PublishSubject`신문사를 만들때는 안에 콘텐츠 내용들이 하나도없이 구독자들에게 새로운 내용만 emit 한다.
<br>
<br>
`let subject = PublishSubject<String>()`
<br>
이렇게 신문사를 일단 먼저 생성해준다.
<br>
<br>
`subject.onNext("첫번째 신문")`
<br>
그다음 자신의 신문을 구독하는 구독자들에게 신문의 컨텐츠를 실어준다.
<br>
<br>
`let subscriptionOne = subject
  .subscribe(onNext: { string in
    print(string)
  })`
 <br>
그리고 해당 신문사의 내용을 이렇게 구독 해준다.
<br>
<img width="" height=""></img>
<br>
코드를 이렇게 완성 시켰으면 마법같이 아무것도 나오질않는다.
<br>
왜일까 ? 구독자는 신문사에게 구독 신청을했는데..신문을 받질 못했다.
<br>
이유는 간단하다.`PublishSubject`라는 신문사는 구독한 날짜부터 구독 이후의 최근 신문들만을 받아 볼수있다.
<br>
이게 먼소리인가 함은..`subject.onNext("두번째 신문")` 두번째 신문을 발행하게 해보자.(코드 제일 밑에 추가)
<br>
<img width="" height=""></img>
<br>
콘솔창에 두번째 신문이 찍힌다.
<br>
`PublishSubject`라는 신문사는 좀 더러워서 구독한 이후부터 신문사가 발행하는 신문들을 받아 볼수가 있다.(더럽다....퉤)
<br>
구독자가 여러명이어도 상관 없다.중요 한건 **어느시점부터 구독했는가** 가 제일 중요한 요소이다.<br>

신문 내용뿐만아니라 신문사의 상태에 대해서도 알 수 있다.

- updating -



### BehaviorSubject

### ReplaySubject






 







