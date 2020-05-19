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
    
    weak var delegate: AddGroupDelegate?
    private var groups: [Group] = []
    var filteredGroups: [Group] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addGroups()
        self.filter(query: "")
    }
    
    // MARK: - Add Groups
    
    func addGroups() {
        
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
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let group = self.filteredGroups[indexPath.row]
        self.addGroup(group: group)
    }
}


// MARK: - Delegate

extension AddGroupTableViewController {
    
    
    func addGroup(group: Group) {
        self.delegate?.addGroup(group: group)
    }
    
    
    func filter(query: String) {
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
        print("\(searchText)")
        self.filter(query: searchText)
    }
}
