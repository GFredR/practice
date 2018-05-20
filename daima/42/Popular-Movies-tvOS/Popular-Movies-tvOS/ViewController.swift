//
//  ViewController.swift
//  Popular-Movies-tvOS
//
//  Created by Caleb Stultz on 6/11/16.
//  Copyright © 2016 Caleb Stultz. All rights reserved.
//

import UIKit

//Attempt at building protocol but seems repetitive...

protocol MovieDataDelegate {
    func configureMovieTitle(_ title: String)
    func configureMovieOverview(_ overview: String)
    func configureMoviePosterPath(_ posterPath: String)
    func configureMovieBackdropPath(_ backdropPath: String)
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let URL_BASE = "http://api.themoviedb.org/3/movie/popular?api_key=11de15b832e0eba51c3619d5d805e30d"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var delegate: MovieDataDelegate? = nil
    
    let defaultSize = CGSize(width: 308, height: 461)
    let focusSize = CGSize(width: 338, height: 507)
    var movies = [Movie]()
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        downloadData()
    }
    
    func downloadData() {
        let url = URL(string: URL_BASE)!
        let request = URLRequest(url: url)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) -> Void in
            
            if error != nil {
                print(error.debugDescription)
            } else {
                do {
                    let dict = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? Dictionary <String, AnyObject>
                    
                    if let results = dict!["results"] as? [Dictionary <String, AnyObject>] {
                        
                        for obj in results {
                            let movie = Movie(movieDict: obj)
                            self.movies.append(movie)
                        }
                        
                        //After downloading data, grab Main UI Thread and reload CollectionView
                        DispatchQueue.main.async(execute: { 
                            self.collectionView.reloadData()
                        })
                    }
                    
                } catch {
                    
                }
            }
        }
        task.resume()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as? MovieCell {
            
            let movie = movies[(indexPath as NSIndexPath).row]
            cell.configureCell(movie)
            
            if cell.gestureRecognizers?.count == nil {
                let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapped(_:)))
                tap.allowedPressTypes = [NSNumber(value: UIPressType.select.rawValue)]
                cell.addGestureRecognizer(tap)
            }
            
            return cell
            
        } else {
            return MovieCell()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 343, height: 535)
    }
    
    //The tapped function below is what registers that I have selected a CollectionViewCell instead of using didSelectItemAtIndexPath()
    
    func tapped(_ gesture: UITapGestureRecognizer) {
        
        if (gesture.view as? MovieCell) != nil {
        performSegue(withIdentifier: "ShowDetail", sender: nil)
        }
        
        if delegate != nil {
            //chose [1] since I couldn't figure out how to find the indexPath without a collectionview delegate function.
            let title = movies[1].title
            let overview = movies[1].overview
            let posterPath = movies[1].posterPath
            let backdropPath = movies[1].backdropPath
            delegate?.configureMovieTitle(title!)
            delegate?.configureMovieOverview(overview!)
            delegate?.configureMoviePosterPath(posterPath!)
            delegate?.configureMovieBackdropPath(backdropPath!)
        }
    }
    
//      prepareForSegue isn't working yet.
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "ShowDetail" {
//            if let detailVC = segue.destinationViewController as? DetailVC {
//                detailVC.delegate = self
//            }
//        }
//    }
}
