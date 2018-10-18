//
//  TodoViewModel.swift
//  RJRxSwift
//
//  Created by Euijae Hong on 18/10/2018.
//  Copyright © 2018 JAEJIN. All rights reserved.
//

import Foundation


protocol TodoItemPresentable {
    
    var id : String? { get }
    var textValue : String? { get }
    
}

protocol TodoItemViewDelegate {
    
    func onTodoItemAdded() -> ()
}






struct TodoItemViewModel : TodoItemPresentable {
    
    var id : String?
    var textValue : String?
}


struct TodoViewModel {
    
    
    var newTodoItem : String?
    var items : [TodoItemPresentable] = []
    
    init() {
        
        let item1 = TodoItemViewModel(id: "1", textValue: "Washing Clothes")
        let item2 = TodoItemViewModel(id: "2", textValue: "Buy Groceries")
        let item3 = TodoItemViewModel(id: "3", textValue: "Wash Car")
        
        items.append(item1) 
        items.append(item2)
        items.append(item3)
        
    }
}

extension TodoViewModel : TodoItemViewDelegate {
    
    func onTodoItemAdded() {
        
    }
    
}
