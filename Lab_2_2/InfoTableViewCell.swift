//
//  InfoTableViewCell.swift
//  Lab_2_2
//
//  Created by Нурым Нагиметов on 13.04.2022.
//

import UIKit
import SnapKit
class InfoTableViewCell: UITableViewCell {
    let view = UIView()
    let profileImage = UIImageView()
    let nameLabel = UILabel()
    let emailLabel = UILabel()
    let border = UIView()
    let blueCirlce = UIView()
    let photoImage = UIImageView()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "InfoTableViewCell")
        
        addSubview(nameLabel)
        addSubview(emailLabel)
        addSubview(border)
        addSubview(view)
        
        view.addSubview(profileImage)
        view.addSubview(blueCirlce)
        blueCirlce.addSubview(photoImage)
        configureImageView()
        configureNameLabel()
        configureEmailLabel()
        configureBorderView()
        setBorderVIewConstraints()
        setImageViewConstaints()
        setNameLabel()
        setMailLabel()
        setBluerCircle()
        
        self.selectionStyle = .none
    }
    private func setBluerCircle(){
        blueCirlce.layer.masksToBounds = false
        blueCirlce.clipsToBounds = true
        blueCirlce.layer.cornerRadius = 14
        blueCirlce.backgroundColor = UIColor(red: 45/255, green: 96/255, blue: 226/255, alpha: 1)
        blueCirlce.snp.makeConstraints { make in
            make.width.height.equalTo(28)
            make.trailing.bottom.equalToSuperview().inset(0)
        }
        photoImage.image = UIImage(named: "Image-2")
        photoImage.snp.makeConstraints { make in
            make.width.equalTo(14)
            make.height.equalTo(12)
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    func set(person: PersonInformation){
        profileImage.image = person.image
        nameLabel.text = person.name
        emailLabel.text = person.email
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configureBorderView() {
        
        border.backgroundColor = UIColor(red: 187/255, green: 187/255, blue: 187/255, alpha: 1)
    }
    private func configureImageView() {
        
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 37
        view.backgroundColor = .white
        profileImage.layer.masksToBounds = false
        profileImage.clipsToBounds = true
        profileImage.layer.cornerRadius = 33
        profileImage.contentMode = .scaleToFill

        
    }
    private func configureNameLabel() {
        nameLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 16)
        
    }
    private func configureEmailLabel() {
        emailLabel.font = UIFont(name: "Helvetica", size: 14)
        emailLabel.textColor = UIColor(red: 95/255, green: 95/255, blue: 95/255, alpha: 1)
        
    }
    private func setImageViewConstaints(){
        view.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(16)
            make.width.height.equalTo(74)
        }
        
    }
    private func setNameLabel() {
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.bottom).offset(16)
            make.height.equalTo(18)
            make.centerX.equalToSuperview()
            
        }
        
        profileImage.snp.makeConstraints { make in
            make.width.height.equalTo(67)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    private func setMailLabel() {
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
            make.height.equalTo(16)
            
        }
    }
    private func setBorderVIewConstraints(){
        border.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
            make.top.equalTo(emailLabel.snp.bottom).offset(20)
            make.height.equalTo(1)
            
            
        }
    }
    
    

}
