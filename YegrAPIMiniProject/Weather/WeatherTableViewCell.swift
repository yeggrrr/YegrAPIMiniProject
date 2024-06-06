//
//  WeatherTableViewCell.swift
//  YegrAPIMiniProject
//
//  Created by YJ on 6/7/24.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    let cellBackgroundView = UIView()
    let descriptionLabel = UILabel()
    
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
        contentView.addSubview(cellBackgroundView)
        cellBackgroundView.addSubview(descriptionLabel)
    }
    
    func configureLayout() {
        let safeArea = contentView.safeAreaLayoutGuide
        cellBackgroundView.snp.makeConstraints {
            $0.edges.equalTo(safeArea)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.center.equalTo(safeArea)
        }
    }
    
    func configureUI() {
        cellBackgroundView.backgroundColor = UIColor(named: "mainBackgroundColor")
        
        descriptionLabel.text = "어쩌구저쩌구"
        descriptionLabel.textColor = .label
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = .boldSystemFont(ofSize: 17)
    }
    
    func configureCell(weatherData: WeatherInfo) {
        
    }
    
}
