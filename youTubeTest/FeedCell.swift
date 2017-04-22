//
//  FeedCell.swift
//  youTubeTest
//
//  Created by Игорь Талов on 22.04.17.
//  Copyright © 2017 Игорь Талов. All rights reserved.
//

import UIKit

class FeedCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var videos: [Video]?
    
    let cellID = "cell"
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        fetchVideos()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(collectionView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
    }
    
    func fetchVideos() {
        APIService.sharedInstance.fetchVideos { (videos:[Video]) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }
    
    //MARK: UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos?.count ?? 0
//        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! VideoCell

        cell.video = videos?[indexPath.item]

        return cell
    }
    
    //MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (self.frame.size.width - 32) * 9 / 16
        return CGSize(width: self.frame.width, height: height + 96)
    }
    
}
