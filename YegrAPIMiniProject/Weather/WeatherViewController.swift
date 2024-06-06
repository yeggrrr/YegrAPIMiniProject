//
//  WeatherViewController.swift
//  YegrAPIMiniProject
//
//  Created by YJ on 6/7/24.
//

import UIKit
import SnapKit
import Alamofire

class WeatherViewController: UIViewController {
    let weatherView = WeatherView()
    var weatherInfo: WeatherInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configurHierarchy()
        configureLayout()
        configureUI()
        getWeatherData()
        configureTableView()
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
    
    func configureTableView() {
        weatherView.weatherTableView.delegate = self
        weatherView.weatherTableView.dataSource = self
        weatherView.weatherTableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: WeatherTableViewCell.id)
        weatherView.weatherTableView.backgroundColor = .systemGray6
    }
    
    func getWeatherData() {
        AF.request("\(APIURL.weatherURL)\(APIKey.weatherKey)&lang=kr&units=metric").responseString { response in
            switch response.result {
            case .success(let value):
                print(value)
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.id, for: indexPath) as? WeatherTableViewCell else { return UITableViewCell() }
        return cell
    }
    
    
}
