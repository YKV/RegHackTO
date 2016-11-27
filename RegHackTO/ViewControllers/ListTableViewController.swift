//
//  ListTableViewController.swift
//  RegHackTO
//
//  Created by Yevhen Kim on 2016-11-26.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

import UIKit
import  Foundation

class ListTableViewController: UIViewController, UITableViewDelegate{
    
    var shareList = ["First Name", "Last Name", "Driver License", "Passport", "Date Of Birth", "Address", "Reputation"]
    
    let selected: NSMutableArray = []
    let stylesheet: Styles = Styles.sharedInstance
    var didSend: Bool?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Share"
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        
        if self.selected.count > 0 {
            let alertVC = UIAlertController(title: "Success", message: "You have sent your identification successfuly", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertVC.addAction(okAction)
            
            DispatchQueue.main.async {
                self.present(alertVC, animated: true, completion: nil)
            }
            self.didSend = true
            AppDelegate.didSend = self.didSend

        }
        else {
            let alertVC = UIAlertController(title: "Error", message: "Please select an item", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertVC.addAction(okAction)
            DispatchQueue.main.async {
                self.present(alertVC, animated: true, completion: nil)
            }
            self.didSend = false
            AppDelegate.didSend = self.didSend
        }
    }
}

//MARK: - UITableViewDataSource
extension ListTableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shareList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ListCell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListCell
        cell.listCellLabel.text = shareList[indexPath.item]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Select what you want to send"
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        var title = UILabel()
        title.font = stylesheet.titleFont
        title.textColor = stylesheet.backgroundColor
        title.textAlignment = .center
        
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font=title.font
        header.textLabel?.textColor=title.textColor
        header.textLabel?.textAlignment = title.textAlignment
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = tableView.cellForRow(at: indexPath)
        
        if (selectedCell?.accessoryType == UITableViewCellAccessoryType.checkmark) {
            selectedCell!.accessoryType = UITableViewCellAccessoryType.none
            self.selected.remove(selectedCell!)
        }
        else {
            selectedCell!.accessoryType = UITableViewCellAccessoryType.checkmark
            self.selected.add(selectedCell!)
        }
    }
}
