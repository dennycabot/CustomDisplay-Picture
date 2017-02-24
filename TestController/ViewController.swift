//
//  ViewController.swift
//  TestController
//
//  Created by Denny Mathew on 22/02/17.
//  Copyright © 2017 Cabot Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var channelView: DPChannelView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        channelView.setChannelShape(.square)
        channelView.setChannelImage(UIImage(named: "veeram")!)
        
        print("Width: \(self.channelView.frame.size.width), Height: \(self.channelView.frame.size.height)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

