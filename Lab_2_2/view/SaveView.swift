//
//  SaveView.swift
//  Lab_2_2
//
//  Created by Нурым Нагиметов on 15.04.2022.
//

import UIKit
struct SaveViewStatics {
    
    static let borderColor = CGColor(red: 166/255, green: 166/255, blue: 166/255, alpha: 1)
    static let title = " Сохранить"
    static let titleColor = UIColor(red: 166/255, green: 166/255, blue: 166/255, alpha: 1)
    static let textFieldFont = UIFont(name: "HelveticaNeue-Medium", size: 20)
    static let cornerRadius : CGFloat = 10
    
}
class SaveView: UIView {

    private let label : UILabel = {
        let label = UILabel()
        label.text = SaveViewStatics.title
        label.textColor = SaveViewStatics.titleColor
        label.textAlignment = .center
        return label
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
        layer.borderColor = SaveViewStatics.borderColor
        layer.cornerRadius = SaveViewStatics.cornerRadius
        addSubviews(label)
    }
    
    private func setupContraints() {

        
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.bottom.equalToSuperview().offset(-14)
            make.leading.equalToSuperview().offset(48)
            make.trailing.equalToSuperview().offset(-47)
            
        }
    }
}
