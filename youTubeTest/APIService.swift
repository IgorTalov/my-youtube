//
//  APIService.swift
//  youTubeTest
//
//  Created by Игорь Талов on 22.04.17.
//  Copyright © 2017 Игорь Талов. All rights reserved.
//

import UIKit

class APIService: NSObject {
    
    static let sharedInstance = APIService()
    
    func fetchVideos(complition: @escaping ([Video]) -> ()) {
        let url = NSURL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
        let request = URLRequest(url: url as! URL)
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            if error != nil {
                print("error - \(error)")
                return
            } else {
                //So smth
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                
                var videos = [Video]()
                
                for dictinary in json as! [[String: AnyObject]] {
                    
                    let video = Video()
                    video.title = dictinary["title"] as? String
                    video.thumblnailImageName = dictinary["thumbnail_image_name"] as! String?
                    
                    let channelDic = dictinary["channel"] as! [String: AnyObject]
                    
                    let channel = Channel()
                    channel.name = channelDic["name"] as? String
                    channel.profileImageNamed = channelDic["profile_image_name"] as? String
                    
                    video.channel = channel
                    
                    videos.append(video)
                }
                
                DispatchQueue.main.async {
                    complition(videos)
                }
            } catch let jsonError {
                print(jsonError)
            }
        }
        dataTask.resume()
    }

    func fetchTrendingFeed(complition: @escaping ([Video]) -> ()) {
        let url = NSURL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/trending.json")
        let request = URLRequest(url: url as! URL)
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            if error != nil {
                print("error - \(error)")
                return
            } else {
                //So smth
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                
                var videos = [Video]()
                
                for dictinary in json as! [[String: AnyObject]] {
                    
                    let video = Video()
                    video.title = dictinary["title"] as? String
                    video.thumblnailImageName = dictinary["thumbnail_image_name"] as! String?
                    
                    let channelDic = dictinary["channel"] as! [String: AnyObject]
                    
                    let channel = Channel()
                    channel.name = channelDic["name"] as? String
                    channel.profileImageNamed = channelDic["profile_image_name"] as? String
                    
                    video.channel = channel
                    
                    videos.append(video)
                }
                
                DispatchQueue.main.async {
                    complition(videos)
                }
            } catch let jsonError {
                print(jsonError)
            }
        }
        dataTask.resume()
    }

    
}
