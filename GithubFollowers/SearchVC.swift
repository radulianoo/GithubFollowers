//
//  SearchVC.swift
//  GithubFollowers
//
//  Created by Octav Radulian on 14.05.2023.
//

import UIKit

class SearchVC: UIViewController {
    
    //starting with our design first we need to initialize our 3 objects
    let logoImageView = UIImageView()
    let usernameTextField = GFTextField()
    let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    var isUsernameEntered: Bool { return !usernameTextField.text!.isEmpty }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureTextField()
        configureCallToActionButton()
        createDismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //each time this view will appear we will hide the navbar
        navigationController?.isNavigationBarHidden = true
    }
    
    func createDismissKeyboardTapGesture() {
        //when we have the keyboard out (keyboard is first responder) in order to dismiss it
        //one tap on the screen will dismiss it, so the target for the end action is our VC
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    //push the followerListVC when the button is tapped
    @objc func pushFollowerListVC() {
        //safety check for empty text
        guard isUsernameEntered else {
            print("No username entered...")
            return
        }
        
        let followerListVC = FollowerListVC()
        followerListVC.username = usernameTextField.text
        followerListVC.title = usernameTextField.text
        navigationController?.pushViewController(followerListVC, animated: true)
    }
    
    //we need to configure our elements
    
    func configureLogoImageView() {
        //drag the image to the view
        view.addSubview(logoImageView)
        //prepare the constraints to be set by us
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        //add the image
        logoImageView.image = UIImage(named: "gh-logo")
        
        //add the constraints for our image
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    
    func configureTextField() {
        view.addSubview(usernameTextField)
        
        usernameTextField.returnKeyType = .go
        
        //set the delegate for our textField
        usernameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 50),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureCallToActionButton() {
        view.addSubview(callToActionButton)
        
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }

}

//MARK: - Conforming to UITextFieldDelegate

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}
