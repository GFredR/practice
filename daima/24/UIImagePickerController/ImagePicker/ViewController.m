//
//  ViewController.m


/*
 Notes:
 
 UIImagePickerController is a wrapper for simple interactions with the camera on iOS. If you need more control use AVFoundation.
 
 Use of the photo library and camera by your app requires authorization. This is automatic. However, if the user declines authorization the photos library simply shows a black lock screen, and the camera is presented without buttons. To get more control over authorization I've presented some starter code below.
 
 
 */

#import "ViewController.h"
// needed to check authorization status
@import Photos;

// for AVPlayer
@import AVFoundation;

//  for AVPlayerViewController
@import AVKit;

@interface ViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

#pragma mark - View Controller Life Cycle

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(returnedFromBackgroundNotification:) name:UIApplicationWillEnterForegroundNotification object:nil];
    [self photolibraryAuthorizationStatus];
    [self cameraAccessAuthorizationStatus];
}

- (void)returnedFromBackgroundNotification:(NSNotification *)notification {
    [self photolibraryAuthorizationStatus];
    [self cameraAccessAuthorizationStatus];
}

#pragma mark - Checking Photo Library Authorization

- (BOOL)photolibraryAuthorizationStatus {
    PHAuthorizationStatus authStatus = [PHPhotoLibrary authorizationStatus];
    switch (authStatus) {
        case PHAuthorizationStatusAuthorized:
            return YES;
        case PHAuthorizationStatusNotDetermined: {
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                [self photolibraryAuthorizationStatus];
            }];
        }
            return NO;
        case PHAuthorizationStatusDenied:
            // fires if the user denies system attempt to authorize photo library
            [self alertUserWithMessage:@"本系统需要从照片库获取信息."];
            return NO;
        case PHAuthorizationStatusRestricted:
            return NO;
    }
}

- (void)alertUserWithMessage:(NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Authorization" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [[UIApplication sharedApplication] openURL:url];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Cancel Tapped");
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - Camera Access Authorization

- (BOOL)cameraAccessAuthorizationStatus {
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    switch (authStatus) {
        case AVAuthorizationStatusAuthorized:
            NSLog(@"Camera authorized");
            return YES;
        case AVAuthorizationStatusRestricted:
            NSLog(@"Camera restricted");
            return NO;
        case AVAuthorizationStatusNotDetermined:
            NSLog(@"Camera status not determined");
            [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
            return NO;
        case AVAuthorizationStatusDenied:
            NSLog(@"Camera status denied");
            [self alertUserWithMessage:@"This App Requires Authorization To Use Your Camera"];
            return NO;
    }
}


#pragma mark - Button Actions

/*
 * Check if the source type is available
 * Check for authorization (optional)
 * Init UIImagePickerController
 * Set delegate
 * Set sourceType
 * Set mediaTypes
 * Present the view controller
 * Handle delegate callbacks
 */

- (IBAction)albumTapped:(UIBarButtonItem *)sender {
    UIImagePickerControllerSourceType albumSourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    if (![UIImagePickerController isSourceTypeAvailable:albumSourceType]) {
        return;
    }
    if (![self photolibraryAuthorizationStatus]) {
        return;
    }
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.sourceType = albumSourceType;
    imagePickerController.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:
                                        albumSourceType];
    [self presentViewController:imagePickerController animated:YES completion:^{
        NSLog(@"%s", __PRETTY_FUNCTION__);
    }];
}

- (IBAction)libraryTapped:(UIBarButtonItem *)sender {
    UIImagePickerControllerSourceType photoLibSourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    if (![UIImagePickerController isSourceTypeAvailable:photoLibSourceType]) {
        return;
    }
    if (![self photolibraryAuthorizationStatus]) {
        return;
    }
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = photoLibSourceType;
    imagePickerController.delegate = self;
    imagePickerController.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:
                                        photoLibSourceType];
    [self presentViewController:imagePickerController animated:YES completion:^{
        NSLog(@"%s", __PRETTY_FUNCTION__);
    }];
}

- (IBAction)cameraTapped:(UIBarButtonItem *)sender {
    UIImagePickerControllerSourceType cameraSourceType = UIImagePickerControllerSourceTypeCamera;
    if (![UIImagePickerController isSourceTypeAvailable:cameraSourceType]) {
        return;
    }
    if (![self cameraAccessAuthorizationStatus]) {
        return;
    }
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    NSArray *sourceTypes = [UIImagePickerController availableMediaTypesForSourceType:cameraSourceType];
    NSLog(@"%@", sourceTypes);
    imagePickerController.sourceType = cameraSourceType;
    imagePickerController.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:
                                        cameraSourceType];
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

#pragma mark - Delegate Methods

/*
 * _info_ dictionary passes us the info about a chosen item
 * UIImagePickerControllerMediaType is either "public.image" or "public.movie"
 * UIImagePickerControllerReferenceURL URL points to image/video in the library
 * UIImagePickerControllerOriginalImage is the reference to the image you will want to use
 * UIImagePickerControllerOriginalMedia is the reference to the movie in a temp file
 */

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    NSLog(@"%@", info);
    [self dismissViewControllerAnimated:YES completion:^ {
        // handle image
        if ([info[UIImagePickerControllerMediaType] isEqualToString:@"public.image"]) {
            UIImage *image = info[UIImagePickerControllerOriginalImage];
            self.imageView.image = image;
        }
        // handle movie
        if ([info[UIImagePickerControllerMediaType] isEqualToString:@"public.movie"]) {
            NSLog(@"is movie");
            NSURL *url = info[UIImagePickerControllerMediaURL];
            // play video
            [self playVideoAtPath:url];
            // [self saveMovieWithInfo:info];
        }
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    NSLog(@"Was cancelled");
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Play Movie

- (void)playVideoAtPath:(NSURL *)path {
    AVPlayer *player = [AVPlayer playerWithURL:path];
    AVPlayerViewController *pvc = [AVPlayerViewController new];
    pvc.player = player;
    // [pvc.player play]; // if you want to start by playing
    [self presentViewController:pvc animated:YES completion:nil];
}

#pragma mark - Save Video

// saves video to Photo Album
- (void)saveMovieWithInfo:(NSDictionary<NSString *,id> *)info {
    
    NSURL *url = info[UIImagePickerControllerMediaURL];
    
    if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum([url path])) {
        // save it
        UISaveVideoAtPathToSavedPhotosAlbum([url path], self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
    }
}

// completion handler for saving a video
- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    
    NSLog(@"Finished saving with error: %@", error.localizedDescription);
    
    // remove the temp file
    NSError *err = nil;
    [[NSFileManager defaultManager] removeItemAtPath:videoPath error:&err];
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
}

#pragma mark - Tear Down

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
