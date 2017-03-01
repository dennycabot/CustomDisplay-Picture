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
    var shape: ViewShape = .square
    var profileImage: UIImage?
    var profileName: String = ""
    var font: UIFont?
    var textColor: UIColor?
    var borderWidth: CGFloat = 0
    var borderColor: UIColor = .clear
    var profileBackgroundColors: [UIColor] = [.white]
    
    
    /* Attributes of Badge View */
    var isBadgeEnabled = false
    var badgeShape: ViewShape = .square
    var badgeImage: UIImage?
    var badgeCount: Int = 0
    var badgeTextColor: UIColor?
    var badgeBackgroundColors: [UIColor] = [.white]
    var badgeBorderWidth: CGFloat = 0
    var badgeBorderColor: UIColor = .clear
    var badgePosition: ViewPosition = .topRight
    var badgeSizeScale: CGFloat = 0.25
    
    
    /* Attributes of Channel View */
    var isChannelEnabled = true
    var channelShape: ViewShape = .square
    var channelImage: UIImage?
    var channelBorderWidth: CGFloat = 0
    var channelBorderColor: UIColor = .clear
    var channelPosition: ViewPosition = .bottomRight
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
        
        addSubview(imageView!)
        
        /* Setup Badge View */
        if isBadgeEnabled {
            badgeView = createBadgeView()
            addSubview(badgeView)
        }
        
        /* Setup Channel View */
        if isChannelEnabled {
            channelView = createChannelView()
            addSubview(channelView)
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
    
    private func createBadgeView() -> DPBadgeView {
        
        //Bound Points
        let width = frame.size.width * badgeSizeScale
        let xLeft = bounds.minX
        let xRight = bounds.maxX
        let yTop = bounds.minY
        let yBottom = bounds.maxY
        var x: CGFloat = 0.0
        var y: CGFloat = 0.0
        
        switch badgePosition {
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
        
        let badge = DPBadgeView(frame: CGRect(x: x, y: y, width: width, height: width))
        
        badge.count = badgeCount
        badge.shape = badgeShape
        badge.backgroundColors = badgeBackgroundColors
        badge.borderColor = badgeBorderColor
        badge.borderWidth = badgeBorderWidth
        badge.shape = badgeShape
        
        return badge
    }
    
    private func createChannelView() -> DPChannelView {
        
        //Bound Points
        let width = frame.size.width * channelSizeScale
        let xLeft = bounds.minX
        let xRight = bounds.maxX
        let yTop = bounds.minY
        let yBottom = bounds.maxY
        var x: CGFloat = 0.0
        var y: CGFloat = 0.0
        
        switch channelPosition {
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
        
        let channel = DPChannelView(frame: CGRect(x: x, y: y, width: width, height: width))
        
        channel.borderColor = channelBorderColor
        channel.borderWidth = channelBorderWidth
        channel.image = channelImage
        channel.shape = channelShape
        channel.backgroundColor = .white
        
        return channel
    }
    
    //MARK- Public Methods for Profile View
    init(with profileName: String, and shape: ViewShape) {
        self.init()
        self.profileName = profileName
        self.shape = shape
        setup()
    }
    
    init(with profileImage: UIImage, and shape: ViewShape) {
        self.init()
        self.profileImage = profileImage
        self.shape = shape
    }
    
    func addBorder(with width: CGFloat, and color: UIColor) {
        self.borderWidth = width
        self.borderColor = color
    }

    
    func setBadgeViewBackground(with colors: [UIColor]) {
        //Method for Adding Gradient Layer Here
    }
    
    func enableBadgeCount() {
        self.isBadgeEnabled = true
        //Show Badge
    }
    
    func disableBadgeCount() {
        self.isBadgeEnabled = false
        //Hide Badge
    }
    
    func addBadgeViewBorder(with width: CGFloat, and color: UIColor) {
        self.badgeView.borderWidth = width
        self.badgeView.borderColor = color
    }
    
    func setBadgeViewShape(_ shape: ViewShape) {
        badgeView.shape = shape
    }
    
}
