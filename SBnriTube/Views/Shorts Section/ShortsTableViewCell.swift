//
//  ShortsTableViewCell.swift
//  SBnriTube
//
//  Created by subrata Samartha on 28/08/23.
//

import UIKit

class ShortsTableViewCell: UITableViewCell {

    @IBOutlet weak var shortsCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.shortsCollectionView.delegate = self
        self.shortsCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ShortsTableViewCell: UICollectionViewDelegate {}

extension ShortsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HomeViewController.videosRes.videos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let shortsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "shortsCollectionViewCell", for: indexPath) as! ShortsCollectionViewCell
        shortsCell.thumbnailImageView.image = UIImage(named: HomeViewController.videosRes.videos[indexPath.row].thumbnail)
        shortsCell.titleLabel.text = HomeViewController.videosRes.videos[indexPath.row].title
        shortsCell.viewsLabel.text = HomeViewController.videosRes.videos[indexPath.row].views
        
        return shortsCell
    }
    
    
}
