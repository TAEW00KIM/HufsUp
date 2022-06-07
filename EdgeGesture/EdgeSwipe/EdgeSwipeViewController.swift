//
//  ViewController.swift
//  EdgeGesture
//
//  Created by 김태우 on 2022/06/04.
//

import UIKit

class EdgeSwipeViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var signImageView: UIImageView!
    
    let fadeAnimation: CABasicAnimation = CABasicAnimation(keyPath: "contents")
    var myView = UIView()
    let random = Int.random(in: 1..<3)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMyView()
        rightEdge()
    }

    func setMyView() {
        myView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        myView.backgroundColor = .black
        myView.layer.cornerRadius = 30
    }
    
    func rightEdge() {
        addRightBorder(andWidth: 6)
        rightEdgeTouch()
        signImageView.image = UIImage(systemName: "arrow.left")?.withTintColor(UIColor(displayP3Red: 173/255, green: 79/255, blue: 224/255, alpha: 1), renderingMode: .alwaysOriginal)
    }
    
    func rightEdgeTouch() {
        let rightEdgeGesture = UIScreenEdgePanGestureRecognizer.init(target: self, action: #selector(self.didPanningScreenRight(_:)))
        rightEdgeGesture.edges = .right
        rightEdgeGesture.delegate = self
        self.view.addGestureRecognizer(rightEdgeGesture)
    }

    func addRightBorder(andWidth borderWidth: CGFloat) {
        let border = BorderAnimation()
        border.autoresizingMask = [.flexibleHeight, .flexibleLeftMargin]
        border.frame = CGRect(x: myView.frame.size.width - borderWidth, y: 0, width: borderWidth, height: myView.frame.size.height)
        view.addSubview(border)
    }
    
    @objc func didPanningScreenRight(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        print("right edge swiped")
    }
}

extension UIImageView {
    func setImage(_ image: UIImage?, animated: Bool = true) {
        let duration = animated ? 0.3 : 0.0
        UIView.transition(with: self, duration: duration, options: .transitionCrossDissolve, animations: {
            self.image = image
        }, completion: nil)
    }
}
