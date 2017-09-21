//
//  AboutViewController.swift
//  SolarSystem
//
//  Created by Roderic Campbell on 8/7/17.
//  Copyright © 2017 Roderic Campbell. All rights reserved.
//

import Foundation
import UIKit
import Mixpanel

class AboutViewController: UIViewController {
    
    @IBOutlet weak var bottomText: UITextView!
    @IBOutlet weak var topText: UITextView!
    @IBOutlet weak var topTextHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var bottomTextHeightConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        Mixpanel.sharedInstance()?.track("About View Loaded")
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func visitThumbworks(_ sender: Any) {
        Mixpanel.sharedInstance()?.track("Tap Thumbworks")
        if let url = URL(string: "http://thumbworks.io") {
            UIApplication.shared.open(url, options:[:] )
        }
    }
    
    @IBAction func seeOtherApps(_ sender: Any) {
        if let url = URL(string: "http://appstore.com/thumbworks") {
            UIApplication.shared.open(url, options:[:] )
        }
    }
    
    @IBAction func visitTwitter(_ sender: Any) {
        Mixpanel.sharedInstance()?.track("Tap Twitter")
        if let url = URL(string: "twitter://user?screen_name=thumbworksinc") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options:[:] )
                return
            }
        }
        if let url = URL(string: "http://twitter.com/thumbworksinc") {
            UIApplication.shared.open(url, options:[:] )
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        bottomTextHeightConstraint.constant = bottomText.contentSize.height
        bottomText.layoutIfNeeded()
        
        topTextHeightConstraint.constant = topText.contentSize.height
        topText.layoutIfNeeded()
    }
}
