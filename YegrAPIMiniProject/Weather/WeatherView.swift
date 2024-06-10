//
//  WeatherView.swift
//  YegrAPIMiniProject
//
//  Created by YJ on 6/7/24.
//

import UIKit

class WeatherView: UIView {
    let descriptionLabelSize = 35
    
    let backgroundImageView = UIImageView()
    let titleView = UIView()
    let titleLabel = UILabel()
    let weatherImageView = UIImageView()
    let locationLabel = UILabel()
    let descriptionStackView = UIStackView()
    let weatherLabel = UILabel()
    let currentTempLabel = UILabel()
    let lowestTempLabel = UILabel()
    let highestTempLabel = UILabel()
   
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
        addSubview(descriptionStackView)
        descriptionStackView.addArrangedSubview(weatherLabel)
        descriptionStackView.addArrangedSubview(currentTempLabel)
        descriptionStackView.addArrangedSubview(lowestTempLabel)
        descriptionStackView.addArrangedSubview(highestTempLabel)
    }
    
    func configureLayout() {
        let safeArea = safeAreaLayoutGuide
        
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
            $0.top.equalTo(weatherImageView.snp.bottom).offset(10)
            $0.centerX.equalTo(safeArea)
            $0.height.equalTo(20)
        }
        
        descriptionStackView.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.bottom).offset(40)
            $0.centerX.equalTo(safeArea)
        }
        
        weatherLabel.snp.makeConstraints {
            $0.height.equalTo(descriptionLabelSize)
        }
        
        currentTempLabel.snp.makeConstraints {
            $0.height.equalTo(descriptionLabelSize)
        }
        
        lowestTempLabel.snp.makeConstraints {
            $0.height.equalTo(descriptionLabelSize)
        }
        
        highestTempLabel.snp.makeConstraints {
            $0.height.equalTo(descriptionLabelSize)
        }
    }
    
    func configureUI() {
        // view
        backgroundColor = UIColor(named: "mainBackgroundColor")
        
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
        weatherImageView.backgroundColor = .white
        weatherImageView.layer.cornerRadius = 10
        
        // locationLabel
        locationLabel.backgroundColor = .clear
        locationLabel.textColor = .darkGray
        locationLabel.textAlignment = .center
        locationLabel.font = .systemFont(ofSize: 20, weight: .heavy)
        
        // descriptionStackView
        descriptionStackView.axis = .vertical
        descriptionStackView.spacing = 10
        descriptionStackView.alignment = .center
        descriptionStackView.distribution = .fillEqually
        
        // weatherLabel
        weatherLabel.setUI(labelTextColor: .label, textFontSize: .boldSystemFont(ofSize: 17))
        
        // currentTempLabel
        currentTempLabel.setUI(labelTextColor: .label, textFontSize: .boldSystemFont(ofSize: 17))
        
        // lowestTempLabel
        lowestTempLabel.setUI(labelTextColor: .label, textFontSize: .boldSystemFont(ofSize: 17))
        
        // highestTempLabel
        highestTempLabel.setUI(labelTextColor: .label, textFontSize: .boldSystemFont(ofSize: 17))
    }
}
