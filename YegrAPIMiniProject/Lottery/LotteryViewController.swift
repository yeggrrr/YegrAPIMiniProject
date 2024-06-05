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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurHierarchy()
        configureLayout()
        configureUI()
        configurePickerView()
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
        view.addSubview(roundPickerView)
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
        
        roundPickerView.snp.makeConstraints {
            $0.bottom.equalTo(safeArea).offset(-20)
            $0.centerX.equalTo(safeArea)
            $0.height.equalTo(150)
        }
    }
    
    func configureUI() {
        // container view
        view.backgroundColor = .white
        
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
        drawDateLabel.text = "0000-00-00 추첨"
        drawDateLabel.textColor = .darkGray
        drawDateLabel.textAlignment = .right
        drawDateLabel.font = .systemFont(ofSize: 15)
        
        //  underLineView
        underLineView.backgroundColor = .systemGray4
        
        // roundResultInfoStackView
        roundResultInfoStackView.spacing = 8
        
        // roundNumberLabel +
        roundNumberLabel.text = "000회"
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
            $0.text = "8"
            $0.textAlignment = .center
            $0.font = .boldSystemFont(ofSize: 15)
        }
        
        roundPickerView.backgroundColor = .systemGray6
    }
}

extension LotteryViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        10
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("?")
    }
}
