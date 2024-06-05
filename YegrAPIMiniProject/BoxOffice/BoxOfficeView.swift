//
//  BoxOfficeView.swift
//  YegrAPIMiniProject
//
//  Created by YJ on 6/6/24.
//

import UIKit

class BoxOfficeView: UIView {
    let searchTextField = UITextField()
    let searchButton = UIButton()
    let boxOfficeTableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configurHierarchy()
        configureLayout()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configurHierarchy()
        configureLayout()
        configureUI()
    }
    
    func configurHierarchy() {
        addSubview(searchTextField)
        addSubview(searchButton)
        addSubview(boxOfficeTableView)
    }
    
    func configureLayout() {
        let safeArea = safeAreaLayoutGuide
        
        searchTextField.snp.makeConstraints {
            $0.top.equalTo(safeArea).offset(20)
            $0.leading.equalTo(20)
            $0.height.equalTo(50)
            $0.width.equalTo(280)
        }
        
        searchButton.snp.makeConstraints {
            $0.top.equalTo(safeArea).offset(20)
            $0.leading.equalTo(searchTextField.snp.trailing).offset(5)
            $0.trailing.equalTo(safeArea).offset(-20)
            $0.height.equalTo(50)
        }
        
        
        boxOfficeTableView.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom)
            $0.leading.trailing.bottom.equalTo(safeArea)
        }
    }
    
    func configureUI() {
        searchTextField.backgroundColor = .systemGray
        searchButton.backgroundColor = .systemBlue
        boxOfficeTableView.backgroundColor = .white
    }
}
