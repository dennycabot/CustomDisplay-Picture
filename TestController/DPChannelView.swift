//
//  DPChannelView.swift
//  CustomDPComponent
//
//  Created by Denny Mathew on 22/02/17.
//  Copyright © 2017 Cabot Solutions. All rights reserved.
//

import UIKit

@IBDesignable
class DPChannelView: UIView {

    //MARK:- Properties
    var imageView: UIImageView!
    var shape: ViewShape = .square
    var image: UIImage?
    var borderWidth: CGFloat = 0
    var borderColor: UIColor = .clear
    
    //MARK:- Inits
    func setup() {
        
        /* Setup View */
        contentMode = .scaleAspectFill
        
        /* Setup Image View */
        imageView = UIImageView(frame: bounds)
        print("\(imageView.frame), \(frame)")
        layer.masksToBounds = true
        clipsToBounds = true
        imageView?.contentMode = .scaleAspectFill
        
        if (image != nil) {
            imageView.image = image
        }
        
        if borderWidth != 0 {
            imageView.layer.borderWidth = borderWidth
            imageView.layer.borderColor = borderColor.cgColor
        }
        
        if (shape == .circle) {
            layer.cornerRadius = min(frame.size.width / 2.0, frame.size.height / 2.0)
        }

        addSubview(imageView!)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    //MARK:-  Public Methods
    
    public func setChannelImage(_ image: UIImage) {
        imageView?.image = image
        print(imageView.frame)
    }
    
    public func setChannelShape(_ shape: ViewShape) {
        
        if (shape == .circle) {
            layer.masksToBounds = true
            layer.cornerRadius = min(frame.size.width / 2.0, frame.size.height / 2.0)
            clipsToBounds = true
        }
    }
}
