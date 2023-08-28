//
//  VideosModel.swift
//  SBnriTube
//
//  Created by subrata Samartha on 28/08/23.
//

struct VideosModel: Codable {
    var videos:[video]
}

struct video: Codable {
    var id: Int
    var title: String
    var thumbnail: String
    var channelName: String
    var profilePic: String
    var views: String
    var timeStamp: String
}
