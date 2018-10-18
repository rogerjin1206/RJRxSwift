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
import RxDataSources
import RxGesture
import SnapKit
import Then



class MainViewController: UIViewController {
    
    var viewModel : TodoViewModel?
    
    let cellId = "TodoItemTableViewCell"
    
    lazy var tableView = UITableView().then {
        $0.backgroundColor = .white
        $0.register(TodoItemTableViewCell.self, forCellReuseIdentifier:"TodoItemTableViewCell")
        $0.delegate = self
        $0.dataSource = self
        
    }
    
    let textField = UITextField().then {
        
        $0.backgroundColor = .yellow
        
    }
    
    let addButton = UIButton().then {
        
        $0.setTitle("추가", for: .normal)
        $0.backgroundColor = .white
        $0.setTitleColor(.black, for: .normal)
    }

    
}

extension MainViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        viewModel = TodoViewModel()


    }

}

extension MainViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel?.items.count)!
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? TodoItemTableViewCell
        
        let itemViewModel = viewModel?.items[indexPath.row]
        
        cell?.configure(withViewModel: itemViewModel!)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
        
    }
    
    
    
    
}

extension MainViewController {
    
    fileprivate func setupViews() {
        
        [
            tableView,
            textField,
            addButton
        ].forEach({view.addSubview($0)})
        
        tableView.snp.makeConstraints {
            
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(view.frame.height * 0.7)
        }
        
        textField.snp.makeConstraints {
            
            $0.top.equalTo(tableView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(80)
            
        }
        
        addButton.snp.makeConstraints {
            
            $0.top.equalTo(textField.snp.bottom)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            
        }
        
    }
    

    
}
