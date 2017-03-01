//
//  DPExtensions.swift
//  TestController
//
//  Created by Denny Mathew on 28/02/17.
//  Copyright © 2017 Cabot Solutions. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    class func imageWith(text: String, frame: CGRect, font: UIFont?, textColor: UIColor?, backgroundColors: [UIColor]?) -> UIImage {
        
        /* Create Label With Text */
        let label = UILabel(frame: frame)
        label.text = text.initials()
        label.textAlignment = .center
        label.font = label.font.withSize(200.0)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        let maximumLabelSize = CGSize(width: label.frame.size.width * 0.8, height: CGFloat.greatestFiniteMagnitude)
        let expectSize = label.sizeThatFits(maximumLabelSize)
        label.frame = CGRect(origin: CGPoint(x: label.frame.midX, y: label.frame.midY), size: CGSize(width: expectSize.width * 1.5, height: expectSize.height * 1.5))
        
        //MARK:- TODO: Handle SizeThatFits for cases with more than two letters
        
        if font != nil {
            label.font = font
        }
        
        if textColor != nil {
            label.textColor = textColor
        }
        
        if backgroundColors != nil {
            label.backgroundColor = backgroundColors?.first //Edit to Add Gradient Layer
        }
        
        /* Create Image with Label */
        UIGraphicsBeginImageContextWithOptions(label.bounds.size, false, 0.0)
        label.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

extension String {
    
    /* Create Initials from Full Name */
    func initials() -> String {
        
        var profileNameArr = self.components(separatedBy: " ")
        var initials = ""
        
        if profileNameArr.count > 1 {
            profileNameArr = [profileNameArr.first!, profileNameArr.last!]
        }
        
        for name in profileNameArr {
            initials = initials + String(name.characters.first!)
        }
        
        return initials
    }
}
