//
//  ViewController.swift
//  TestController
//
//  Created by Denny Mathew on 22/02/17.
//  Copyright © 2017 Cabot Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dpView: DPView!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Configure Profile View */
//        dpView.setProfile(with: UIImage(named: "apple")!, and: .circle)
        dpView.setProfile(with: "Barney Stinson", and: .circle)
        dpView.setBorder(with: 3.0, and: .orange)
        dpView.setBackgroundColors([UIColor.gray.cgColor])
        
        
        dpView.addChannelView(at: .bottomRight, shape: .circle, image: UIImage(named: "apple")!)
        dpView.setChannelBorder(with: 2.0, and: .orange)
        
        dpView.addBadgeView(at: .topRight, shape: .circle, initialCount: 0)
        dpView.setBadgeBackground(with: [UIColor.yellow.cgColor])
        dpView.setBadgeBorder(with: 2.0, and: .orange)
        dpView.setBadgeCount(5)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

