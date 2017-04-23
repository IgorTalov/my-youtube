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
    
    let baseUrl = "https://s3-us-west-2.amazonaws.com/youtubeassets"
    
    func fetchVideos(complition: @escaping ([Video]) -> ()) {
        fetchFeedForUrlString(urlString: "\(baseUrl)/home.json") { (videos) in
            complition(videos)
        }
    }

    func fetchTrendingFeed(complition: @escaping ([Video]) -> ()) {
        fetchFeedForUrlString(urlString: "\(baseUrl)/trending.json") { (videos) in
            complition(videos)
        }
    }

    func fetchSubscriptionFeed(complition: @escaping ([Video]) -> ()) {
        fetchFeedForUrlString(urlString: "\(baseUrl)/subscriptions.json") { (videos) in
            complition(videos)
        }
    }
    
    private func fetchFeedForUrlString(urlString: String,  complition: @escaping ([Video]) -> ()) {
    
        let url = NSURL(string: urlString)
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
                if let unwrappedData = data {
                    if let jsonDictinaries = try JSONSerialization.jsonObject(with: unwrappedData, options: .mutableContainers) as? [[String : AnyObject]] {
                       var videos = [Video]()
                        
                        for dictinary in jsonDictinaries {
                            let video = Video(dictinary: dictinary)
                            videos.append(video)
                        }
 
                        DispatchQueue.main.async {
                            complition(videos)
                        }
                    }
                }

                
            } catch let jsonError {
                print(jsonError)
            }
        }
        dataTask.resume()
    }
    
}
