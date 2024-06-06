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

    override func viewDidLoad() {
        super.viewDidLoad()

        configurHierarchy()
        configureLayout()
        configureUI()
        getWeatherData()
    }
    
    func configurHierarchy() {
        
    }
    
    func configureLayout() {
        
    }
    
    func configureUI() {
        view.backgroundColor = .white
    }
    
    func getWeatherData() {
        AF.request("\(APIURL.weatherURL)\(APIKey.weatherKey)").responseString { response in
            switch response.result {
            case .success(let value):
                print(value)
            case .failure(let error):
                print(error)
            }
        }
    }
}
