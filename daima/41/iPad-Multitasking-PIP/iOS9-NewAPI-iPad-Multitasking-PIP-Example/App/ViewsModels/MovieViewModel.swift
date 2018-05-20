//
//  MovieViewModel.swift


import Foundation
import UIKit

struct MovieViewModel: MovieTextCellDataSource {
    var title = "Movie Index"
}

extension MovieViewModel: MovieTextCellDelegate {
    
    var titleColor: UIColor {
        return .white()
    }
}
