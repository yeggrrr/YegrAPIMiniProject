//
//  BoxOfficeViewController.swift
//  YegrAPIMiniProject
//
//  Created by YJ on 6/6/24.
//

import UIKit
import SnapKit

class BoxOfficeViewController: UIViewController {
    let boxOfficeView = BoxOfficeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureTableView()
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
}

extension BoxOfficeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BoxOfficeTableViewCell.id, for: indexPath) as? BoxOfficeTableViewCell else { return UITableViewCell() }
        
        return cell
    }
}
