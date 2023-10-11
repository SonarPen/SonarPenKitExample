/*
 * Copyright (c) 2015 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit

class CanvasViewController: UIViewController, UIPencilInteractionDelegate {
    @IBOutlet var canvasView: CanvasView!
    @IBOutlet var modeControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.canvasView.clearCanvas(animated: false)
        
        let interaction = UIPencilInteraction()
        interaction.delegate = self
        canvasView.addInteraction(interaction)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.restoreDebugMessages()
    }

    @IBAction func onModeControlChanged(_ control: UISegmentedControl) {
        _ = self.canvasView.setEraser(control.selectedSegmentIndex == 0 ? false : true)
    }
    
    // Shake to clear screen
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        self.canvasView.clearCanvas(animated: true)
    }
    
    func pencilInteractionDidTap(_ interaction: UIPencilInteraction) {
        let newValue = self.canvasView.toggleEraser()
        modeControl.selectedSegmentIndex = newValue ? 1 : 0
    }

}
