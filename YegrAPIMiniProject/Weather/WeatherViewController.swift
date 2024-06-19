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
import CoreLocation

class WeatherViewController: UIViewController {
    let weatherView = WeatherView()
    let locationManager = CLLocationManager()
    
    var isFirst: Bool = true
    var weatherResponse: WeatherResponse? {
        didSet {
            if let weatherResponse = weatherResponse {
                updateUIData(weatherResponse: weatherResponse)
            }
        }
    }
    var currentCoordinate: CLLocationCoordinate2D? {
        didSet {
            if isFirst {
                setData()
                isFirst = false
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigation()
        configurHierarchy()
        configureLayout()
        configureUI()
        locationManager.delegate = self
        checkCurrentLocationAuthorization()
    }
    
    func configureNavigation() {
        let right = UIBarButtonItem(image: UIImage(systemName: "arrow.counterclockwise"), style: .plain, target: self, action: #selector(reloadButtonClicked))
        navigationItem.rightBarButtonItem = right
        navigationItem.rightBarButtonItem?.tintColor = .white
    }
    
    func configurHierarchy() {
        view.addSubview(weatherView)
    }
    
    func configureLayout() {
        weatherView.snp.makeConstraints {
            $0.edges.equalTo(view)
        }
        
        weatherView.backgroundImageView.snp.makeConstraints {
            $0.edges.equalTo(view)
        }
    }
    
    func configureUI() {
        view.backgroundColor = UIColor(named: "mainBackgroundColor")
    }
    
    func updateUIData(weatherResponse: WeatherResponse) {
        var imageName = "02d@2x.png"
        if let weather = weatherResponse.weather.first {
            imageName = "\(ImageURL.imageURL)\(weather.icon)@2x.png"
            weatherView.weatherLabel.text = "오늘 날씨 <\(weather.description)>"
        }
        let url = URL(string: imageName)
        weatherView.weatherImageView.kf.setImage(with: url)
        
        weatherView.locationLabel.text = weatherResponse.name
        weatherView.currentTempLabel.text = "현재 온도는 \(weatherResponse.main.temp)°C 입니다."
        weatherView.lowestTempLabel.text = "최저 온도는 \(weatherResponse.main.temp_min)°C 입니다."
        weatherView.highestTempLabel.text = "최고 온도는 \(weatherResponse.main.temp_max)°C 입니다."
    }
    
    func setWeatherData(currentCoordinate: CLLocationCoordinate2D, completion: @escaping(WeatherResponse?) -> Void) {
        AF.request("\(APIURL.weatherURL)lat=\(currentCoordinate.latitude)&lon=\(currentCoordinate.longitude)&appid=\(APIKey.weatherKey)&lang=kr&units=metric").responseDecodable(of: WeatherResponse.self) { response in
            switch response.result {
            case .success(let value):
                self.weatherResponse = value
            case .failure(let error):
                self.showAlert(title: "weather API 호출 실패 : \(error.localizedDescription)")
            }
        }
    }
    
    func setData() {
        guard let currentCoordinate = currentCoordinate else { return }
        
        setWeatherData(currentCoordinate: currentCoordinate) { weatherData in
            if let weatherData = weatherData {
                self.updateUIData(weatherResponse: weatherData)
            } else {
                self.showAlert(title: "데이터를 정상적으로 받아오는데 실패했습니다. 다시시도해주세요.")
            }
        }
    }
    
    func showAlert(title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "닫기", style: .default)
        alert.addAction(okButton)
        present(alert, animated: true)
    }
    
    @objc func reloadButtonClicked() {
        setData()
    }
}

extension WeatherViewController {
    func checkDeviceLocationAuthorization() {
        if CLLocationManager.locationServicesEnabled() {
            checkCurrentLocationAuthorization()
        } else {
            showAlert(title: "위치 서비스가 꺼져 있어서, 위치 권한 요청을 할 수 없어요")
        }
    }
    
    func checkCurrentLocationAuthorization() {
        var status = locationManager.authorizationStatus
        
        if #available(iOS 14.0, *) {
            status = locationManager.authorizationStatus
        } else {
            status = CLLocationManager.authorizationStatus()
        }
        
        switch status {
        case .notDetermined:
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
        case .denied:
            showAlert(title: "위치 정보 접근 권한이 없어서 날씨를 불러올 수 없습니다.")
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            setData()
        default:
            break
        }
    }
}

extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate = locations.last?.coordinate {
            currentCoordinate = coordinate
        }
        
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(#function, "iOS14+")
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(#function, "iOS14-")
        checkDeviceLocationAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print(#function, "iOS14+")
    }
}
