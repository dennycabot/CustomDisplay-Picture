//
//  DPView.swift
//  TestController
//
//  Created by Denny Mathew on 27/02/17.
//  Copyright © 2017 Cabot Solutions. All rights reserved.
//

import UIKit

class DPView: UIView {
    
    //MARK:- Properties
    
    /* Outlets */
    private var imageView: UIImageView!
    private var badgeView: DPBadgeView!
    private var channelView: DPChannelView!

    /* Attributes of Profile Image View */
    private var shape: ViewShape = .square
    private var profileImage: UIImage?
    private var profileName: String = ""
    private var font: UIFont?
    private var textColor: UIColor?
    private var borderWidth: CGFloat = 0
    private var borderColor: UIColor = .clear
    private var profileBackgroundColors: [CGColor] = [UIColor.white.cgColor]
    
    var badgeSizeScale: CGFloat = 0.25
    var channelSizeScale: CGFloat = 0.25
    
    //MARK:- Inits
    private func setup() {
        
        /* Setup Profile View */
        imageView = UIImageView(frame: bounds)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        if profileImage != nil {
            imageView.image = profileImage
        }
            
        else if profileName != "" {
            imageView.image = UIImage.imageWith(text: profileName, frame: imageView.bounds, font: nil, textColor: .orange, backgroundColors: profileBackgroundColors)
        }
        
        if borderWidth != 0 {
            imageView.layer.borderWidth = borderWidth
            imageView.layer.borderColor = borderColor.cgColor
        }
        
        if (shape == .circle) {
            imageView.layer.cornerRadius = min(frame.size.width / 2.0, frame.size.height / 2.0)
        }

        addSubview(imageView)
        
        if badgeView != nil {
            bringSubview(toFront: badgeView)
        }
        
        if channelView != nil {
            bringSubview(toFront: channelView)
        }
    }

    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    internal required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    internal override func draw(_ rect: CGRect) {
        setup()
    }
    
    //MARK- Public Methods
    
    /* Public Methods for Profile View */
    func setProfile(with profileName: String, and shape: ViewShape) {
        self.profileName = profileName
        self.shape = shape
        setup()
    }
    
    func setProfile(with profileImage: UIImage, and shape: ViewShape) {
        self.profileImage = profileImage
        self.shape = shape
        setup()
    }
    
    
    func setImage(_ image: UIImage) {
        self.profileImage = image
    }
    
    func setName(_ name: String) {
        self.profileName = name
        imageView.image = UIImage.imageWith(text: name, frame: imageView.bounds, font: nil, textColor: nil, backgroundColors: [])
    }
    
    func setBorder(with width: CGFloat, and color: UIColor) {
        self.borderWidth = width
        self.borderColor = color
    }
    
    func setBackgroundColors(_ colors: [CGColor]) {
        //Gradient Layer Here

        self.profileBackgroundColors = colors
        imageView.image = UIImage.imageWith(text: self.profileName, frame: imageView.bounds, font: nil, textColor: nil, backgroundColors: colors)

    }

    /* Public Methods for Badge View */
    func addBadgeView(at position: ViewPosition, shape: ViewShape, initialCount: Int) {
        
        /* Remove Existing BadgeViews If Any */
        if badgeView != nil {
            badgeView.removeFromSuperview()
            badgeView = nil
        }
        
        //Bound Points
        let width = frame.size.width * badgeSizeScale
        let xLeft = bounds.minX
        let xRight = bounds.maxX
        let yTop = bounds.minY
        let yBottom = bounds.maxY
        var x: CGFloat = 0.0
        var y: CGFloat = 0.0
        
        switch position {
        case .bottomLeft:
            x = xLeft
            y = yBottom - width
            
        case .bottomRight:
            x = xRight - width
            y = yBottom - width
            
        case .topLeft:
            x = xLeft
            y = yTop
            
            
        case .topRight:
            x = xRight - width
            y = yTop
        }
        
        /* Create Channel View */
        badgeView = DPBadgeView(frame: CGRect(x: x, y: y, width: width, height: width))
        badgeView.shape = shape
        badgeView.count = initialCount
        addSubview(badgeView)
    }
    
    func setBadgeBackground(with colors: [CGColor]) {
        //Method for Adding Gradient Layer Here
        if badgeView != nil{
            if colors.count == 1{
                badgeView.backgroundColor = UIColor(cgColor: colors.first!)
            }else{
                badgeView.addGradientLayer(with: colors)
            }
        }
    }
    
    func setBadgeBorder(with width: CGFloat, and color: UIColor) {
        
        if badgeView != nil {
            self.badgeView.borderWidth = width
            self.badgeView.borderColor = color
        }
        
        else {
            fatalError("ChannelView is not Initialized!")
        }
    }
    
    func setBadgeCount(_ count: Int) {
        badgeView.count = count
    }
    
    /* Public Methods for Channel View */
    func addChannelView(at position: ViewPosition, shape: ViewShape, image: UIImage) {
        
        /* Remove Existing BadgeViews If Any */
        if channelView != nil {
            channelView.removeFromSuperview()
            channelView = nil
        }
        
        //Bound Points
        let width = frame.size.width * channelSizeScale
        let xLeft = bounds.minX
        let xRight = bounds.maxX
        let yTop = bounds.minY
        let yBottom = bounds.maxY
        var x: CGFloat = 0.0
        var y: CGFloat = 0.0
        
        switch position {
        case .bottomLeft:
            x = xLeft
            y = yBottom - width
            
        case .bottomRight:
            x = xRight - width
            y = yBottom - width
            
        case .topLeft:
            x = xLeft
            y = yTop
            
            
        case .topRight:
            x = xRight - width
            y = yTop
        }
        
        /* Create Channel View */
        channelView = DPChannelView(frame: CGRect(x: x, y: y, width: width, height: width))
        channelView.image = image
        channelView.shape = shape
        addSubview(channelView)
    }
    
    func setChannelBorder(with width: CGFloat, and color: UIColor) {
        
        if channelView != nil {
            self.channelView.borderWidth = width
            self.channelView.borderColor = color
        }
        
        else {
            fatalError("ChannelView is not Initialized!")
        }
    }
}
