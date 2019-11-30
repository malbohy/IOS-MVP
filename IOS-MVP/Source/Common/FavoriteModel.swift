//
//  FavoriteModel.swift
//  MVC-IOS
//
//  Created by mohamed albohy on 11/30/17.
//  Copyright © 2017 Mohamed Elbohy. All rights reserved.
//

import Foundation

import GithubKit

protocol FavoriteModelDelegate: AnyObject {
    func favoriteDidChange()
}

extension FavoriteModelDelegate {
    func favoriteDidChange() {}
}

final class FavoriteModel {
    private(set) var favorites: [Repository] = [] {
        didSet {
            delegate?.favoriteDidChange()
        }
    }
    
    weak var delegate: FavoriteModelDelegate?
    
    func addFavorite(_ repository: Repository) {
        if favorites.lazy.index(where: { $0.url == repository.url }) != nil {
            return
        }
        favorites.append(repository)
    }
    
    func removeFavorite(_ repository: Repository) {
        guard let index = favorites.lazy.index(where: { $0.url == repository.url }) else {
            return
        }
        favorites.remove(at: index)
    }
}
