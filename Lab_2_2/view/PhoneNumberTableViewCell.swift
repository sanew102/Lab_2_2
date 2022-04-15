//
//  PhoneNumberTableViewCell.swift
//  Lab_2_2
//
//  Created by Нурым Нагиметов on 13.04.2022.
//

import UIKit

fileprivate struct AccessCode {
    static let passwordLabelText = "Изменить номер телефонв"
    static let passwordLabelFont = UIFont(name: "Helvetica", size: 16)
    static let passwordTextColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1)
}

fileprivate struct Border {
    static let borderColor = UIColor(red: 187/255, green: 187/255, blue: 187/255, alpha: 1)
}


class PhoneNumberTableViewCell: UITableViewCell {

    let titleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = AccessCode.passwordLabelText
        titleLabel.font = AccessCode.passwordLabelFont
        titleLabel.textColor = AccessCode.passwordTextColor
        return titleLabel
    }()
    let border : UIView = {
        let border = UIView()
        border.backgroundColor = Border.borderColor
        return border
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "ChangePasswordTableViewCell")
        setupViews()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        contentView.addSubviews(titleLabel)
        self.addSubview(border)
        self.accessoryType = .disclosureIndicator
        self.selectionStyle = .none
    }
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(18)
            make.top.bottom.equalToSuperview().inset(19)
        }
        
        border.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(19)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(1)
        }
        
        
    }
}
