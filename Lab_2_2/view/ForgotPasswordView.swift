//
//  ForgotPasswordView.swift
//  Lab_2_2
//
//  Created by Нурым Нагиметов on 15.04.2022.
//

import UIKit
struct LabelStatics {
    static let font = UIFont(name: "Helvetica", size: 14)
    static let color = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1)
    static let labelText = "Забыли пароль ?"
    
}
class ForgotPasswordView: UIView {
    let label : UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString.init(string: LabelStatics.labelText)
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: NSRange.init(location: 0, length: attributedString.length))
        label.attributedText = attributedString
        label.font = LabelStatics.font
        label.textColor = LabelStatics.color

        return label
        
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstaints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView(){
        addSubview(label)
    }
    private func setupConstaints() {
        label.snp.makeConstraints({ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        })
    }
    
    

    
    

}

