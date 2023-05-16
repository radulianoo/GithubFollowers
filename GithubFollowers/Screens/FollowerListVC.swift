//
//  FollowerListVC.swift
//  GithubFollowers
//
//  Created by Octav Radulian on 15.05.2023.
//

import UIKit

class FollowerListVC: UIViewController {

    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        //we need to unhide the navigationBarItem
        navigationController?.isNavigationBarHidden = false
        //and make the title as a large title
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    

}
