//
//  ViewController.swift
//  SBnriTube
//
//  Created by subrata Samartha on 28/08/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var VideosTableView: UITableView!
    static var videosRes:VideosModel = VideosModel(videos: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let videoCellNib = UINib(nibName: "VideosTableViewCell", bundle: nil)
        VideosTableView.register(videoCellNib, forCellReuseIdentifier: "videoCell")
        
        NetworkManager.shared.getVideos {  videosData, errorMessage in
            if let errorMessage = errorMessage {
                print(errorMessage)
                return
            }

            guard let videos = videosData else {
                print("No data")
                return
            }
            print(videos)
            
            HomeViewController.videosRes = videos
        }
        
        
    }
}

extension HomeViewController: UITableViewDelegate {}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HomeViewController.videosRes.videos.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let discoveryTableViewCell = tableView.dequeueReusableCell(withIdentifier: "discoveryTableViewCell", for: indexPath) as! DiscoveryTableViewCell
            return discoveryTableViewCell
        case 1:
            let newIndexPath = indexPath.row - 1
            
            let videoCell = tableView.dequeueReusableCell(withIdentifier: "videoCell", for: indexPath) as! VideosTableViewCell
            videoCell.thumbnailImageView.image = UIImage(named: HomeViewController.videosRes.videos[newIndexPath].thumbnail)
            videoCell.profilePicImageView.image = UIImage(named: HomeViewController.videosRes.videos[newIndexPath].profilePic)
            videoCell.titleLabel.text = HomeViewController.videosRes.videos[newIndexPath].title
            videoCell.channelNameLabel.text = HomeViewController.videosRes.videos[newIndexPath].channelName
            videoCell.viewsLabel.text = HomeViewController.videosRes.videos[newIndexPath].views
            videoCell.timestampLabel.text = HomeViewController.videosRes.videos[newIndexPath].timeStamp
            
            return videoCell
        case 2:
            let shortsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "shortsTableViewCell") as! ShortsTableViewCell
            return shortsTableViewCell
        default:
            let newIndexPath = indexPath.row - 2
            
            let videoCell = tableView.dequeueReusableCell(withIdentifier: "videoCell", for: indexPath) as! VideosTableViewCell
            videoCell.thumbnailImageView.image = UIImage(named: HomeViewController.videosRes.videos[newIndexPath].thumbnail)
            videoCell.profilePicImageView.image = UIImage(named: HomeViewController.videosRes.videos[newIndexPath].profilePic)
            videoCell.titleLabel.text = HomeViewController.videosRes.videos[newIndexPath].title
            videoCell.channelNameLabel.text = HomeViewController.videosRes.videos[newIndexPath].channelName
            videoCell.viewsLabel.text = HomeViewController.videosRes.videos[newIndexPath].views
            videoCell.timestampLabel.text = HomeViewController.videosRes.videos[newIndexPath].timeStamp
            
            return videoCell
        }
        
//        if indexPath.row == 0 {
//            let discoveryTableViewCell = tableView.dequeueReusableCell(withIdentifier: "discoveryTableViewCell", for: indexPath) as! DiscoveryTableViewCell
//            return discoveryTableViewCell
//        } else {
//            let newIndexPath = indexPath.row - 1
//
//            let videoCell = tableView.dequeueReusableCell(withIdentifier: "videoCell", for: indexPath) as! VideosTableViewCell
//            videoCell.thumbnailImageView.image = UIImage(named: HomeViewController.videosRes.videos[newIndexPath].thumbnail)
//            videoCell.profilePicImageView.image = UIImage(named: HomeViewController.videosRes.videos[newIndexPath].profilePic)
//            videoCell.titleLabel.text = HomeViewController.videosRes.videos[newIndexPath].title
//            videoCell.channelNameLabel.text = HomeViewController.videosRes.videos[newIndexPath].channelName
//            videoCell.viewsLabel.text = HomeViewController.videosRes.videos[newIndexPath].views
//            videoCell.timestampLabel.text = HomeViewController.videosRes.videos[newIndexPath].timeStamp
//
//            return videoCell
//        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 50
        } else if indexPath.row == 2 {
            return 320
        } else {
            return 290
        }
    }
}

