//
//  BoxOfficeViewController.swift
//  YegrAPIMiniProject
//
//  Created by YJ on 6/6/24.
//

import UIKit
import SnapKit
import Alamofire

class BoxOfficeViewController: UIViewController {
    let boxOfficeView = BoxOfficeView()
    let currentDate = Date()
    var boxOffice: BoxOffice?
    var boxOfficeList: [DailyBoxOfficeList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureTableView()
        setBoxOfficeData(currentDate: 20240605)
    }
    
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(boxOfficeView)
        boxOfficeView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureTableView() {
        boxOfficeView.boxOfficeTableView.dataSource = self
        boxOfficeView.boxOfficeTableView.delegate = self
        
        boxOfficeView.boxOfficeTableView.register(BoxOfficeTableViewCell.self, forCellReuseIdentifier: BoxOfficeTableViewCell.id)
    }
    
    func setBoxOfficeData(currentDate: Int) {
        AF.request("\(APIURL.boxOfficeURL)key=\(APIKey.boxOfficeKey)&targetDt=\(currentDate)").responseDecodable(of: BoxOffice.self) { response in
            switch response.result {
            case .success(let value):
                print(value)
                self.boxOfficeList = value.boxOfficeResult.dailyBoxOfficeList
                self.boxOfficeView.boxOfficeTableView.reloadData()
            case .failure(let error):
                print("error: \(error)")
            }
        }
    }
    
}

extension BoxOfficeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boxOfficeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BoxOfficeTableViewCell.id, for: indexPath) as? BoxOfficeTableViewCell else { return UITableViewCell() }
        cell.rankLabel.text = boxOfficeList[indexPath.row].rank
        cell.moiveNameLabel.text = boxOfficeList[indexPath.row].movieNm
        cell.dateLabel.text = boxOfficeList[indexPath.row].openDt
        
        return cell
    }
}
