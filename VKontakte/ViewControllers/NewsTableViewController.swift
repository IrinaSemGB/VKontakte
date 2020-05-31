//
//  NewsTableViewController.swift
//  VKontakte
//
//  Created by Ирина Семячкина on 25.05.2020.
//  Copyright © 2020 Ирина Семячкина. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {

    
    var news: [News] = []
    
    var photo_news_1: [PhotoNews] = []
    var photo_news_2: [PhotoNews] = []
    var photo_news_3: [PhotoNews] = []
    
    var indexPathOfTableCell: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.estimatedRowHeight = self.tableView.rowHeight
        self.tableView.rowHeight = UITableView.automaticDimension
        
        self.addNews()
    }
    
    
    // MARK: add News
    
    func addNews() {
        
        // 1
        
        let photo_1: [PhotoNews] = [PhotoNews(name: "news-1-1"),
                                    PhotoNews(name: "news-1-2"),
                                    PhotoNews(name: "news-1-3"),
                                    PhotoNews(name: "news-1-4")]
        for item in photo_1 {
            let photo = PhotoNews(name: "")
            photo.name = item.name
            self.photo_news_1.append(photo)
        }
        
        let news_1: News = News(autorImage: "Smith",
                                autorName: "Агент Смит",
                                time: "месяц назад",
                                photo: photo_1,
                                signature: "🧬🦠🧫 Я хочу поделиться теорией, которую недавно создал... человечество - это вирус")
        self.news.append(news_1)
        
        // 2
        
        let photo_2: [PhotoNews] = [PhotoNews(name: "news-2-1"),
                                    PhotoNews(name: "news-2-2"),
                                    PhotoNews(name: "news-2-3"),
                                    PhotoNews(name: "news-2-4")]
        for item in photo_2 {
            let photo = PhotoNews(name: "")
            photo.name = item.name
            self.photo_news_2.append(photo)
        }
        
        let news_2: News = News(autorImage: "Neo",
                                autorName: "Нео",
                                time: "больше года назад",
                                photo: photo_2,
                                signature: "🎂 31 марта 2019 исполнилось 20 лет со дня премьеры фильма братьев Вачовски «Матрица»")
        self.news.append(news_2)
        
        // 3
        
        let photo_3: [PhotoNews] = [PhotoNews(name: "news-3-1"),
                                    PhotoNews(name: "news-3-2"),
                                    PhotoNews(name: "news-3-3"),
                                    PhotoNews(name: "news-3-4")]
        for item in photo_3 {
            let photo = PhotoNews(name: "")
            photo.name = item.name
            self.photo_news_3.append(photo)
        }
        
        let news_3: News = News(autorImage: "Morpheus",
                                autorName: "Морфеус",
                                time: "сегодня в 17:32",
                                photo: photo_3,
                                signature: "Я не обещал, что будет легко😎, я лишь обещал открыть 💊правду💊")
        self.news.append(news_3)
    }
    

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        
        if indexPath.row == 0 {
            self.indexPathOfTableCell = 0
            
            let news = self.news[indexPath.row]
            cell.setNews(newsOne: news)
        
        } else if indexPath.row == 1 {
            self.indexPathOfTableCell = 1
            
            let news = self.news[indexPath.row]
            cell.setNews(newsOne: news)
        
        } else if indexPath.row == 2 {
            
            self.indexPathOfTableCell = 2
            
            let news = self.news[indexPath.row]
            cell.setNews(newsOne: news)
        }
        
        return cell
    }


    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if let cell = cell as? NewsTableViewCell {
            cell.collectionView?.dataSource = self
            cell.collectionView?.delegate = self
            cell.collectionView?.reloadData()
            cell.collectionView?.isScrollEnabled = false
            
            UIView.animate(withDuration: 1) {
                cell.collectionView?.alpha = 1
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

            return tableView.bounds.width + 174
    }
}


    // MARK: - Collection View

extension NewsTableViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as! NewsCollectionViewCell
        
        if self.indexPathOfTableCell == 0 {
            
            let photo = self.photo_news_1[indexPath.row]
            cell.setNewsPhoto(photoNews: photo)
        
        } else if self.indexPathOfTableCell == 1 {
            
            let photo = self.photo_news_2[indexPath.row]
            cell.setNewsPhoto(photoNews: photo)
        
        } else if self.indexPathOfTableCell == 2 {
            
            let photo = self.photo_news_3[indexPath.row]
            cell.setNewsPhoto(photoNews: photo)
        }
        
        return cell
    }
}

extension NewsTableViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 5.0
        layout.minimumInteritemSpacing = 2.5
        
        let numberOfItemsPerRow: CGFloat = 2.0
        let itemWidth = (collectionView.bounds.width - layout.minimumLineSpacing) / numberOfItemsPerRow
        
        return CGSize(width: itemWidth, height: itemWidth)
    }
}

