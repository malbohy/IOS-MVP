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
        let token = "128fdaa7dcfca1c719fb3525d1a25f4d6ff5860a" // <- Your Github Personal Access Token
        return ApiSession(injectToken: { InjectableToken(token: token) })
    }()
}
