//
//  WeatherViewController.swift
//  YegrAPIMiniProject
//
//  Created by YJ on 6/7/24.
//

import UIKit
import SnapKit
import Alamofire
import Kingfisher

class WeatherViewController: UIViewController {
    let weatherView = WeatherView()
    
    var weather: Weather?
    var main: Main?
    var name: String?
    var weatherIcon: String? = ""
    var weatherInfoList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurHierarchy()
        configureLayout()
        configureUI()
        setWeatherData()
    }
    
    func configurHierarchy() {
        view.addSubview(weatherView)
    }
    
    func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide
        weatherView.snp.makeConstraints {
            $0.edges.equalTo(safeArea)
        }
        
    }
    
    func configureUI() {
        view.backgroundColor = UIColor(named: "mainBackgroundColor")
    }
    
    func setWeatherData() {
        AF.request("\(APIURL.weatherURL)\(APIKey.weatherKey)&lang=kr&units=metric").responseDecodable(of: WeatherResponse.self) { response in
            switch response.result {
            case .success(let value):
                self.weather = value.weather.first
                self.main = value.main
                self.name = value.name
                self.weatherIcon = value.weather[0].icon
                self.setData()
                self.setDescriptionLabel()
            case .failure(let error):
                print("error: \(error)")
            }
        }
    }
    
    func setData() {
        guard let todayWeather = weather?.description else { return }
        guard let temp = main?.temp else { return }
        guard let tempMax = main?.temp_max else { return }
        guard let tempMin = main?.temp_min else { return }
        
        let currentTemperature = String(Int(temp))
        let highestTemperature = String(Int(tempMax))
        let lowestTemperature = String(Int(tempMin))
        
        self.weatherInfoList.append("오늘 날씨 <\(todayWeather)>")
        self.weatherInfoList.append("현재 온도는 \(currentTemperature)°C입니다.")
        self.weatherInfoList.append("최저 온도는 \(lowestTemperature)°C입니다.")
        self.weatherInfoList.append("최고 온도는 \(highestTemperature)°C입니다.")
    }
    
    func setDescriptionLabel() {
        let image = "\(ImageURL.imageURL)\(weatherIcon ?? "02d")@2x.png"
        let url = URL(string: image)
        weatherView.weatherImageView.kf.setImage(with: url)
        weatherView.locationLabel.text = name
        weatherView.weatherLabel.text = weatherInfoList[0]
        weatherView.currentTempLabel.text = weatherInfoList[1]
        weatherView.lowestTempLabel.text = weatherInfoList[2]
        weatherView.highestTempLabel.text = weatherInfoList[3]
    }
}
