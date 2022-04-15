//
//  FaceIdTableViewCell.swift
//  Lab_2_2
//
//  Created by Нурым Нагиметов on 13.04.2022.
//

import UIKit

fileprivate struct Constants {
    static let pushNotification = "Вход с Face/Touch ID"
    static let pushNotificationTitleFont = UIFont(name: "Helvetica", size: 16)
    static let pushpushNotificationColor = UIColor(red: 83/255, green: 83/255, blue: 83/255, alpha: 1)
}

fileprivate struct Border {
    static let borderColor = UIColor(red: 187/255, green: 187/255, blue: 187/255, alpha: 1)
}

class FaceIdTableViewCell: UITableViewCell {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.pushNotification
        label.font = Constants.pushNotificationTitleFont
        label.textColor = Constants.pushpushNotificationColor
        return label
    }()
    
    let pushSwitch : UISwitch = {
        let pushSwitch = UISwitch()
        pushSwitch.onTintColor = UIColor(red: 45/255, green: 96/255, blue: 226/255, alpha: 1)
        return pushSwitch
    }()
    let border : UIView = {
        let border = UIView()
        border.backgroundColor = Border.borderColor
        return border
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "PushTableViewCell")
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    
    private func setupViews() {
        contentView.addSubviews(titleLabel, pushSwitch, border)
        selectionStyle = .none
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(19)
            make.leading.equalToSuperview().offset(16)
        }
        pushSwitch.snp.makeConstraints { make in
            make.width.equalTo(44)
            make.height.equalTo(28)
            make.top.equalToSuperview().offset(14)
            make.leading.equalTo(titleLabel.snp.trailing).offset(5)
            make.trailing.equalToSuperview().offset(-17)
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
