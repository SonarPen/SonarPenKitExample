//
//  DebugMessageViewController.swift
//  SonarPenKitDemo
//
//  Created by Water Lou on 29/3/2023.
//  Copyright © 2023 Apple. All rights reserved.
//

import UIKit
import SonarPenKit

class DebugMessageViewController: UIViewController {

    @IBOutlet weak var lastApplePressureLabel: UILabel!
    @IBOutlet weak var lastPressureLabel: UILabel!
    @IBOutlet weak var dbLabel: UILabel!
    @IBOutlet weak var minDBLabel: UILabel!
    @IBOutlet weak var maxDBLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!

    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if self.view.superview == nil {
                return
            }
            let debugInfo = getSonarDebugInfo()
            self.lastApplePressureLabel.text = "\(debugInfo.applePressure)"
            self.lastPressureLabel.text = "\(debugInfo.pressure)"
            self.dbLabel.text = "\(debugInfo.db)"
            self.minDBLabel.text = "\(debugInfo.minDB)"
            self.maxDBLabel.text = "\(debugInfo.maxDB)"
            self.stateLabel.text = "\(debugInfo.state)"
        }
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
        
    }
    
}
