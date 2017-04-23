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
    private var trandingCellID = "trandingCellID"
    private let subscriptionCellID = "subscriptionID"
    
    let titles = ["Home", "Trending", "Subscriptions", "Account"]
    
    lazy var menuBar: MenuBar = {
        let menu = MenuBar()
        menu.homeController = self
        return menu
    }()
    
    lazy var settingLauncher: SettingsLauncher = {
        let launcher = SettingsLauncher()
        launcher.homeController = self
        return launcher
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = false

        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        navigationItem.titleView = titleLabel
        titleLabel.text = "  Home"
        titleLabel.textColor = UIColor.white
        
        setupColletionView()
        setupMenuBar()
        setupBarButtons()
    }

    func setupColletionView() {
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }

        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellID)
        collectionView?.register(TrendingCell.self, forCellWithReuseIdentifier: trandingCellID)
        collectionView?.register(SubscriptionCell.self, forCellWithReuseIdentifier: subscriptionCellID)
        collectionView?.isPagingEnabled = true
    }
    
    private func setupMenuBar() {

        navigationController?.hidesBarsOnSwipe = true

        let redView = UIView()
        redView.backgroundColor = UIColor.red
        
        view.addSubview(redView)
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: redView)
        view.addConstraintsWithFormat(format: "V:[v0(50)]", views: redView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:[v0(50)]", views: menuBar)
        
        menuBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.horizontalBarLeftConstraint?.constant = scrollView.contentOffset.x / 4
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.pointee.x / view.frame.width
        
        let indexPath = NSIndexPath(item: Int(index), section: 0)
        menuBar.collectionView.selectItem(at: indexPath as IndexPath, animated: true, scrollPosition: UICollectionViewScrollPosition(rawValue: 0))
        
        setupTitleForIndex(index: Int(index))
        
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
    
    func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = NSIndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath as IndexPath, at: UICollectionViewScrollPosition(rawValue: 0) , animated: true)
        setupTitleForIndex(index: menuIndex)
    }
    
    private func setupTitleForIndex(index: Int) {
        if let titleLabel = navigationItem.titleView as? UILabel  {
            titleLabel.text = "  \(titles[Int(index)])"
        }
    }
    
    func handleMore () {
        settingLauncher.showSettings()
    }
    
    func showSettingsControllerForSetting(setting: Setting) {

        let dummySettingsController = UIViewController()
        dummySettingsController.navigationItem.title = setting.name.rawValue
        dummySettingsController.view.backgroundColor = UIColor.white
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        navigationController?.pushViewController(dummySettingsController, animated: true)
    }
    
    //MARK: CollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let identifier: String

        
        
        if indexPath.item == 1 {
            identifier = trandingCellID
        } else if indexPath.item == 2 {
            identifier = subscriptionCellID
        } else {
            identifier = cellID
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        
        return cell
    }
    
    //MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}



