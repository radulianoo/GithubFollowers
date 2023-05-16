//
//  UIViewController+Ext.swift
//  GithubFollowers
//
//  Created by Octav Radulian on 15.05.2023.
//

import UIKit

//we use this extension because this alertVC we want to use it on each VC in our app
//we can make a subclass but this is valid only for a specific context

extension UIViewController {
    
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(alertTitle: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
}
