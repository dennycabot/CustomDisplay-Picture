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
//        dpView.profileImage = UIImage(named: "apple")
        dpView.profileName = "Barney Stinson"
        dpView.shape = .circle
        dpView.borderColor = .orange
        dpView.borderWidth = 3.0
        dpView.profileBackgroundColors = [.yellow]
        
        /* Configure Channel View */
        dpView.channelImage = UIImage(named: "apple")
        dpView.channelShape = .circle
        dpView.channelBorderColor = .orange
        dpView.channelBorderWidth = 2.0
        dpView.isChannelEnabled = true
        dpView.channelPosition = .bottomRight
        
        dpView.isBadgeEnabled = true
        dpView.badgePosition = .topRight
        dpView.badgeShape = .circle
        dpView.badgeCount = 3
        dpView.badgeBackgroundColors = [UIColor.yellow]
        dpView.badgeBorderWidth = 2.0
        dpView.badgeBorderColor = .orange
        
        
        //MARK:- TODO: Write Public Methods for All Configurations and Make Properties Private
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

