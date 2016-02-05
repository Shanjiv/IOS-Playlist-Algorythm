//
//  Playlist.m
//  Algorhythm
//
//  Created by Shan on 01.02.16.
//  Copyright © 2016 Shan. All rights reserved.
//

#import "Playlist.h"
#import "MusicLibrary.h"

@implementation Playlist

- (instancetype)initWithIndex:(NSUInteger)index{
    self = [super init];
    if (self) {
        MusicLibrary *musicLibrary = [[MusicLibrary alloc]init];
        NSArray *library = musicLibrary.library;
        
        NSDictionary *playlistDictionary = library[index];

        _playlisteTitle = [playlistDictionary objectForKey:kTitle];
        
        _playlistDescription = [playlistDictionary objectForKey:kDescription];
        
        NSString *iconName = [playlistDictionary objectForKey:kIcon];
        
        _playlistIcon = [UIImage imageNamed:iconName];
        
        NSString *largeIconName = [playlistDictionary objectForKey:kLargeIcon];
        
        _playlistIconLarge = [UIImage imageNamed:largeIconName];
        
        _playlistArtists = [NSArray arrayWithArray:[playlistDictionary objectForKey:kArtists]];
        
        NSDictionary *colorDictionary = [playlistDictionary objectForKey:kBackgroundColor];
        
        _backgroundColor = [self rgbColorFromDictionary:colorDictionary];
        
        //why self rgbColorFromDictionary???
    
    }
    return self;
}


- (UIColor *)rgbColorFromDictionary:(NSDictionary *)colorDicitonary {
    CGFloat red = [[colorDicitonary objectForKey:@"red"] doubleValue];
    CGFloat green = [[colorDicitonary objectForKey:@"green"] doubleValue];
    CGFloat blue = [[colorDicitonary objectForKey:@"blue"] doubleValue];
    CGFloat alpha = [[colorDicitonary objectForKey:@"alpha"] doubleValue];
    return [UIColor colorWithRed:red/255 green:green/255 blue:blue/255 alpha:alpha];
    
}



@end

