//
//  NewsDetailsViewController.swift
//  NYTimesApp
//
//  Created by Zeinab Reda on 30/01/2021.
//

import UIKit
import AlamofireImage

class NewsDetailsViewController: UIViewController {

    var newsDetails:NewsResult?
    @IBOutlet weak var newsImg: UIImageView!
    @IBOutlet weak var newsDateLb: UILabel!
    @IBOutlet weak var newsLb: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        newsDateLb.text = "Date : \(newsDetails?.publishedDate ?? "")"
        newsLb.text = newsDetails?.abstract ?? ""
        if let link = newsDetails?.media.first?.mediaMetadata.first?.url, let url = URL(string: link) {
            newsImg.af.setImage(withURL: url, placeholderImage: #imageLiteral(resourceName: "noimage"))}
        

        // Do any additional setup after loading the view.
    }
    
    @objc public static func create() -> NewsDetailsViewController {
         return UIStoryboard(name: K.StoryBoard.mainSB, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: self)) as! NewsDetailsViewController
     }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
