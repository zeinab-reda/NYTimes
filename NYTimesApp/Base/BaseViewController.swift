//
//  BaseViewController.swift
//  NYTimesApp
//
//  Created by Zeinab Reda on 30/01/2021.
//

import UIKit
import JGProgressHUD

class BaseViewController: UIViewController, BaseViewProtocol{
    
    let hud = JGProgressHUD()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hud.textLabel.text = "Loading"

    }
    
    //MARK:- Loading and alerts
    func showLoading() {
        hud.show(in: self.view)

    }
    
    func showAlert(title: String?, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    func showErrorAlert(error: String) {
        let alertController = UIAlertController(title: "error", message: error, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
        

    }
  
    func hideLoading() {
        hud.dismiss()
    }
    
    //MARK:- Handel Error

    
    func showBlockScreenWithRetry() {
        
    }
    
    func showScreenNoConnection() {
        
    }
}
