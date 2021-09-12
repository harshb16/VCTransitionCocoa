//
//  ModalAnimator.swift
//  ModalAnimator
//
//  Created by Harsh Bhatia on 12/09/21.
//

import Cocoa

private class BackgroundView: NSView {
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        wantsLayer = true
        layer?.backgroundColor = NSColor(calibratedWhite: 0, alpha: 0.5).cgColor
        alphaValue = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func mouseDown(with event: NSEvent) {
    }
}

class ModalAnimator: NSObject, NSViewControllerPresentationAnimator {
    private let backgroundView = BackgroundView(frame: .zero)
    private var centerYConstraint: NSLayoutConstraint!
    
    func animatePresentation(of viewController: NSViewController, from fromViewController: NSViewController) {
        let contentView = fromViewController.view
        backgroundView.frame = contentView.bounds
        backgroundView.autoresizingMask = [.width, .height]
        contentView.addSubview(backgroundView)
        
        let modalView = viewController.view
        modalView.translatesAutoresizingMaskIntoConstraints = false
        centerYConstraint = modalView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor, constant: -100)
        backgroundView.addSubview(modalView)
        NSLayoutConstraint.activate([
            modalView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            centerYConstraint,
            modalView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, constant: -100),
            modalView.heightAnchor.constraint(equalTo: backgroundView.heightAnchor, constant: -100)
        ])
        
        NSAnimationContext.runAnimationGroup({ _ in
            self.backgroundView.animator().alphaValue = 1
            self.centerYConstraint.animator().constant = 0
        })
    }
    
    func animateDismissal(of viewController: NSViewController, from fromViewController: NSViewController) {
        NSAnimationContext.runAnimationGroup({ _ in
            self.backgroundView.animator().alphaValue = 0
            self.centerYConstraint.animator().constant = -100
        }, completionHandler: {
            self.backgroundView.removeFromSuperview()
        })
    }
    
    
}
