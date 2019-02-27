//
//  TrailerViewController.swift
//  Flix
//
//  Created by Sheng Liu on 2/24/19.
//  Copyright © 2019 Sheng Liu. All rights reserved.
//

import UIKit

class TrailerViewController: UIViewController {

    
    @IBOutlet weak var webView: UIWebView!
    let base_url = URL(string: "https://www.youtube.com/watch?v=")
    var movie: [String:Any]! // ref. from another class
    
    
    var youtubeMovie = [String:Any]() // change within the class

    override func viewDidLoad() {
        super.viewDidLoad()


        let movieId = obtainMovieId()
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieId)/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                let movieObjects = dataDictionary["results"] as! [[String:Any]]
                
                let youtubeKeyA = movieObjects[0]
                
                let youtubeKey = youtubeKeyA["key"] as! String//self.youtubeMovie["key"] as! String
                let baseUrl = URL(string: "https://www.youtube.com/watch?v=" + youtubeKey)
                let url1 = URLRequest(url: baseUrl!)
                
                self.webView.loadRequest(url1)
                
            }
            
        }
        task.resume()
        
        // Do any additional setup after loading the view.
    }
    
    func obtainMovieId() -> String{
        
        let id = movie["id"] as! Int
        
        return String(id)
    }

}
