//
//  PhotoCollectionViewController.swift
//  VKontakte
//
//  Created by Ирина Семячкина on 13.05.2020.
//  Copyright © 2020 Ирина Семячкина. All rights reserved.
//

import UIKit

class PhotoCollectionViewController: UICollectionViewController {

    var friend = Friend(name: "", image: "", photos: [Photo(name: "")])
    var photos: [Photo] = []
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.backgroundColor = UIColor(red: 32 / 255, green: 32 / 255, blue: 32 / 255, alpha: 0.8)
        
        self.showAlert()

        self.title = self.friend.name
        self.setupPhotosSize()
    }
    
    
    // MARK: - Actions
    
    @IBAction private func showAlert() {
        
        let alertController = UIAlertController(title: "", message: "Чтобы поставить лайк - просто кликните дважды по фото", preferredStyle: .alert)
        let alertOkAction = UIAlertAction(title: "OK", style: .cancel)
        alertController.addAction(alertOkAction)
        
        alertController.view.backgroundColor = UIColor.black
        alertController.view.layer.cornerRadius = 15
        alertController.view.layer.masksToBounds = true
        
        alertController.view.tintColor = .white
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    // MARK: - Layout
    
    private func setupPhotosSize() {
        let layout = CustomCollectionLayout()
        layout.delegate = self
        layout.numberOfColumns = 2
        layout.cellPadding = 5
        collectionView.collectionViewLayout = layout
    }


    // MARK: - UICollectionView Data Source

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
    
        let photo = self.photos[indexPath.row]
        cell.setPhoto(photo: photo)
    
        return cell
    }
}


// MARK: - Extension

extension PhotoCollectionViewController: CustomLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, sizeOfPhotoAtIndexPath indexPath: IndexPath) -> CGSize {
        return UIImage(named: photos[indexPath.item].name)!.size
    }
}
