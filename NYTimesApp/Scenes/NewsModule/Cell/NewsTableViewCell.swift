//
//  NewsTableViewCell.swift
//  NYTimesApp
//
//  Created by Zeinab Reda on 30/01/2021.
//

import UIKit
import AlamofireImage

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImg: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    var item:NewsResult? {
        didSet {
            newsTitleLabel.text = item?.title
            
            if let link = item?.media.first?.mediaMetadata.first?.url, let url = URL(string: link) {
                newsImg.af.setImage(withURL: url, placeholderImage: #imageLiteral(resourceName: "noimage"))}
        }
    }
}
