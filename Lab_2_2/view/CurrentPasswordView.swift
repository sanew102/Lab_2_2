//
//  CurrentPasswordView.swift
//  Lab_2_2
//
//  Created by Нурым Нагиметов on 14.04.2022.
//

import UIKit
struct CurrentPasswordTextField {
    
    static let borderColor : CGColor =  CGColor(red: 205/255, green: 218/255, blue: 249/255, alpha: 1)
    static let title = "Текущий пароль"
    static let titleFont = UIFont(name: "Helvetica", size: 12)
    static let titleColor = UIColor(red: 103/255, green: 103/255, blue: 103/255, alpha: 1)
    static let textFieldFont = UIFont(name: "Helvetica", size: 16)
    static let cornerRadius : CGFloat = 10
    
}
class CurrentPasswordView: UIView {
    
    private let title : UILabel = {
        let title = UILabel()
        title.font = CurrentPasswordTextField.titleFont
        title.text = CurrentPasswordTextField.title
        title.textColor = CurrentPasswordTextField.titleColor
        return title
    }()
    
    private let textField : UITextField = {
        let textField = UITextField()
        textField.font = CurrentPasswordTextField.textFieldFont
        return textField
    }()
    
    let hideImage : UIImageView = {
        let closeEye = UIImageView()
        closeEye.contentMode = .scaleAspectFit
        return closeEye
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupContraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        layer.borderWidth = 1
        layer.borderColor = CurrentPasswordTextField.borderColor
        layer.cornerRadius = CurrentPasswordTextField.cornerRadius
        addSubviews(title, textField, hideImage)
    }
    private func setupContraints() {
        title.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(8)
        }
        
        textField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(title.snp.bottom).offset(3)
            make.trailing.equalToSuperview().offset(-130)
        }
        hideImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.width.height.equalTo(20)
        }
        
    }
}
