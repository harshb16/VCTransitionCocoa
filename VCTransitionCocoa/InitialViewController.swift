//
//  InitialViewController.swift
//  InitialViewController
//
//  Created by Harsh Bhatia on 12/09/21.
//

import Cocoa

class InitialViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer?.backgroundColor = NSColor.systemGray.cgColor
    }
    
    @IBAction func presentModalVC(_ sender: NSButton) {
        let modalVC = ModalViewController()
        let modalAnimator = ModalAnimator()
        
        // alternatives
        // presentAsSheet(modalVC)
        // presentAsModalWindow(modalVC)
        
        present(modalVC, animator: modalAnimator)
    }
}
