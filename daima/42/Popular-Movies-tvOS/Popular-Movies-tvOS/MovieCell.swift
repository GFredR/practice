//
//  MovieCell.swift
//  Popular-Movies-tvOS
//
//  Created by Caleb Stultz on 6/11/16.
//  Copyright © 2016 Caleb Stultz. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieLbl: UILabel!
        
    func configureCell(_ movie: Movie) {
        
        if let title = movie.title {
            movieLbl.text = title
        }
        
        if let path = movie.posterPath {
            let url = URL(string: path)!
            
            DispatchQueue.global(attributes: DispatchQueue.GlobalAttributes.qosDefault).async(execute: {
                
                let data = try! Data(contentsOf: url)
                DispatchQueue.main.async(execute: {
                    let img = UIImage(data: data)
                    self.movieImg.image = img
                })
            })
        }
    }
}
