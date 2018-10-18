//
//  FirstCell.swift
//  RJRxSwift
//
//  Created by Euijae Hong on 18/10/2018.
//  Copyright © 2018 JAEJIN. All rights reserved.
//

import Foundation
import UIKit


class TodoItemTableViewCell : UITableViewCell {
    
    let todoLabel = UILabel().then {
        $0.textColor = .black
        
    }
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .white
        
        contentView.addSubview(todoLabel)
        
        todoLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(withViewModel viewModel: TodoItemPresentable) -> (Void) {
        
        
        todoLabel.text = viewModel.textValue
        
    }

}
