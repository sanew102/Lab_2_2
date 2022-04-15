//
//  NewPassword.swift
//  Lab_2_2
//
//  Created by Нурым Нагиметов on 14.04.2022.
//

import UIKit
struct Statics {
    
    static let borderColor : CGColor =  CGColor(red: 44/255, green: 106/255, blue: 255/255, alpha: 1)
    static let title = "Новый пароль"
    static let titleFont = UIFont(name: "HelveticaNeue-Medium", size: 12)
    static let titleColor = UIColor(red: 11/255, green: 47/255, blue: 138/255, alpha: 1)
    static let textFieldFont = UIFont(name: "Helvetica", size: 16)
    static let cornerRadius : CGFloat = 10
    
}
class NewPassword: UIView {

    private let title : UILabel = {
        let label = UILabel()
        label.font = Statics.titleFont
        label.text = Statics.title
        label.textColor = Statics.titleColor
        return label
    }()
    private let textField : UITextField = {
        let textField = UITextField()
        textField.font = Statics.textFieldFont
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
        layer.borderColor = Statics.borderColor
        layer.cornerRadius = Statics.cornerRadius
        addSubviews(title,textField, hideImage)
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
