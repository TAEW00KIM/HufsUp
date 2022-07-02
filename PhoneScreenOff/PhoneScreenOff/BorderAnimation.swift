//
//  BorderAnimation.swift
//  PhoneScreenOff
//
//  Created by 김태우 on 2022/06/29.
//

import UIKit

class BorderAnimation : UIView {
    
    /// allow gradient layer to resize automatically
    override class var layerClass: AnyClass { return CAGradientLayer.self }
    
    /// boilerplate UIView initializers
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 200, height: 320))
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    /// set up everything
    func commonInit() {

        let overlayView = UIView()
        overlayView.backgroundColor = .black
        overlayView.frame = bounds.insetBy(dx: 3, dy: 3)
        overlayView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        overlayView.layer.cornerRadius = 20
        overlayView.layer.borderWidth = 5
        self.addSubview(overlayView)
        
        let gradientLayer = self.layer as! CAGradientLayer
        gradientLayer.locations = [0, 0.45, 0.55, 1]
        gradientLayer.cornerRadius = 20
        gradientLayer.colors = [
            UIColor.white.cgColor,
            UIColor.purple.cgColor,
            UIColor.black.cgColor,
            UIColor.white.cgColor
        ]
        
        let startPointAnimation = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.startPoint))
        startPointAnimation.fromValue = CGPoint(x: 2, y: -1)
        startPointAnimation.toValue = CGPoint(x: 0, y: 1)
        
        let endPointAnimation = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.endPoint))
        endPointAnimation.fromValue = CGPoint(x: 1, y: 0)
        endPointAnimation.toValue = CGPoint(x: -1, y: 2)
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [startPointAnimation, endPointAnimation]
        animationGroup.duration = 2
        animationGroup.repeatCount = .infinity
        gradientLayer.add(animationGroup, forKey: nil)
        
    }
}
