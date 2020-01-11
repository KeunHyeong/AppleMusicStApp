//
//  TrackManager.swift
//  AppleMusicStApp
//
//  Created by joonwon lee on 2020/01/12.
//  Copyright © 2020 com.joonwon. All rights reserved.
//

import UIKit
import AVFoundation

class TrackManager {
    var tracks: [AVPlayerItem] = []
    var albums: [Album] = []
    
    init() {
        let tracks = loadTracks()
        self.tracks = tracks
        self.albums = loadAlbums(tracks: tracks)
    }
    
    func loadAlbums(tracks: [AVPlayerItem]) -> [Album] {
        let trackList = tracks.compactMap { $0.convertToTrack() }
        let albumDics = Dictionary(grouping: trackList, by: { track in  track.albumName })
        var albums: [Album] = []
        for (key, value) in albumDics {
            let title = key
            let tracks = value
            let album = Album(title: title, tracks: tracks)
            albums.append(album)
        }
        
        
//        print("----> \(albumDics)")
        return albums
    }
    
    func loadTracks() -> [AVPlayerItem] {
        let urls = Bundle.main.urls(forResourcesWithExtension: "mp3", subdirectory: nil) ?? []
        let tracks = urls.map { AVPlayerItem(url: $0) }
//        let tracks = urls.map{ AVPlayerItem(url: $0) }.compactMap { $0.convertToTrack() }
//
//        var tracks: [Track] = []
//        for url in urls {
//            let item = AVPlayerItem(url: url)
//            if let track = item.convertToTrack() {
//                tracks.append(track)
//            }
//            print("--> \(item.convertToTrack())")
//        }
        
        return tracks
    }
    
    func track(at index: Int) -> Track? {
        return tracks[index].convertToTrack()
    }
}
