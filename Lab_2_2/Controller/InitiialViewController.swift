//
//  InitiialViewController.swift
//  Lab_2_2
//
//  Created by Нурым Нагиметов on 15.04.2022.
//

import UIKit

class InitiialViewController: UIViewController {
    let button = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        view.addSubview(button)
        button.backgroundColor = .red
        button.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.width.height.equalTo(100)
        }
        button.addTarget(self, action: #selector(buttonTapper), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    @objc func buttonTapper() {
        let vc = SettingsTableViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
