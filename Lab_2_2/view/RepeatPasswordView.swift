//
//  RepeatPasswordView.swift
//  Lab_2_2
//
//  Created by Нурым Нагиметов on 15.04.2022.
//

import UIKit
struct RepeatPasswordStatics {
    
    static let borderColor = CGColor(red: 205/255, green: 218/255, blue: 249/255, alpha: 1)
    static let title = " Повторить новый пароль"
    static let titleColor = UIColor(red: 83/255, green: 83/255, blue: 1/255, alpha: 1)
    static let textFieldFont = UIFont(name: "Helvetica", size: 16)
    static let cornerRadius : CGFloat = 10
    
}
class RepeatPasswordView: UIView {

    
    private let textField : UITextField = {
        let textField = UITextField()
        textField.font = RepeatPasswordStatics.textFieldFont
        textField.textColor = RepeatPasswordStatics.titleColor
        textField.text = RepeatPasswordStatics.title
        return textField
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
        layer.borderColor = RepeatPasswordStatics.borderColor
        layer.cornerRadius = RepeatPasswordStatics.cornerRadius
        addSubviews(textField)
    }
    
    private func setupContraints() {

        
        textField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            
        }
    }

}
