//
//  DiscoveryTableViewCell.swift
//  SBnriTube
//
//  Created by subrata Samartha on 28/08/23.
//

import UIKit

class DiscoveryTableViewCell: UITableViewCell {
    @IBOutlet weak var DiscoveryCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension DiscoveryTableViewCell: UICollectionViewDelegate {}

extension DiscoveryTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DiscoveryData.discoveryData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let discoveryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "discoveryCollectionViewCell", for: indexPath) as! DiscoveryCollectionViewCell
        discoveryCell.discoveryLabel.text = DiscoveryData.discoveryData[indexPath.row]
        return discoveryCell
    }
    
    
}

