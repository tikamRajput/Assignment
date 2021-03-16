//
//  ErrorMessageClass.swift
//  ApproveTimeTracking
//
//  Created by Ravi Gupta on 04/03/19.
//  Copyright © 2019 Project Objects. All rights reserved.
//

import Foundation
import UIKit
open class ErrorMessageClass: NSObject {
    
    open class var sharedInstance: ErrorMessageClass {
        struct Singleton {
            static let instance: ErrorMessageClass = ErrorMessageClass()
        }
        return Singleton.instance
    }
    
    func errorMessage(_ viewController:UIViewController, _ message:String, _ title:String)
    {
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default,handler: nil))
        viewController.present(alertController, animated: true, completion: nil)
    }
    
   
    
}
