//
//  LoadingView.swift
//  iOSLoodos
//
//  Created by Yunus Emre Coskun on 30.09.2022.
//

import UIKit

public class Loading{

var overlayView = UIView()
var activityIndicator = UIActivityIndicatorView()
    
    public func show(view: UIView) {
        DispatchQueue.main.async {
            self.overlayView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
            self.overlayView.center = view.center
            self.overlayView.clipsToBounds = true
            self.overlayView.layer.cornerRadius = 10

            self.activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            self.activityIndicator.style = UIActivityIndicatorView.Style.large
            self.activityIndicator.center = CGPoint(x: self.overlayView.bounds.width / 2, y: self.overlayView.bounds.height / 2)

            self.overlayView.addSubview(self.activityIndicator)
            view.addSubview(self.overlayView)

            self.activityIndicator.startAnimating()
        }
    }

    public func hide() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.overlayView.removeFromSuperview()
        }
    }
}
