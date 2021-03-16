//
//  ProgressHud.swift
//  ApproveTimeTracking
//
//  Created by Ravi Gupta on 04/03/19.
//  Copyright © 2019 Project Objects. All rights reserved.
//

import Foundation
import UIKit
open class ProgressHud {
    class func showProgressHud(_ message: String, _ view: UIView){
        let loadNotification = MBProgressHUD.showAdded(to: view, animated: true)
        loadNotification.mode = MBProgressHUDMode.indeterminate
        loadNotification.label.text = message
    }
    
    class func hideProgressHud(_ view: UIView){
        MBProgressHUD.hide(for: view, animated: true)
    }
}
