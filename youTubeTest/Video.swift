//
//  Video.swift
//  youTubeTest
//
//  Created by Игорь Талов on 04.04.17.
//  Copyright © 2017 Игорь Талов. All rights reserved.
//

import Foundation

class SafeJSONObject: NSObject {
    
    override func setValue(_ value: Any?, forKey key: String) {
        let selectorString = key.firstCharacterUppercased
        
        let selector = NSSelectorFromString("set\(selectorString):")
        
        let response = self.responds(to: selector)
        
        if !response {
            return
        }
        super.setValue(value, forKey: key)
    }
    
}

class Video: SafeJSONObject {
    
    var thumbnail_image_name: String?
    var title: String?
    var number_of_views: NSNumber?
    var uploadDate: NSDate?
    var duration: NSNumber?

    var channel: Channel?
    
    override func setValue(_ value: Any?, forKey key: String) {
        
        if key == "channel" {
            self.channel = Channel()
            self.channel?.setValuesForKeys(value as! [String: AnyObject])
        } else {
             super.setValue(value, forKey: key)
        }
    }

    init(dictinary: [String: AnyObject]) {
        super.init()
        
        self.setValuesForKeys(dictinary)
    }

}

class Channel: NSObject {
    
    var name: String?
    var profile_image_name: String?
    
}
