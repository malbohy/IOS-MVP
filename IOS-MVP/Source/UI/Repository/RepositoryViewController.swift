//
//  RepositoryViewController.swift
//  MVC-IOS
//
//  Created by mohamed albohy on 11/30/19.
//  Copyright © 2019 Mohamed Elbohy. All rights reserved.
//

import Foundation

import UIKit
import SafariServices
import GithubKit

final class RepositoryViewController: SFSafariViewController {
    private(set) lazy var favoriteButtonItem: UIBarButtonItem = {
        let favorites = self.favoriteModel.favorites
        let title = favorites.contains(where: { $0.url == self.repository.url }) ? "Remove" : "Add"
        return UIBarButtonItem(title: title,
                               style: .plain,
                               target: self,
                               action: #selector(RepositoryViewController.favoriteButtonTap(_:)))
    }()
    
    let repository: Repository
    let favoriteModel: FavoriteModel
    
    init(repository: Repository, favoriteModel: FavoriteModel) {
        self.repository = repository
        self.favoriteModel = favoriteModel
        
        super.init(url: repository.url, configuration: .init())
        hidesBottomBarWhenPushed = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = favoriteButtonItem
    }
    
    @objc private func favoriteButtonTap(_ sender: UIBarButtonItem) {
        if favoriteModel.favorites.index(where: { $0.url == repository.url }) == nil {
            favoriteModel.addFavorite(repository)
            favoriteButtonItem.title = "Remove"
        } else {
            favoriteModel.removeFavorite(repository)
            favoriteButtonItem.title = "Add"
        }
    }
}
