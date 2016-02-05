//
//  ViewController.m
//  Algorhythm
//
//  Created by Shan on 01.02.16.
//  Copyright © 2016 Shan. All rights reserved.
//

#import "PlaylistMasterViewController.h"
#import "PlaylistDetailViewController.h"
#import "Playlist.h"

@interface PlaylistMasterViewController ()

@end

@implementation PlaylistMasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (NSUInteger index = 0; index < self.PlaylistImageViews.count; index++) {
        Playlist *playlist = [[Playlist alloc] initWithIndex:index];
        UIImageView *playlistImageView = self.PlaylistImageViews[index];
        
        playlistImageView.image = playlist.playlistIcon;
        playlistImageView.backgroundColor = playlist.backgroundColor;
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqual:@"showPlaylistDetail"]){
        
        
        UIImageView *playlistImageView = (UIImageView *)[sender view];
        
        if ([self.PlaylistImageViews containsObject:playlistImageView]) {
            NSUInteger index = [self.PlaylistImageViews indexOfObject:playlistImageView];
            
            PlaylistDetailViewController *playlistDetailController = segue.destinationViewController;
            //PlaylistDetailViewController *playlistDetailController = (PlaylistDetailViewController *)segue.destinationViewController;
            playlistDetailController.playlist = [[Playlist alloc] initWithIndex:index];
        }
    }
}


- (IBAction)showPlaylistDetail:(id)sender {
    
    [self performSegueWithIdentifier:@"showPlaylistDetail" sender:sender];
    
    //why sender:sender???
}


@end
