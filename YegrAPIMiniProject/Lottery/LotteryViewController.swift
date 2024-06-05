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
                self.lotteryView.drawDateLabel.text = "\(value.drwNoDate) 추첨"
                self.lotteryView.firstNumberLabel.text = "\(value.drwtNo1)"
                self.lotteryView.secondNumberLabel.text = "\(value.drwtNo2)"
                self.lotteryView.thirdNumberLabel.text = "\(value.drwtNo3)"
                self.lotteryView.forthNumberLabel.text = "\(value.drwtNo4)"
                self.lotteryView.fifthNumberLabel.text = "\(value.drwtNo5)"
                self.lotteryView.sixthNumberLabel.text = "\(value.drwtNo6)"
                self.lotteryView.bonusNumberLabel.text = "\(value.bnusNo)"
                self.lotteryView.roundNumberLabel.text = "\(value.drwNo)회"
            case .failure(let error):
                print(error)
            }
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
        let stringRoundArray = String(roundArray[row])
        return "\(stringRoundArray)회"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let stringRoundArray = String(roundArray[row])
        lotteryView.inputTextField.text = stringRoundArray
        lotteryView.roundNumberLabel.text = "\(stringRoundArray)회"
        setLotteryData(roundNumber: roundArray[row])
    }
}
