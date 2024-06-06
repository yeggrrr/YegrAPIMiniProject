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
    var boxOffice: BoxOffice?
    var boxOfficeList: [DailyBoxOfficeList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureTableView()
        setBoxOfficeData(date: getYesterdayDate())
    }
    
    func configureUI() {
        view.backgroundColor = .darkGray
        view.addSubview(boxOfficeView)
        boxOfficeView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        boxOfficeView.searchButton.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
    }
    
    func configureTableView() {
        boxOfficeView.boxOfficeTableView.dataSource = self
        boxOfficeView.boxOfficeTableView.delegate = self
        boxOfficeView.boxOfficeTableView.register(BoxOfficeTableViewCell.self, forCellReuseIdentifier: BoxOfficeTableViewCell.id)
        boxOfficeView.boxOfficeTableView.backgroundColor = .darkGray
    }
    
    func setBoxOfficeData(date: String) {
        AF.request("\(APIURL.boxOfficeURL)key=\(APIKey.boxOfficeKey)&targetDt=\(date)").responseDecodable(of: BoxOffice.self) { response in
            switch response.result {
            case .success(let value):
                self.boxOfficeList = value.boxOfficeResult.dailyBoxOfficeList
                self.boxOfficeView.boxOfficeTableView.reloadData()
            case .failure(let error):
                print("error: \(error)")
            }
        }
    }
    
    func getYesterdayDate() -> String {
        if let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date()) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyyMMdd"
            let yesterdayDate = dateFormatter.string(from: yesterday)
            return yesterdayDate
        }
        return "-"
    }
    
    @objc func searchButtonClicked() {
        guard let text = boxOfficeView.searchTextField.text else { return }
    
        if text == "" {
            noticeAlert()
        } else if text.count != 8 {
            noticeAlert()
        } else if Int(text) == nil {
            noticeAlert()
        } else {
            setBoxOfficeData(date: text)
        }
        
        boxOfficeView.boxOfficeTableView.reloadData()
    }
    
    func noticeAlert() {
        let alert = UIAlertController(title: "날짜를 입력해주세요!", message: "ex. 20240101", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okButton)
        present(alert, animated: true)
        setBoxOfficeData(date: getYesterdayDate())
        boxOfficeView.searchTextField.text = ""
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
        
        let topTenData = boxOfficeList[indexPath.row]
        cell.configureCell(boxOfficeData: topTenData)
        return cell
    }
}
