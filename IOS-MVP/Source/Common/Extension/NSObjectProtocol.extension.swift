//
//  NSObjectProtocol.extension.swift
//  MVC-IOS
//
//  Created by mohamed albohy on 11/30/17.
//  Copyright © 2017 Mohamed Elbohy. All rights reserved.
//

import Foundation

extension NSObjectProtocol {
    static var className: String {
        return String(describing: self)
    }
}
