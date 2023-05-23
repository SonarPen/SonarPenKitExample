//
//  ViewController.swift
//  SonarPenKitExample
//
//  Created by Water Lou on 22/5/2023.
//

import UIKit
import SonarPenKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        SonarPenKit.start(application: UIApplication.shared)

    }


}

