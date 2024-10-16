//
//  FollowerListVC.swift
//  GithubFollowers
//
//  Created by FAYAZ on 16/10/24.
//

import UIKit

class FollowerListVC: UIViewController {
    var username:String!
    override func viewDidLoad() {
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        super.viewDidLoad()
        NetworkManager.shared.getFollowers(for: username, page: 1) { followers, errorMessage in
            guard let followers = followers else {
                self .presentGFAlertOnMainThread(title: "BAD Error", message: errorMessage!.rawValue, buttonTitle: "OK")
                return
            }
            print("Followers Count = \(followers.count)")
            print(followers)
        }

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
