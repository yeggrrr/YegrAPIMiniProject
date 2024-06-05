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
    let numberViewSize: CGFloat = 40
    
    let inputTextField = UITextField()
    
    let InfoLabel = UILabel()
    let drawDateLabel = UILabel()
    let underLineView = UIView()
    
    let roundResultInfoStackView = UIStackView()
    let roundNumberLabel = UILabel()
    let resultInfoLabel = UILabel()
    
    let resultNumberStackView = UIStackView()
    
    let firstNumberView = UIView()
    let firstNumberLabel = UILabel()
    
    let secondNumberView = UIView()
    let secondNumberLabel = UILabel()
    
    let thirdNumberView = UIView()
    let thirdNumberLabel = UILabel()
    
    let forthNumberView = UIView()
    let forthNumberLabel = UILabel()
    
    let fifthNumberView = UIView()
    let fifthNumberLabel = UILabel()
    
    let sixthNumberView = UIView()
    let sixthNumberLabel = UILabel()
    
    let plusLabel = UILabel()
    
    let bonusNumberView = UIView()
    let bonusNumberLabel = UILabel()
    let bonusLabel = UILabel()
    
    let roundPickerView = UIPickerView()
    
    var roundArray: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurHierarchy()
        configureLayout()
        configureUI()
        configureTextField()
        configurePickerView()
        let lastRound = getLastRound(year: 2002, month: 12, day: 21)
        roundArray = Array(1...lastRound).reversed()
        setLotteryData(roundNumber: lastRound)
    }
    
    func configureTextField() {
        inputTextField.inputAccessoryView = roundPickerView
    }
    
    func configurePickerView() {
        roundPickerView.delegate = self
        roundPickerView.dataSource = self
    }
    
    func configurHierarchy() {
        view.addSubview(inputTextField)
        view.addSubview(InfoLabel)
        view.addSubview(drawDateLabel)
        view.addSubview(underLineView)
        
        view.addSubview(roundResultInfoStackView)
        roundResultInfoStackView.addArrangedSubview(roundNumberLabel)
        roundResultInfoStackView.addArrangedSubview(resultInfoLabel)
        
        view.addSubview(resultNumberStackView)
        resultNumberStackView.addArrangedSubview(firstNumberView)
        resultNumberStackView.addArrangedSubview(secondNumberView)
        resultNumberStackView.addArrangedSubview(thirdNumberView)
        resultNumberStackView.addArrangedSubview(forthNumberView)
        resultNumberStackView.addArrangedSubview(fifthNumberView)
        resultNumberStackView.addArrangedSubview(sixthNumberView)
        resultNumberStackView.addArrangedSubview(plusLabel)
        resultNumberStackView.addArrangedSubview(bonusNumberView)
        
        firstNumberView.addSubview(firstNumberLabel)
        secondNumberView.addSubview(secondNumberLabel)
        thirdNumberView.addSubview(thirdNumberLabel)
        forthNumberView.addSubview(forthNumberLabel)
        fifthNumberView.addSubview(fifthNumberLabel)
        sixthNumberView.addSubview(sixthNumberLabel)
        bonusNumberView.addSubview(bonusNumberLabel)
        
        view.addSubview(bonusLabel)
    }
    
    func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide
        // inputTextField
        inputTextField.snp.makeConstraints {
            $0.top.equalTo(safeArea).offset(20)
            $0.leading.trailing.equalTo(safeArea).inset(20)
            $0.height.equalTo(50)
        }
        
        // InfoLabel
        InfoLabel.snp.makeConstraints {
            $0.top.equalTo(inputTextField.snp.bottom).offset(25)
            $0.leading.equalTo(safeArea).offset(15)
        }
        // drawDateLabel
        drawDateLabel.snp.makeConstraints {
            $0.top.equalTo(inputTextField.snp.bottom).offset(25)
            $0.trailing.equalTo(safeArea).offset(-15)
        }
        
        //  underLineView
        underLineView.snp.makeConstraints {
            $0.top.equalTo(drawDateLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(safeArea).inset(10)
            $0.height.equalTo(1)
        }
        
        // roundResultInfoStackView
        roundResultInfoStackView.snp.makeConstraints {
            $0.top.equalTo(underLineView.snp.bottom).offset(25)
            $0.centerX.equalTo(safeArea)
            $0.height.equalTo(40)
        }
        
        // resultNumberStackView
        resultNumberStackView.snp.makeConstraints {
            $0.top.equalTo(roundResultInfoStackView.snp.bottom).offset(20)
            $0.centerX.equalTo(safeArea)
        }
        
        firstNumberView.snp.makeConstraints {
            $0.height.width.equalTo(numberViewSize)
        }
        
        secondNumberView.snp.makeConstraints {
            $0.height.width.equalTo(numberViewSize)
        }
        
        thirdNumberView.snp.makeConstraints {
            $0.height.width.equalTo(numberViewSize)
        }
        
        forthNumberView.snp.makeConstraints {
            $0.height.width.equalTo(numberViewSize)
        }
        
        fifthNumberView.snp.makeConstraints {
            $0.height.width.equalTo(numberViewSize)
        }
        
        sixthNumberView.snp.makeConstraints {
            $0.height.width.equalTo(numberViewSize)
        }
        
        bonusNumberView.snp.makeConstraints {
            $0.height.width.equalTo(numberViewSize)
        }
        
        bonusLabel.snp.makeConstraints {
            $0.top.equalTo(resultNumberStackView.snp.bottom).offset(5)
            $0.trailing.equalTo(resultNumberStackView.snp.trailing)
        }
        
        firstNumberLabel.snp.makeConstraints {
            $0.center.equalTo(firstNumberView.snp.center)
        }
        
        secondNumberLabel.snp.makeConstraints {
            $0.center.equalTo(secondNumberView.snp.center)
        }
        
        thirdNumberLabel.snp.makeConstraints {
            $0.center.equalTo(thirdNumberView.snp.center)
        }
        
        forthNumberLabel.snp.makeConstraints {
            $0.center.equalTo(forthNumberView.snp.center)
        }
        
        fifthNumberLabel.snp.makeConstraints {
            $0.center.equalTo(fifthNumberView.snp.center)
        }
     
        sixthNumberLabel.snp.makeConstraints {
            $0.center.equalTo(sixthNumberView.snp.center)
        }
        
        bonusNumberLabel.snp.makeConstraints {
            $0.center.equalTo(bonusNumberView.snp.center)
        }
    }
    
    @objc func viewTapped() {
        self.inputTextField.resignFirstResponder()
    }
    
    func configureUI() {
        // container view
        view.backgroundColor = .white
        
        let viewGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.addGestureRecognizer(viewGesture)
        
        // inputTextField
        inputTextField.layer.borderColor = UIColor.black.cgColor
        inputTextField.layer.borderWidth = 1
        inputTextField.backgroundColor = .systemGray6
        inputTextField.textAlignment = .center
        inputTextField.placeholder = "회차를 입력해주세요"
        
        // InfoLabel
        InfoLabel.text = "당첨번호 안내"
        InfoLabel.textColor = .label
        InfoLabel.textAlignment = .left
        InfoLabel.font = .systemFont(ofSize: 17)
        
        // drawDateLabel
        drawDateLabel.textColor = .darkGray
        drawDateLabel.textAlignment = .right
        drawDateLabel.font = .systemFont(ofSize: 15)
        
        //  underLineView
        underLineView.backgroundColor = .systemGray4
        
        // roundResultInfoStackView
        roundResultInfoStackView.spacing = 8
        
        // roundNumberLabel
        roundNumberLabel.textColor = .systemYellow
        roundNumberLabel.font = .boldSystemFont(ofSize: 25)
        
        resultInfoLabel.text = "당첨 결과"
        resultInfoLabel.textColor = .label
        resultInfoLabel.font = .systemFont(ofSize: 25)
        
        // resultNumberStackView
        resultNumberStackView.spacing = 5
        resultNumberStackView.alignment = .fill
        resultNumberStackView.distribution = .fillEqually
        resultNumberStackView.axis = .horizontal
        
        // 1~7 Views
        firstNumberView.backgroundColor = .systemYellow
        
        [secondNumberView, thirdNumberView].forEach {
            $0.backgroundColor = .systemCyan
        }
        [forthNumberView, fifthNumberView].forEach {
            $0.backgroundColor = .systemPink
        }
        [sixthNumberView, bonusNumberView].forEach {
            $0.backgroundColor = .lightGray
        }
        
        [firstNumberView, secondNumberView, thirdNumberView, forthNumberView, fifthNumberView, sixthNumberView, bonusNumberView].forEach {
            $0.layer.cornerRadius = numberViewSize / 2
            $0.clipsToBounds = true
        }
        
        plusLabel.text = "+"
        plusLabel.textColor = .label
        plusLabel.font = .boldSystemFont(ofSize: 18)
        plusLabel.textAlignment = .center
        
        bonusLabel.text = "보너스"
        bonusLabel.textAlignment = .right
        bonusLabel.textColor = .systemGray
        bonusLabel.font = .systemFont(ofSize: 14)
        
        [firstNumberLabel, secondNumberLabel, thirdNumberLabel, forthNumberLabel, fifthNumberLabel, sixthNumberLabel, bonusNumberLabel].forEach {
            $0.textColor = .white
            $0.textAlignment = .center
            $0.font = .boldSystemFont(ofSize: 15)
        }
        
        roundPickerView.backgroundColor = .systemGray6
    }
    
    func setLotteryData(roundNumber: Int) {
        AF.request(APIURL.lotteryURL + "\(roundNumber)").responseDecodable(of: Lottery.self) { response in
            switch response.result {
            case .success(let value):
                self.drawDateLabel.text = "\(value.drwNoDate) 추첨"
                self.firstNumberLabel.text = "\(value.drwtNo1)"
                self.secondNumberLabel.text = "\(value.drwtNo2)"
                self.thirdNumberLabel.text = "\(value.drwtNo3)"
                self.forthNumberLabel.text = "\(value.drwtNo4)"
                self.fifthNumberLabel.text = "\(value.drwtNo5)"
                self.sixthNumberLabel.text = "\(value.drwtNo6)"
                self.bonusNumberLabel.text = "\(value.bnusNo)"
                self.roundNumberLabel.text = "\(value.drwNo)회"
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
        inputTextField.text = stringRoundArray
        roundNumberLabel.text = "\(stringRoundArray)회"
        setLotteryData(roundNumber: roundArray[row])
    }
}
