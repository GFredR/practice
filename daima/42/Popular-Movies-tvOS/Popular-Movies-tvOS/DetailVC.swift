//
//  DetailVC.swift
//  Popular-Movies-tvOS
//
//  Created by Caleb Stultz on 6/11/16.
//  Copyright © 2016 Caleb Stultz. All rights reserved.
//

import UIKit

class DetailVC: UIViewController, MovieDataDelegate {
    
    let blur = UIBlurEffect(style: UIBlurEffectStyle.light)
    let URL_BASE = "http://api.themoviedb.org/3/movie/popular?api_key=11de15b832e0eba51c3619d5d805e30d"
    
    var movie: Movie!
    
    @IBOutlet weak var blurBackdrop: UIImageView!
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    
    var posterPath: String!
    var backdropPath: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let blurView = UIVisualEffectView(effect: blur)
        blurView.frame = self.view.frame
        blurBackdrop.addSubview(blurView)
    }
    
    //Individual functions from delegate method that set up each @IBOutlet.
    
    func configureMovieTitle(_ title: String) {
        movieTitle.text = title
    }
    
    func configureMovieOverview(_ overview: String) {
        movieOverview.text = overview
    }
    
    func configureMoviePosterPath(_ posterPath: String) {
        if let posterPath = movie.posterPath {
            let url = URL(string: posterPath)!
            
            DispatchQueue.global(attributes: DispatchQueue.GlobalAttributes.qosDefault).async(execute: {
                let data = try! Data(contentsOf: url)
                DispatchQueue.main.async(execute: {
                    let img = UIImage(data: data)
                    self.moviePoster.image = img
                })
            })
        }
    }
    
    func configureMovieBackdropPath(_ backdropPath: String) {
        if let blurBackdrop = movie.backdropPath {
            let url = URL(string: blurBackdrop)!
            
            DispatchQueue.global(attributes: DispatchQueue.GlobalAttributes.qosDefault).async(execute: {
                let data = try! Data(contentsOf: url)
                DispatchQueue.main.async(execute: {
                    let img = UIImage(data: data)
                    self.blurBackdrop.image = img
                })
            })
        }
    }
}
