//
//  SettingsTableViewController.swift
//  Lab_2_2
//
//  Created by Нурым Нагиметов on 13.04.2022.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    var person = PersonInformation(name: "Nurym Nagymetov", email: "sanew102@gmail.com", image: UIImage(named: "Photo")!, password: "malikil", isPushNotificated: true, isFaceIdOn: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBarSetup()
        tableViewSetup()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.estimatedRowHeight = 150
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
    }
    // MARK: - Table view data source
    
    private func navBarSetup(){
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.titleView = createCustomView()
        
      



        
        
    }

    
    // MARK: - Table view data source
    
    private func tableViewSetup(){
        tableView.register(InfoTableViewCell.self, forCellReuseIdentifier: "InfoTableViewCell")
        tableView.register(PushTableViewCell.self, forCellReuseIdentifier: "PushTableViewCell")
        tableView.register(ChangePasswordTableViewCell.self, forCellReuseIdentifier: "ChangePasswordTableViewCell")
        tableView.register(KodDostupaTableViewCell.self, forCellReuseIdentifier: "KodDostupaTableViewCell")
        tableView.register(FaceIdTableViewCell.self, forCellReuseIdentifier: "FaceIdTableViewCell")
        tableView.register(PhoneNumberTableViewCell.self, forCellReuseIdentifier: "PhoneNumberTableViewCell")
        tableView.register(ExitTableViewCell.self, forCellReuseIdentifier: "ExitTableViewCell")
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
            cell.set(person: person)
            let gesture = UITapGestureRecognizer(target: self, action: #selector(changeProfileImage))
            cell.buttonView.addGestureRecognizer(gesture)
            return cell
        }
        switch indexPath.row {
        case 1 : return tableView.dequeueReusableCell(withIdentifier: "PushTableViewCell", for: indexPath)
        case 2 : return tableView.dequeueReusableCell(withIdentifier: "ChangePasswordTableViewCell", for: indexPath)
        case 3 : return tableView.dequeueReusableCell(withIdentifier: "KodDostupaTableViewCell", for: indexPath)
        case 4 : return tableView.dequeueReusableCell(withIdentifier: "FaceIdTableViewCell", for: indexPath)
        case 5 : return tableView.dequeueReusableCell(withIdentifier: "PhoneNumberTableViewCell", for: indexPath)
        case 6 : return tableView.dequeueReusableCell(withIdentifier: "ExitTableViewCell", for: indexPath)
        case 7 : return cell
        default:
            return cell
        }

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PasswordViewController()
        if indexPath.row == 2 {
        navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    @objc func changeProfileImage() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }

}

extension SettingsTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage{
            person.image = image
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: IndexPath(row: 0, section: 0)) as! TableViewCell
            cell.nameLabel.text = "ad"
            cell.profileImageView.image = image
            tableView.reloadData()
        }
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
