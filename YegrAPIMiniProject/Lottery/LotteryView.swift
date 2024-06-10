//
//  LotteryView.swift
//  YegrAPIMiniProject
//
//  Created by YJ on 6/6/24.
//

import UIKit

class LotteryView: UIView {
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configurHierarchy()
        configureLayout()
        configureUI()
        configureTextField()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configurHierarchy()
        configureLayout()
        configureUI()
        configureTextField()
    }
    
    func configureTextField() {
        inputTextField.inputAccessoryView = roundPickerView
    }
    
    func configurHierarchy() {
        addSubview(inputTextField)
        addSubview(InfoLabel)
        addSubview(drawDateLabel)
        addSubview(underLineView)
        
        addSubview(roundResultInfoStackView)
        roundResultInfoStackView.addArrangedSubview(roundNumberLabel)
        roundResultInfoStackView.addArrangedSubview(resultInfoLabel)
        
        addSubview(resultNumberStackView)
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
        
        addSubview(bonusLabel)
    }
    
    func configureLayout() {
        let safeArea = safeAreaLayoutGuide
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
    
    func configureUI() {
        let viewGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        addGestureRecognizer(viewGesture)
        
        // inputTextField
        inputTextField.layer.borderColor = UIColor.black.cgColor
        inputTextField.layer.borderWidth = 1
        inputTextField.backgroundColor = .systemGray6
        inputTextField.textAlignment = .center
        inputTextField.placeholder = "회차를 입력해주세요"
        
        // InfoLabel
        InfoLabel.setUI(labelTextColor: .label, textFontSize: .systemFont(ofSize: 17))
        InfoLabel.textColor = .label
        InfoLabel.textAlignment = .left
        
        // drawDateLabel
        drawDateLabel.setUI(labelTextColor: .darkGray, textFontSize: .systemFont(ofSize: 15))
        drawDateLabel.textAlignment = .right
        
        //  underLineView
        underLineView.backgroundColor = .systemGray4
        
        // roundResultInfoStackView
        roundResultInfoStackView.spacing = 8
        
        // roundNumberLabel
        roundNumberLabel.setUI(labelTextColor: .systemOrange, textFontSize: .boldSystemFont(ofSize: 25))
        
        resultInfoLabel.setUI(labelTextColor: .label, textFontSize: .systemFont(ofSize: 25))
        resultInfoLabel.text = "당첨 결과"
        
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
        
        plusLabel.setUI(labelTextColor: .label, textFontSize: .boldSystemFont(ofSize: 18))
        plusLabel.text = "+"
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
    
    @objc func viewTapped() {
        self.inputTextField.resignFirstResponder()
    }
}
