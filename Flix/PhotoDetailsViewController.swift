//
//  PhotoDetailsViewController.swift
//  Flix
//
//  Created by Sheng Liu on 2/22/19.
//  Copyright © 2019 Sheng Liu. All rights reserved.
//

import UIKit
import AlamofireImage

class PhotoDetailsViewController: UIViewController {

    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var releasedLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    var movie: [String:Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = (movie["title"] as! String)
        synopsisLabel.text = (movie["overview"] as! String)
        releasedLabel.text = (movie["release_date"] as! String)
        let base_url = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: base_url + posterPath)
        
        let backdropPath = movie["backdrop_path"] as! String
        let backgropUrl = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)
        posterView.af_setImage(withURL: posterUrl!)
        backdropView.af_setImage(withURL: backgropUrl!)

    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // get the new view controller using seque.destination.
        // pass the selected object to the new view controller.
        
        // we need to get a reference to our destination view controller
        
        let detailsViewController = segue.destination as! TrailerViewController
        detailsViewController.movie = self.movie
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
