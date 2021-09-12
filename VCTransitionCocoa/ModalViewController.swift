//
//  ModalViewController.swift
//  ModalViewController
//
//  Created by Harsh Bhatia on 12/09/21.
//

import Cocoa

class ModalViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer?.backgroundColor = NSColor.systemTeal.cgColor
        view.layer?.cornerRadius = 5
    }
    
    @IBAction func dismissVC(_ sender: NSButton) {
        dismiss(self)
    }
}
