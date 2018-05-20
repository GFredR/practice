//
//  MovieCollectionViewCell.h


#import <UIKit/UIKit.h>
#import "Movie.h"

@interface MovieCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, assign) NSIndexPath *indexPath;

- (void)updateCellForMovie:(Movie *)movie;

@end
