//
//  GroupsTableViewController.swift
//  VKontakte
//
//  Created by Ирина Семячкина on 13.05.2020.
//  Copyright © 2020 Ирина Семячкина. All rights reserved.
//

import UIKit

class GroupsTableViewController: UITableViewController {
    
    @IBOutlet weak var headerView: UIView?
    
    @IBOutlet weak var headerImage: UIImageView? {
        didSet {
            self.headerImage?.image = UIImage(named: "follow")
            self.headerImage?.contentMode = .scaleToFill
        }
    }
    
    @IBOutlet weak var gradientView: GradientView? {
        didSet {
            gradientView?.backgroundColor = .clear
        }
    }
    

    var groups: [Group] = []
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.groups.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupTableViewCell", for: indexPath) as! GroupTableViewCell

        let group = self.groups[indexPath.row]
        cell.setGroup(group: group)

        return cell
    }


    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            self.groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }    
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

 
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
