# RxSwift Study
뱀장어와 함께 달려봅시다.

# Observable
RxSwift의 핵심이자 제일 중요한 요소 `Observable`<br>

`Observable`은 하나의 `Sequenence` 이며 비동기로(async) 동작하고 이것을 통하여 발생 하는 이벤트들을 `emit`한다라고 표현한다.<br>
<br>
`Observable`3가지의 각각 다른 이벤트를 발생 시킬 수 있는데<br>

 - next <br>
 `요소들을 포함하고있는 Observable은 이벤트들을 밑에 두 가지 중 하나의 이벤트가 발생하기전까지 계속 내보낸다.`
- completed<br>
 ` 이벤트들을 성공적으로 모두다 emit 했을 경우 발생한다.`
- error<br>
 ` 에러가 발생 한 경우.`
 
[고무망치님의 좋은 Observable 예시](http://rhammer.tistory.com/283?category=649741)


 







