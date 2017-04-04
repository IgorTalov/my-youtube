//
//  Video.swift
//  youTubeTest
//
//  Created by Игорь Талов on 04.04.17.
//  Copyright © 2017 Игорь Талов. All rights reserved.
//

import Foundation

class Video: NSObject {
    
    var thumblnailImageName: String?
    var title: String?
    var numberOfviews: NSNumber?
    var uploadDate: NSDate?

    var channel: Channel?
}

class Channel: NSObject {
    
    var name: String?
    var profileImageNamed: String?
    
}
