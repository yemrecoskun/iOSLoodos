//
//  AlertView.swift
//  iOSLoodos
//
//  Created by Yunus Emre Coskun on 30.09.2022.
//

import Foundation
import UIKit

public class AlertView {
    public static func goToAlert(title : String?, message: String?, cancelButtonTitle: String? = nil, cancelButtonAction: (() -> Void)? = nil, buttonTitle: String? = nil, buttonAction: (() -> Void)? = nil) -> UIAlertController {
        let alert = UIAlertController(title: title ?? "", message: message ?? "", preferredStyle: .alert)
        if let cancelButtonTitle = cancelButtonTitle {
            alert.addAction(UIAlertAction(title: cancelButtonTitle, style: .cancel, handler: { _ in
                    cancelButtonAction?()
                }))
        }
        if let buttonTitle = buttonTitle {
            alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: { _ in
                buttonAction?()
            }))
        }
        return alert
    }
}
