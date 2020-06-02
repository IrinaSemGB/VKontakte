//
//  AddGroupTableViewController.swift
//  VKontakte
//
//  Created by Ирина Семячкина on 13.05.2020.
//  Copyright © 2020 Ирина Семячкина. All rights reserved.
//

import UIKit

protocol AddGroupDelegate: class {
    func addGroup(group: Group)
}


class AddGroupTableViewController: UITableViewController {
    
    @IBOutlet private weak var searchBar: UISearchBar?
    
    weak var delegate: AddGroupDelegate?
    private var groups: [Group] = []
    private var filteredGroups: [Group] = []

    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = .black
        
        self.addGroups()
        self.filter(query: "")
    }
    
    
    // MARK: - Add Groups
    
    private func addGroups() {
        
        let groups = [Group(name: "две таблетки", image: "pills"),
                      Group(name: "Матрица Перезагрузка", image: "reload"),
                      Group(name: "Зион", image: "zion"),
                      Group(name: "Нео и Тринити ❤️", image: "love"),
                      Group(name: "уроки единоборств", image: "combat"),
                      Group(name: "код Матрицы", image: "code"),
                      Group(name: "кто из них копия ?", image: "copies"),
                      Group(name: "цитаты из фильма", image: "quotes"),
                      Group(name: "Навуходоносер", image: "nebuchadnezzar"),
                      Group(name: "Матрица Революция", image: "revolution"),
        ]
        
        for i in groups {
            let group = Group(name: "", image: "")
            group.image = i.image
            group.name = i.name
            
            self.groups.append(group)
        }
    }

    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredGroups.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddGroupTableViewCell", for: indexPath) as! AddGroupTableViewCell

        let group = self.filteredGroups[indexPath.row]
        cell.setGroup(group: group)
        
        cell.backgroundColor = UIColor(red: 38 / 255, green: 38 / 255, blue: 38 / 255, alpha: 1)
        
        return cell
    }
    
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)

        let group = self.filteredGroups[indexPath.row]
        self.addGroup(group: group)
        
        let selectedCell = tableView.cellForRow(at: indexPath) as! AddGroupTableViewCell
        selectedCell.pickImage?.isHidden = false
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView = UIView()
        return footerView
    }
}


// MARK: - Delegate

extension AddGroupTableViewController {
    
    
    func addGroup(group: Group) {
        self.delegate?.addGroup(group: group)
    }
    
    
    private func filter(query: String) {
        self.filteredGroups.removeAll()
        
        for group in self.groups {
            
            var isInFilter = true
            
            if query.count > 0 {
                isInFilter = group.name.lowercased().contains(query.lowercased())
            }
            
            if isInFilter {
                self.filteredGroups.append(group)
            }
        }
        self.tableView.reloadData()
    }
}

extension AddGroupTableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filter(query: searchText)
    }
}
