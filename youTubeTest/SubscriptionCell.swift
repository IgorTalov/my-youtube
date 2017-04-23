//
//  SubscriptionCell.swift
//  youTubeTest
//
//  Created by Игорь Талов on 23.04.17.
//  Copyright © 2017 Игорь Талов. All rights reserved.
//

import UIKit

class SubscriptionCell: FeedCell {

    override func fetchVideos() {
        APIService.sharedInstance.fetchSubscriptionFeed { (videos: [Video]) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }

}
