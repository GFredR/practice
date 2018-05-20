//
//  Movie.swift
//  Popular-Movies-tvOS
//
//  Created by Caleb Stultz on 6/11/16.
//  Copyright © 2016 Caleb Stultz. All rights reserved.
//

import Foundation

class Movie {
    
    let URL_POSTER_BASE = "http://image.tmdb.org/t/p/w500"
    let URL_BACKDROP_BASE = "http://image.tmdb.org/t/p/w1920"
    
    var title: String!
    var overview: String!
    var posterPath: String!
    var backdropPath: String!
        
    init(movieDict: Dictionary <String, AnyObject>) {
        
        if let title = movieDict["title"] as? String {
            self.title = title
        }
        
        if let overview = movieDict["overview"] as? String {
            self.overview = overview
        }
        
        if let path = movieDict["poster_path"] as? String {
            self.posterPath = "\(URL_POSTER_BASE)\(path)"
        }
        
        if let bgpath = movieDict["backdrop_path"] as? String {
            self.backdropPath = "\(URL_BACKDROP_BASE)\(bgpath)"
        }
        
    }
}
