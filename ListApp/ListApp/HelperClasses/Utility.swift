//
//  Utility.swift
//  ListApp
//
//  Created by Satya on 06/11/20.
//  Copyright © 2020 Satya. All rights reserved.
//

import Foundation
import Network
import CoreFoundation
import NVActivityIndicatorView

class Utility: NSObject {
    static var sharedInstance = Utility()
    var vwActivity = UIView(frame: UIScreen.main.bounds)
    var isReachable = false
    
    func indicatorStartAnimating() {
        DispatchQueue.main.async {
            if let view = (UIApplication.shared.delegate as? AppDelegate)?.window {
                self.vwActivity.backgroundColor = UIColor.black.withAlphaComponent(0.5)
                view.addSubview(self.vwActivity)
                self.vwActivity.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint(item: self.vwActivity, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
                NSLayoutConstraint(item: self.vwActivity, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
                NSLayoutConstraint(item: self.vwActivity, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
                NSLayoutConstraint(item: self.vwActivity, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
                
                let activityIndicator = NVActivityIndicatorView(frame: CGRect.zero)
                activityIndicator.center = self.vwActivity.center
                self.vwActivity.addSubview(activityIndicator)
                activityIndicator.translatesAutoresizingMaskIntoConstraints = false
                
                NSLayoutConstraint(item: self.vwActivity, attribute: .centerX, relatedBy: .equal, toItem: activityIndicator, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
                NSLayoutConstraint(item: self.vwActivity, attribute: .centerY, relatedBy: .equal, toItem: activityIndicator, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
                NSLayoutConstraint(item: activityIndicator, attribute: .width, relatedBy: .equal, toItem:  nil, attribute: .notAnAttribute, multiplier: 1, constant: 100 / 320 * MAX_WIDTH).isActive = true
                NSLayoutConstraint(item: activityIndicator, attribute: .width, relatedBy: .equal, toItem: activityIndicator, attribute: .height, multiplier: 1, constant: 0).isActive = true
                
                activityIndicator.startAnimating()
            }
        }
       
        
    }
    func indicatorStopAnimating() {
        DispatchQueue.main.async {
            self.vwActivity.removeFromSuperview()
        }
        
    }
}
