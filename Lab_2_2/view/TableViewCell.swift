//
//  TableViewCell.swift
//  Lab_2_2
//
//  Created by Нурым Нагиметов on 13.04.2022.
//

import UIKit
fileprivate struct NameLabel {
    static let labelFont = UIFont(name: "HelveticaNeue-Medium", size: 16)
}

fileprivate struct EmailLabel {
    static let labelFont = UIFont(name: "Helvetica", size: 14)
    
}
fileprivate struct View {
    static let borderWidth : CGFloat = 1
    static let borderColor =  CGColor(red: 0, green: 0, blue: 0, alpha: 1)
    static let cornerRadius : CGFloat = 37
    static let backgroundColor = UIColor.white
    
}
fileprivate struct ProfileImageView {
 
    static let cornerRadius : CGFloat = 34
}

fileprivate struct ButtonImageView {
 
    static let cornerRadius : CGFloat = 14
    static let buttonColor = UIColor(red: 45/255, green: 96/255, blue: 226/255, alpha: 1)
    static let image = UIImage(named: "Image")
}
fileprivate struct Border {
    static let borderColor = UIColor(red: 187/255, green: 187/255, blue: 187/255, alpha: 1)
}

class TableViewCell: UITableViewCell {
    let border : UIView = {
        let border = UIView()
        border.backgroundColor = Border.borderColor
        return border
    }()
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.font = NameLabel.labelFont
        return label
    }()
    
    let emailLabel : UILabel = {
        let label = UILabel()
        label.font = EmailLabel.labelFont
        return label
    }()
    
    let view : UIView = {
        let view = UIView()
        view.layer.borderWidth = View.borderWidth
        view.layer.borderColor = View.borderColor
        view.layer.cornerRadius = View.cornerRadius
        view.backgroundColor = View.backgroundColor
        return view
        
    }()
    
    let profileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 33
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let buttonView : UIView = {
        let buttonView = UIView()
        buttonView.backgroundColor = ButtonImageView.buttonColor
        buttonView.layer.cornerRadius = ButtonImageView.cornerRadius
        return buttonView
    }()
    
    let buttonImageView : UIImageView = {
        let buttonImageView = UIImageView()
        buttonImageView.image = ButtonImageView.image
        buttonImageView.contentMode = .scaleAspectFit
        return buttonImageView
        
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "TableViewCell")
        setupView()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func set(person: PersonInformation){
        profileImageView.image = person.image
        nameLabel.text = person.name
        emailLabel.text = person.email
    }
    private func setupView() {
        contentView.addSubviews(view, nameLabel, emailLabel, border, buttonView, buttonImageView)
        view.addSubviews(profileImageView)
        selectionStyle = .none

    }
    
    private func setupConstraints() {
        view.snp.makeConstraints { make in
            make.width.height.equalTo(74)
            make.top.equalToSuperview().offset(15)
            make.centerX.equalToSuperview()
        }
        profileImageView.snp.makeConstraints { make in
            make.width.height.equalTo(67)
            make.center.equalToSuperview()
        }
        buttonView.snp.makeConstraints { make in
            make.width.height.equalTo(28)
            make.bottom.equalTo(view.snp.bottom)
            make.trailing.equalTo(view.snp.trailing)
        }
        buttonImageView.snp.makeConstraints { make in
            make.width.equalTo(15)
            make.height.equalTo(13)
            make.centerY.equalTo(buttonView)
            make.centerX.equalTo(buttonView)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
        }
        border.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(1)
            make.bottom.equalToSuperview()
        }

    }
}
