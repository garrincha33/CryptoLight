//
//  ViewController.swift
//  CryptoLight
//
//  Created by Richard Price on 29/09/2018.
//  Copyright © 2018 twisted echo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    weak var testView: UIView!
    
    var regularConstraints: [NSLayoutConstraint] = []
    var compactConstraints: [NSLayoutConstraint] = []
    
    override func loadView() {
        super.loadView()
        
        let testView = UIView(frame: .zero)
        testView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(testView)
        
        self.regularConstraints = [
            testView.widthAnchor.constraint(equalToConstant: 64),
            testView.widthAnchor.constraint(equalTo: testView.heightAnchor),
            testView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            testView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ]
        
        self.compactConstraints = [
            testView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            testView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            testView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            testView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
        ]
        
        self.activateCurrentConstraints()
        
        self.testView = testView
    }
    
    private func activateCurrentConstraints() {
        NSLayoutConstraint.deactivate(self.compactConstraints + self.regularConstraints)
        
        if self.traitCollection.verticalSizeClass == .regular {
            NSLayoutConstraint.activate(self.regularConstraints)
        }
        else {
            NSLayoutConstraint.activate(self.compactConstraints)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.testView.backgroundColor = .red
    }
    
    // MARK: - rotation support
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .allButUpsideDown
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }
    
    // MARK: - trait collections
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        self.activateCurrentConstraints()
    }
}

