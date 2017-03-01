//
//  DPBadgeView.swift
//  TestController
//
//  Created by jithin on 24/02/17.
//  Copyright © 2017 Cabot Solutions. All rights reserved.
//

import UIKit

class DPBadgeView: UIView {
    
    //MARK:- Properties
    private var countLabel: UILabel!
    var borderWidth: CGFloat = 0.0
    var borderColor: UIColor = UIColor.clear
    var shape: ViewShape = .square
    var count: Int = 0
    var font: UIFont?
    var textColor: UIColor = .black
    var backgroundColors: [UIColor] = [.white]
    
    //MARK:- Inits
    func setup() {
        
        /* Setup View */
        contentMode = .scaleAspectFill
        clipsToBounds = true
        contentMode = .scaleAspectFill
        backgroundColor = backgroundColors.first //Edit To Include Gradient Layer
        
        if borderWidth != 0 {
            layer.borderWidth = borderWidth
            layer.borderColor = borderColor.cgColor
        }
        
        if (shape == .circle) {
            layer.cornerRadius = min(frame.size.width / 2.0, frame.size.height / 2.0)
        }
        
        /* Setup Count Label */
        if countLabel != nil {
            countLabel.removeFromSuperview()
        }
        
        countLabel = UILabel(frame: bounds)
        countLabel.text = "\(count)"
        countLabel.textColor = textColor
        countLabel.font = countLabel.font.withSize(frame.width * 0.8)
        countLabel.adjustsFontSizeToFitWidth = true
        countLabel.numberOfLines = 1
        countLabel.lineBreakMode = .byWordWrapping
        countLabel.textAlignment = .center
        
        if font != nil {
            countLabel.font = font
        }
        
        addSubview(countLabel)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        setup()
    }
    
    override func draw(_ rect: CGRect) {
        setup()
    }
}
