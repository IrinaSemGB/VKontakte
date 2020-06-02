//
//  GroupsTableViewController.swift
//  VKontakte
//
//  Created by Ирина Семячкина on 13.05.2020.
//  Copyright © 2020 Ирина Семячкина. All rights reserved.
//

import UIKit

class GroupsTableViewController: UITableViewController {
    
    @IBOutlet private weak var headerView: UIView?
    @IBOutlet private weak var headerImage: UIImageView? {
        didSet {
            self.headerImage?.image = UIImage(named: "follow")
            self.headerImage?.contentMode = .scaleToFill
        }
    }
    
    @IBOutlet private weak var gradientView: GradientView? {
        didSet {
            gradientView?.backgroundColor = .clear
            gradientView?.startColor = .clear
            gradientView?.endColor = UIColor.white
            gradientView?.startLocation = 0
            gradientView?.endLocation = 1
            gradientView?.startPoint = CGPoint(x: 0, y: 1)
            gradientView?.endPoint = CGPoint(x: 0, y: 0)
        }
    }
    
    var groups: [Group] = []
    
        
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = .black
    }

    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.groups.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupTableViewCell", for: indexPath) as! GroupTableViewCell

        let group = self.groups[indexPath.row]
        cell.setGroup(group: group)
        
        cell.backgroundColor = .black

        return cell
    }


    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            self.groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }    
    }


    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView = UIView()
        return footerView
    }


 
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addGroup", let dest = segue.destination as? AddGroupTableViewController {
            dest.delegate = self
        }
    }
}

    // MARK: - Extention

extension GroupsTableViewController: AddGroupDelegate {
    
    func addGroup(group: Group) {
        
        var contains = false
        
        for groupInVC in self.groups {
            if group.name == groupInVC.name {
                contains = true
                break
            }
        }
        
        if false == contains {
            self.groups.append(group)
            self.tableView.reloadData()
        }
    }
}
