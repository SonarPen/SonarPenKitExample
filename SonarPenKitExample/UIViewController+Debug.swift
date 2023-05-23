//
//  UIViewController+Debug.swift
//  SonarPenKitDemo
//
//  Created by Water Lou on 29/3/2023.
//  Copyright © 2023 Apple. All rights reserved.
//

import UIKit

var debugMessageViewController: DebugMessageViewController?
var debugMessageIsOn: Bool = false

extension UIViewController {
    func toggleDebugMessages() {
        debugMessageIsOn = !debugMessageIsOn
        if debugMessageIsOn {
            self.showDebugMessages()
        }
        else {
            self.hideDebugMessages()
        }
    }
    
    func restoreDebugMessages() {
        if debugMessageIsOn {
            showDebugMessages()
        }
    }
    
    private func showDebugMessages() {
        if debugMessageViewController == nil {
            debugMessageViewController = self.storyboard?.instantiateViewController(withIdentifier: "debugMessageViewController") as? DebugMessageViewController
            let view = debugMessageViewController!.view!
            view.translatesAutoresizingMaskIntoConstraints = false
            let widthConstraint = NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200)
            let heightConstraint = NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 140)
            NSLayoutConstraint.activate([widthConstraint, heightConstraint])
        }
        guard let debugMessageViewController = debugMessageViewController else {
            fatalError()
        }
//        debugMessageViewController.view.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        debugMessageViewController.view.backgroundColor = UIColor(white: 0, alpha: 0.3)
        //self.addChild(debugMessageViewController)
        UIApplication.shared.keyWindow?.rootViewController?.view.addSubview(debugMessageViewController.view)
        debugMessageViewController.start()
//        UIApplication.shared.keyWindow?.addSubview(debugMessageViewController.view)
//        self.view.addSubview(debugMessageViewController.view)

    }
    
    private func hideDebugMessages() {
        guard let debugMessageViewController = debugMessageViewController else {
            return
        }
        if debugMessageViewController.view.superview != nil {
            debugMessageViewController.stop()
            debugMessageViewController.view.removeFromSuperview()
            //debugMessageViewController.removeFromParent()
        }
    }
}
