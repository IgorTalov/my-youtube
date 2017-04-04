//
//  ViewController.swift
//  youTubeTest
//
//  Created by Игорь Талов on 26.03.17.
//  Copyright © 2017 Игорь Талов. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout  {

    private var cellID = "Cell"
    
    let menuBar: MenuBar = {
        let menu = MenuBar()
        return menu
    }()
    
    var videos: [Video] = {
        
        var kanneyChannel = Channel()
        kanneyChannel.name = "KanneyIsTheBestChannel"
        kanneyChannel.profileImageNamed = "kanye_profile"
        
//        var taylor
        
        var blankSpaceVideo = Video()
        blankSpaceVideo.title = "Taylor Swift - Blank Space"
        blankSpaceVideo.thumblnailImageName = "taylor_swift_blank_space"
        blankSpaceVideo.channel = kanneyChannel
        blankSpaceVideo.numberOfviews = 1254632
        
        var badBlood = Video()
        badBlood.title = "Taylor Swift - Bad Blood feat. Kendrick Lamar"
        badBlood.thumblnailImageName = "taylor_swift_bad_blood"
        badBlood.channel = kanneyChannel
        badBlood.numberOfviews = 3545864
        
        return [blankSpaceVideo, badBlood]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false

        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        navigationItem.titleView = titleLabel
        titleLabel.text = "Home"
        titleLabel.textColor = UIColor.white
        collectionView?.backgroundColor = UIColor.white
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: cellID)
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        
        setupMenuBar()
        setupBarButtons()
    }

    private func setupMenuBar() {
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:|[v0(50)]", views: menuBar)
    }
    
    private func setupBarButtons() {
        let searchImage = UIImage(named: "search_icon")?.withRenderingMode(.alwaysOriginal)
        let moreImage = UIImage(named: "nav_more_icon")?.withRenderingMode(.alwaysOriginal)
        let searchButton = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        let moreBarButtonItem = UIBarButtonItem(image: moreImage, style: .plain, target: self, action: #selector(handleMore))
        self.navigationItem.rightBarButtonItems = [moreBarButtonItem, searchButton]
    }
    
    func handleSearch() {
        print("Search")
    }
    
    func handleMore () {
        print("handle More")
    }
    //MARK: CollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! VideoCell
        
        cell.video = videos[indexPath.item]
        
        return cell
    }
    
    //MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.size.width - 32) * 9 / 16
        return CGSize(width: view.frame.width, height: height + 96)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}



