//
//  ApiSession.extension.swift
//  MVC-IOS
//
//  Created by mohamed albohy on 11/30/17.
//  Copyright © 2017 Mohamed Elbohy. All rights reserved.
//

import GithubKit

extension ApiSession {
    static let shared: ApiSession = {
        let token = "fd53c92a7fd66510cc9f3c172cfb0044f7fdc78f" // <- Your Github Personal Access Token
        return ApiSession(injectToken: { InjectableToken(token: token) })
    }()
}
