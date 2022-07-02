//
//  ViewController.swift
//  PhoneScreenOff
//
//  Created by 김태우 on 2022/06/29.
//

import UIKit

class PhoneScreenOffViewController: UIViewController {

    let myView = BorderAnimation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.willResignActiveNotification, object: nil)
        
        self.myView.frame = CGRect(x: 0, y: 0, width: 200, height: 320)
        self.myView.center = view.center
        view.addSubview(self.myView)
        upAnimation()
    }

    @objc func appMovedToBackground() {
        print("Complete!")
    }
    
    func upAnimation() {
        let offset = CGPoint(x: 0, y: self.view.frame.maxY)
        let x: CGFloat = 0, y: CGFloat = 0
        self.myView.transform = CGAffineTransform(translationX: offset.x + x, y: offset.y + y)
        self.myView.isHidden = false
        
        UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 0.47, initialSpringVelocity: 3, options: .curveEaseOut, animations: {
            self.myView.transform = .identity
            self.myView.alpha = 1
        })
    }
}

