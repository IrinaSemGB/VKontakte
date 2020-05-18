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
    var groups: [Group] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addGroups()
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
        return self.groups.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddGroupTableViewCell", for: indexPath) as! AddGroupTableViewCell

        let group = self.groups[indexPath.row]
        cell.setGroup(group: group)
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let group = self.groups[indexPath.row]
        self.delegate?.addGroup(group: group)
    }
}
