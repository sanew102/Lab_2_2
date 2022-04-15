//
//  CustomNavBarExtention.swift
//  Lab_2_2
//
//  Created by Нурым Нагиметов on 15.04.2022.
//

import UIKit

extension UIViewController {

    func createCustomView() -> UIView {
        
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 500, height: 18)
        let title : UILabel = {
            let title = UILabel()
            title.text = "Настройки"
            title.frame = CGRect(x: 25, y: 0, width: view.frame.width, height: view.frame.height)
            title.textColor = UIColor(red: 55/255, green: 55/255, blue: 55/255, alpha: 1)
            title.font = UIFont(name: "Helvetica", size: 16)
            return title
        }()
        view.addSubview(title)
        return view
    }
    func passwordNavBar() -> UIView {
        
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 370, height: 18)
        let title : UILabel = {
            let title = UILabel()
            title.text = "Изменить пароль"
            title.frame = CGRect(x: 25, y: 0, width: view.frame.width, height: view.frame.height)
            title.textColor = UIColor(red: 55/255, green: 55/255, blue: 55/255, alpha: 1)
            title.font = UIFont(name: "Helvetica", size: 16)
            return title
        }()
        view.addSubview(title)
        return view
    }
    
    
}
