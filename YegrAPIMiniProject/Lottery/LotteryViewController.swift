//
//  LotteryViewController.swift
//  YegrAPIMiniProject
//
//  Created by YJ on 6/5/24.
//

import UIKit
import Alamofire
import SnapKit

class LotteryViewController: UIViewController {
    let lotteryView = LotteryView()
    
    var roundArray: [Int] = []
    var lottery: Lottery?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configurePickerView()
        setInitData()
    }
    
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(lotteryView)
        lotteryView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configurePickerView() {
        lotteryView.roundPickerView.delegate = self
        lotteryView.roundPickerView.dataSource = self
    }
    
    func setInitData() {
        let lastRound = getLastRound(year: 2002, month: 12, day: 21)
        roundArray = Array(1...lastRound).reversed()
        setLotteryData(roundNumber: lastRound)
    }
    
    func setLotteryData(roundNumber: Int) {
        AF.request(APIURL.lotteryURL + "\(roundNumber)").responseDecodable(of: Lottery.self) { response in
            switch response.result {
            case .success(let value):
                self.lottery = value
                self.reloadLottery()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func reloadLottery() {
        if let lottery = lottery {
            lotteryView.drawDateLabel.text = "\(lottery.drwNoDate) 추첨"
            lotteryView.firstNumberLabel.text = "\(lottery.drwtNo1)"
            lotteryView.secondNumberLabel.text = "\(lottery.drwtNo2)"
            lotteryView.thirdNumberLabel.text = "\(lottery.drwtNo3)"
            lotteryView.forthNumberLabel.text = "\(lottery.drwtNo4)"
            lotteryView.fifthNumberLabel.text = "\(lottery.drwtNo5)"
            lotteryView.sixthNumberLabel.text = "\(lottery.drwtNo6)"
            lotteryView.bonusNumberLabel.text = "\(lottery.bnusNo)"
            lotteryView.roundNumberLabel.text = "\(lottery.drwNo)회"
        }
    }
    
    func getLastRound(year: Int, month: Int, day: Int) -> Int {
        let dateComponents = DateComponents(year: year, month: month, day: day)
        if let startDate = Calendar.current.date(from: dateComponents) {
            let diffBetweenTwoDates = Calendar.current.dateComponents([.day], from: startDate, to: Date())

            if let d = diffBetweenTwoDates.day {
                return (d / 7) + 1
            }
        }
        
        return 0
    }
}

extension LotteryViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return roundArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(roundArray[row])회"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let round = roundArray[row]
        lotteryView.inputTextField.text = "\(round)회"
        lotteryView.roundNumberLabel.text = "\(round)회"
        setLotteryData(roundNumber: round)
    }
}
