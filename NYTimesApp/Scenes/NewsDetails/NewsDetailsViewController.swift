//
//  NewsDetailsViewController.swift
//  NYTimesApp
//
//  Created by Zeinab Reda on 30/01/2021.
//

import UIKit

class NewsDetailsViewController: UIViewController {

    var newsDetails:NewsResult?
    override func viewDidLoad() {
        super.viewDidLoad()

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
