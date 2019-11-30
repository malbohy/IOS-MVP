//
//  UIKeyboardInfo.swift
//  MVC-IOS
//
//  Created by mohamed albohy on 11/30/17.
//  Copyright © 2017 Mohamed Elbohy. All rights reserved.
//

import Foundation
import NoticeObserveKit

struct UIKeyboardInfo: NoticeUserInfoDecodable {
    let frame: CGRect
    let animationDuration: TimeInterval
    let animationCurve: UIView.AnimationOptions
    
    init?(info: [AnyHashable : Any]) {
        guard
            let frame = (info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
            let duration = info[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval,
            let curve = info[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt
            else { return nil }
        self.frame = frame
        self.animationDuration = duration
        self.animationCurve = UIView.AnimationOptions(rawValue: curve)
    }
}

extension Notice.Names {
    static let keyboardWillHide = Notice.Name<UIKeyboardInfo>(UIResponder.keyboardWillHideNotification)
    static let keyboardWillShow = Notice.Name<UIKeyboardInfo>(UIResponder.keyboardWillShowNotification)
}
