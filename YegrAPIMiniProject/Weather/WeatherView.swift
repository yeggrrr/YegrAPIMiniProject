//
//  WeatherView.swift
//  YegrAPIMiniProject
//
//  Created by YJ on 6/7/24.
//

import UIKit

class WeatherView: UIView {
    let backgroundImageView = UIImageView()
    let titleView = UIView()
    let titleLabel = UILabel()
    let weatherImageView = UIImageView()
    let locationLabel = UILabel()
    let weatherTableView = UITableView()
   
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
        addSubview(backgroundImageView)
        addSubview(titleView)
        titleView.addSubview(titleLabel)
        addSubview(weatherImageView)
        addSubview(locationLabel)
        addSubview(weatherTableView)
    }
    
    func configureLayout() {
        let safeArea = safeAreaLayoutGuide
        
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalTo(safeArea)
        }
        
        titleView.snp.makeConstraints {
            $0.top.equalTo(safeArea).offset(10)
            $0.leading.trailing.equalTo(safeArea).inset(30)
            $0.height.equalTo(50)
        }
        
        titleLabel.snp.makeConstraints {
            $0.center.equalTo(titleView.snp.center)
        }
        
        weatherImageView.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(safeArea).inset(100)
            $0.height.equalTo(150)
        }
        
        locationLabel.snp.makeConstraints {
            $0.top.equalTo(weatherImageView.snp.bottom).offset(5)
            $0.centerX.equalTo(safeArea)
            $0.height.equalTo(20)
        }
        
        weatherTableView.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.bottom).offset(10)
            $0.leading.trailing.bottom.equalTo(safeArea)
        }
    }
    
    func configureUI() {
        // view
        backgroundColor = .systemGray6
        
        // backgroundImageView
        backgroundImageView.image = UIImage(named: "weatherBackground")
        backgroundImageView.alpha = 0.3
        
        // titleView
        titleView.backgroundColor = UIColor(named: "titleColor")
        titleView.alpha = 0.9
        titleView.layer.cornerRadius = 20
        titleView.layer.borderWidth = 2
        titleView.layer.borderColor = UIColor.white.cgColor
        
        // titleLabel
        titleLabel.text = "☁️오늘의 날씨☁️"
        titleLabel.textColor = .white
        titleLabel.font = .boldSystemFont(ofSize: 20)
        
        // weatherImageView
        weatherImageView.backgroundColor = .systemCyan
        weatherImageView.layer.cornerRadius = 10
        
        // locationLabel
        locationLabel.backgroundColor = .systemBrown
        locationLabel.text = "서울"
        locationLabel.textColor = .white
        locationLabel.textAlignment = .center
        locationLabel.font = .boldSystemFont(ofSize: 17)
    }
}
