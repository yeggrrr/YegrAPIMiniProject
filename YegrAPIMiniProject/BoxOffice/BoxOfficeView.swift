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
        addSubview(boxOfficeTableView)
    }
    
    func configureLayout() {
        let safeArea = safeAreaLayoutGuide
        
        boxOfficeTableView.snp.makeConstraints {
            $0.edges.equalTo(safeArea)
        }
    }
    
    func configureUI() {
        boxOfficeTableView.backgroundColor = .white
    }
}
