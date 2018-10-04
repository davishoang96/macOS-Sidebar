//
//  MasterViewController.swift
//  TestSidebar
//
//  Created by Viet on 29/9/18.
//  Copyright © 2018 Viet. All rights reserved.
//

import Cocoa

class MasterViewController: NSViewController {

    
    @IBAction func onClickButton(_ sender: NSButton) {
        let vc = RootViewController()
        vc.listitems.append("View 5")
        print(vc.listitems)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.

    }

    
    
}
