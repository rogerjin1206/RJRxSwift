//
//  ViewController.swift
//  RJRxSwift
//
//  Created by Euijae Hong on 2018. 9. 7..
//  Copyright © 2018년 JAEJIN. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

enum MyError : Error {
    
    case anError
    
}

class ViewController: UIViewController {
    
//    let disposeBag = DisposeBag()

}

extension ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let observable = Observable<Void>.empty()
        observable.subscribe(onNext: { data in
            print(data)
        }, onError: { error in
            print(error)
        }, onCompleted: {
            
            print("com")
            
        }) {
            
        }
        observable.subscribe { event in
            print(event)
        }
        
//        let one = 1
//        let two = 2
//        let three = 3
//
//        let observable = Observable<Int>.from([one,two,three])
//
//        _ = observable.subscribe { event in
//
//            if let element = event.element {
//                print(element)
//            }
//
//            print(event)
//
//        }
//
//        _ = observable.subscribe(
//
//            onNext: { element in
//
//            print(element)
//
//        }, onError: { error in
//
//            print(error)
//
//        }, onCompleted: {
//
//            print("completed")
//
//        }, onDisposed: {
//
//            print("disposed")
//        })
//
//        example(of: "publishSubject") { publishSubject() }
////        example(of: "behaviorSubject") { behaviorSubject() }
////        example(of: "replaySubject") { replaySubject() }
//
////        pulishSubject()
        


        
    }

}



extension ViewController {
    
//    public func pulishSubject() {
//
//        let subject = PublishSubject<String>()
//        subject.onNext("Is anyone listening")
//
//        let subscribeOne = subject.subscribe(onNext: { string in
//
//                print(string)
//
//            })
//
//        let subscribeTwo = subject.subscribe(onNext: { string in
//
//        })
//
//
//    }
    
    
    public func example(of description:String, action: () -> Void) {
        
        print("==========\(description)==========")
        action()
        
    }
    
    public func publishSubject() {
        
        let disposeBag = DisposeBag()
        
        let subject = PublishSubject<String>()
        
        subject.onNext("첫번째 신문")
        
        let subscriptionOne = subject
            .subscribe(onNext: { string in
                
                print("First :",string)
                
            })
        
        subject.onNext("두번째 신문")
        
        
        let subscriptionTwo = subject
            .subscribe { event in
                print("2)", event.element ?? event)

        }
        

        
//        let subscriptionTwo = subject
//            .subscribe(onNext: { string in
//
//                print("Second :",string)
//
//            })
        
        subject.onNext("세번째 신문")
        
        subscriptionOne.dispose()
        
        subject.onNext("네번째 신문")
        
        subject.onCompleted()
        
        subject.onNext("다섯번째 신문")
        
        subscriptionTwo.dispose()
        
        let subscriptionThird = subject.subscribe {
            
                print("Third :", $0.element ?? $0)
            
            }.disposed(by: disposeBag)
        
        subject.onNext("여섯번째 신문")
        
    }
    
    
    public func behaviorSubject() {
        
        let subject = BehaviorSubject(value:"Initial value")
        let disposeBag = DisposeBag()
        
        subject.onNext("X")
        subject.onNext("Y")
        subject.onNext("Z")
        
        subject.subscribe {
            print("First :",$0)
        }.disposed(by: disposeBag)
        
        subject.onError(MyError.anError)
        
        _ = subject.subscribe {
            print("Second :",$0)
        }

    }
    
    public func replaySubject() {
        
        let subject = ReplaySubject<String>.create(bufferSize: 2)
        let disposeBag = DisposeBag()
        
        subject.onNext("1")
        subject.onNext("2")
        subject.onNext("3")
        
        subject.subscribe {
            
            print("First :",$0)
            
        }.disposed(by: disposeBag)
        
        subject.subscribe {
            
            print("Second :",$0)
            
        }.disposed(by: disposeBag)
        
        subject.onNext("4")
        subject.onError(MyError.anError)
        
        subject.subscribe {
            
            print("Third :",$0)
            
        }.disposed(by: disposeBag)
        
        
    }
    
}




