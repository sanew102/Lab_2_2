//
//  PasswordViewController.swift
//  Lab_2_2
//
//  Created by Нурым Нагиметов on 14.04.2022.
//

import UIKit

class PasswordViewController: UIViewController {
    private let currentPasswordView = CurrentPasswordView()
    private let newPasswordView = NewPassword()
    private let repeatPassword = RepeatPasswordView()
    private let forgotPassword = ForgotPasswordView()
    private let saveView = SaveView()
    static var hideMode = true

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        hideKeyBoard()
        setupNavBar()
        // Do any additional setup after loading the view.
    }
    private func setupNavBar(){
        navigationItem.titleView = passwordNavBar()
    }
    private func setupView(){
        view.backgroundColor = .white
        view.addSubviews(currentPasswordView, newPasswordView, repeatPassword, forgotPassword, saveView)
        currentPasswordView.hideImage.image = UIImage(named: "openEye")
        newPasswordView.hideImage.image = UIImage(named: "openEye")
        setupKeyboardHiding()
    }
    
    private func setupConstraints(){
        
        currentPasswordView.snp.makeConstraints { make in
            if #available(iOS 11.0, *) {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(23)
            }
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(50)
        }
        
        newPasswordView.snp.makeConstraints { make in
            make.top.equalTo(currentPasswordView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(50)
        }
        repeatPassword.snp.makeConstraints { make in
            make.top.equalTo(newPasswordView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(50)
        }
        forgotPassword.snp.makeConstraints { make in
            make.top.equalTo(repeatPassword.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
            make.width.equalTo(164)
            make.height.equalTo(22)
        }
        saveView.snp.makeConstraints { make in
            
            if #available(iOS 11.0, *) {
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(0)
            }
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(50)
        }


    }
    private func setupKeyboardHiding() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    @objc func keyboardWillShow(sender: NSNotification){
        if let userInfo = sender.userInfo, let keyboardRectangle = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            
            saveView.snp.updateConstraints { make in
                
                if #available(iOS 11.0, *) {
                    make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-keyboardRectangle.height)
                }
                make.leading.equalToSuperview().offset(16)
                make.trailing.equalToSuperview().offset(-15)
                make.height.equalTo(50)
            }
        }
        
    }
    @objc func keyboardWillHide(notification: NSNotification){
        saveView.snp.updateConstraints { make in
            
            if #available(iOS 11.0, *) {
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-0)
            }
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(50)
        }
    }
}

extension UIViewController {
    func hideKeyBoard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
