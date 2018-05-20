//
//  MovieCollectionViewCell.m


#import "MovieCollectionViewCell.h"

@implementation MovieCollectionViewCell

- (void)updateCellForMovie:(Movie *)movie {
    self.titleLabel.text = movie.title;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSData *data = [NSData dataWithContentsOfURL:movie.imageURL];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.posterImageView.image = [UIImage imageWithData:data];
        });
    });
}

@end
