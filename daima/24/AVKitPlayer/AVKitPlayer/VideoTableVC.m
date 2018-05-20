//
//  VideoTableVC.m


#import "VideoTableVC.h"
#import "PlaybackVC.h"

@import AVFoundation;
@import AVKit;

@interface VideoTableVC () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *playButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *allVideosArray; // of NSURL
@property (strong, nonatomic) NSMutableArray *selectedVideosArray; // of NSURL

@property (weak, nonatomic) AVPlayer *previewPlayer;

@end

@implementation VideoTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateButton];
    
    
}

- (IBAction)onPlayButtonTapped:(UIBarButtonItem *)sender {

    // perform playVideo segue
    if (self.selectedVideosArray.count == 2) {
        
        [self performSegueWithIdentifier:@"play2videos" sender:nil];
    }
    
}

- (void)updateButton { // enables button only if 2 videos selected
    
    if (self.selectedVideosArray.count == 2) {
        
        self.playButton.enabled = true;
    } else {
        
        self.playButton.enabled = false;
    }
}

#pragma mark - UITableView

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    NSURL *videoURL = self.allVideosArray[indexPath.row];
    cell.textLabel.text = videoURL.lastPathComponent;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.allVideosArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // preview selected video
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:self.allVideosArray[indexPath.row]];
    [self.previewPlayer replaceCurrentItemWithPlayerItem:playerItem];
    [self.previewPlayer play];
    
    [self.selectedVideosArray addObject:self.allVideosArray[indexPath.row]];
    
    [self updateButton];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.selectedVideosArray removeObject:self.allVideosArray[indexPath.row]];
    
    [self updateButton];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"previewVideo"]) { // auto-play video on first launch

        AVPlayerViewController *previewVC = segue.destinationViewController;
        previewVC.player = [AVPlayer playerWithURL:[self.allVideosArray firstObject]];
        [previewVC.player play];
        
        self.previewPlayer = previewVC.player; // create weak reference for use later
    }
    
    if ([segue.identifier isEqualToString:@"play2videos"]) {
        
        PlaybackVC *playbackVC = segue.destinationViewController;
        playbackVC.topVideo = self.selectedVideosArray[0];
        playbackVC.bottomVideo = self.selectedVideosArray[1];
        
        [self.previewPlayer pause];
    }
}

#pragma mark - Property Instantiation

- (NSArray *)allVideosArray {
    
    if (!_allVideosArray) {
     
        _allVideosArray = [NSArray arrayWithObjects:
                           [[NSBundle mainBundle] URLForResource:@"video1" withExtension:@"mov"],
                           [[NSBundle mainBundle] URLForResource:@"video2" withExtension:@"mov"],
                           [[NSBundle mainBundle] URLForResource:@"video3" withExtension:@"mov"],
                           [[NSBundle mainBundle] URLForResource:@"video4" withExtension:@"mov"], nil];
    }
    
    return _allVideosArray;
}


- (NSMutableArray *)selectedVideosArray {
    
    if (!_selectedVideosArray) _selectedVideosArray = [NSMutableArray new];
    return _selectedVideosArray;
}


@end
