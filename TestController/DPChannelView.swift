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
    var view: UIView!
    var imageView: UIImageView!
    
    var shape: ViewShape = .square {
        didSet {
            self.setChannelShape(shape)
        }
    }
    
    @IBInspectable var image: UIImage? {
        didSet {
            if (imageView != nil) {
                self.imageView?.image = image
            }
        }
    }
    
    //MARK:- Inits
    func setup() {
        view = loadViewFromNib()
        view.frame = bounds

        imageView = UIImageView(frame: view.frame)
//        imageView?.contentMode = .scaleAspectFit
//      view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        addSubview(view)

        view.addSubview(imageView!)
        
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "DPChannelView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        
        if (image != nil) {
            self.imageView?.image = image!
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    public func setChannelImage(_ image: UIImage) {
        
        imageView?.image = image
        
//        imageView.contentMode = .center
//        
//        if (imageView.bounds.size.width < image.size.width || imageView.bounds.size.height < image.size.height) {
//            imageView.contentMode = .scaleAspectFit
//        }
//        
//        imageView.contentMode = .scaleAspectFit
    }
    
    public func setChannelShape(_ shape: ViewShape) {
        
        if (shape == .circle) {
//
//            print("\(frame.size.width, frame.size.height)")
//            
//            if (frame.size.width != frame.size.height) {
//                frame.size.height = frame.size.width
//            }
//            
            layer.masksToBounds = true
            layer.cornerRadius = frame.size.width / 2.0
            layer.borderColor = UIColor.blue.cgColor
            layer.borderWidth = 2
            clipsToBounds = true
        }
    }
}
