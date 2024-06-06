//
//  BoxOfficeTableViewCell.swift
//  YegrAPIMiniProject
//
//  Created by YJ on 6/6/24.
//

import UIKit

class BoxOfficeTableViewCell: UITableViewCell {
    let rankView = UIView()
    let rankLabel = UILabel()
    let moiveNameLabel = UILabel()
    let dateLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configurHierarchy()
        configureLayout()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurHierarchy() {
        contentView.addSubview(rankView)
        rankView.addSubview(rankLabel)
        contentView.addSubview(moiveNameLabel)
        contentView.addSubview(dateLabel)
    }
    
    func configureLayout() {
        let safeArea = contentView.safeAreaLayoutGuide
        
        rankView.snp.makeConstraints {
            $0.centerY.equalTo(safeArea)
            $0.leading.equalTo(20)
            $0.width.equalTo(40)
            $0.height.equalTo(30)
        }
        
        rankLabel.snp.makeConstraints {
            $0.center.equalTo(rankView.snp.center)
        }
        
        moiveNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(safeArea)
            $0.leading.equalTo(rankView.snp.trailing).offset(10)
            $0.width.equalTo(210)
            $0.height.equalTo(30)
        }
        
        dateLabel.snp.makeConstraints {
            $0.centerY.equalTo(safeArea)
            $0.leading.equalTo(moiveNameLabel.snp.trailing).offset(10)
            $0.trailing.equalTo(safeArea).offset(-20)
            $0.height.equalTo(30)
        }
    }
    
    func configureUI() {
        rankView.backgroundColor = .systemGray6
        
        rankLabel.textColor = .label
        rankLabel.font = .boldSystemFont(ofSize: 15)
        
        moiveNameLabel.backgroundColor = .clear
        moiveNameLabel.textColor = .white
        moiveNameLabel.font = .boldSystemFont(ofSize: 15)
        
        dateLabel.backgroundColor = .clear
        dateLabel.textColor = .white
        dateLabel.font = .systemFont(ofSize: 13)
        dateLabel.textAlignment = .center
    }
    
    func configureCell(boxOfficeData: DailyBoxOfficeList) {
        rankLabel.text = boxOfficeData.rank
        moiveNameLabel.text = boxOfficeData.movieNm
        dateLabel.text = boxOfficeData.openDt
        backgroundColor = .darkGray
    }
}
