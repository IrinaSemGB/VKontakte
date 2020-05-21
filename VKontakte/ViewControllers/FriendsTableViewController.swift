//
//  FriendsTableViewController.swift
//  VKontakte
//
//  Created by Ирина Семячкина on 13.05.2020.
//  Copyright © 2020 Ирина Семячкина. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    var friends: [Friend] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addFriends()
    }
    
    
    // MARK: - Add Friends
    
    func addFriends() {
        
        let neoPhotos: [Photo] = [Photo(name: "neo_1"), Photo(name: "neo_2"), Photo(name: "neo_3"), Photo(name: "neo_4"), Photo(name: "neo_5"), Photo(name: "neo_6"), Photo(name: "neo_7"), Photo(name: "neo_8"), Photo(name: "neo_9"), Photo(name: "neo_10")]
        
        let trinityPhotos: [Photo] = [Photo(name: "trinity_1"), Photo(name: "trinity_2"), Photo(name: "trinity_3"), Photo(name: "trinity_4"), Photo(name: "trinity_5"), Photo(name: "trinity_6"), Photo(name: "trinity_7"), Photo(name: "trinity_8"), Photo(name: "trinity_9"), Photo(name: "trinity_10")]
        
        let morpheusPhotos: [Photo] = [Photo(name: "morpheus_1"), Photo(name: "morpheus_2"), Photo(name: "morpheus_3"), Photo(name: "morpheus_4"), Photo(name: "morpheus_5"), Photo(name: "morpheus_6"), Photo(name: "morpheus_7"), Photo(name: "morpheus_8"), Photo(name: "morpheus_9"), Photo(name: "morpheus_10")]
        
        let sypherPhotos: [Photo] = [Photo(name: "cypher_1"), Photo(name: "cypher_2"), Photo(name: "cypher_3"), Photo(name: "cypher_4"), Photo(name: "cypher_5"), Photo(name: "cypher_6"), Photo(name: "cypher_7"), Photo(name: "cypher_8"), Photo(name: "cypher_9"), Photo(name: "cypher_10")]
        
        let oraclePhotos: [Photo] = [Photo(name: "oracle_1"), Photo(name: "oracle_2"), Photo(name: "oracle_3"), Photo(name: "oracle_4"), Photo(name: "oracle_5"), Photo(name: "oracle_6"), Photo(name: "oracle_7"), Photo(name: "oracle_8"), Photo(name: "oracle_9"), Photo(name: "oracle_10")]
        
        let smithPhotos: [Photo] = [Photo(name: "smith_1"), Photo(name: "smith_2"), Photo(name: "smith_3"), Photo(name: "smith_4"), Photo(name: "smith_5"), Photo(name: "smith_6"), Photo(name: "smith_7"), Photo(name: "smith_8"), Photo(name: "smith_9"), Photo(name: "smith_10")]
        
        let twinsPhotos: [Photo] = [Photo(name: "twins_1"), Photo(name: "twins_2"), Photo(name: "twins_3"), Photo(name: "twins_4"), Photo(name: "twins_5"), Photo(name: "twins_6"), Photo(name: "twins_7"), Photo(name: "twins_8"), Photo(name: "twins_9"), Photo(name: "twins_10")]
        
        let niobePhotos: [Photo] = [Photo(name: "niobe_1"), Photo(name: "niobe_2"), Photo(name: "niobe_3"), Photo(name: "niobe_4"), Photo(name: "niobe_5"), Photo(name: "niobe_6"), Photo(name: "niobe_7"), Photo(name: "niobe_8"), Photo(name: "niobe_9"), Photo(name: "niobe_10")]
        
        let seraphPhoto: [Photo] = [Photo(name: "seraph_1"), Photo(name: "seraph_2"), Photo(name: "seraph_3"), Photo(name: "seraph_4"), Photo(name: "seraph_5"), Photo(name: "seraph_6"), Photo(name: "seraph_7"), Photo(name: "seraph_8"), Photo(name: "seraph_9"), Photo(name: "seraph_10")]
        
        let merovingianPhoto: [Photo] = [Photo(name: "merovingian_1"), Photo(name: "merovingian_2"), Photo(name: "merovingian_3"), Photo(name: "merovingian_4"), Photo(name: "merovingian_5"), Photo(name: "merovingian_6"), Photo(name: "merovingian_7"), Photo(name: "merovingian_8"), Photo(name: "merovingian_9"), Photo(name: "merovingian_10")]
        
        let friends = [Friend(name: "Нео", image: "Neo", photos: neoPhotos),
                       Friend(name: "Тринити", image: "Trinity", photos: trinityPhotos),
                       Friend(name: "Морфеус", image: "Morpheus", photos: morpheusPhotos),
                       Friend(name: "Сайфер", image: "Cypher", photos: sypherPhotos),
                       Friend(name: "Пифея", image: "Oracle", photos: oraclePhotos),
                       Friend(name: "Агент Смит", image: "Smith", photos: smithPhotos),
                       Friend(name: "Близнецы", image: "Twins", photos: twinsPhotos),
                       Friend(name: "Ниобе", image: "Niobe", photos: niobePhotos),
                       Friend(name: "Сераф", image: "Seraph", photos: seraphPhoto),
                       Friend(name: "Меровингер", image: "Merovingian", photos: merovingianPhoto)
        ]
        
        for friend in friends {
            
            let friendOne = Friend(name: "", image: "", photos: [Photo(name: "")])
            friendOne.name = friend.name
            friendOne.image = friend.image
            friendOne.photos = friend.photos
            self.friends.append(friendOne)
        }
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendTableViewCell", for: indexPath) as! FriendTableViewCell

        let friend = self.friends[indexPath.row]
        cell.setFriend(friend: friend)

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
        
        if segue.identifier == "showPhoto" {
            
            let destination = segue.destination as? PhotoCollectionViewController
            let source = segue.source as! FriendsTableViewController
            
            if let indexPath = source.tableView.indexPathForSelectedRow {
                
                let friend = source.friends[indexPath.row].name
                destination?.friend.name = friend
                
                let photos = source.friends[indexPath.row].photos
                destination?.photos = photos
            }
        }
    }
}
