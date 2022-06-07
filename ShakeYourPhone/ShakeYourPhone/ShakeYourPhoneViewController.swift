//
//  ViewController.swift
//  PhoneInclination
//
//  Created by 김태우 on 2022/06/04.
//

import UIKit
import CoreMotion

class ShakeYourPhoneViewController: UIViewController {
    
    @IBOutlet weak var phoneVibrate: UIView!
    let motion = CMMotionManager()
    var timer = Timer()
    var GyroVar = 0
    var gyroData: CMGyroData?
    var realTime = Timer()
    var timeTrigger = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _repeat()
        startGyros()
    }
    
    func startGyros() {
        if motion.isGyroAvailable {
            self.motion.gyroUpdateInterval = 1.0 / 60.0
            self.motion.startGyroUpdates()
            
            self.timer = Timer(fire: Date(), interval: (1.0 / 60.0), repeats: true, block: { (timer) in
                if let data = self.motion.gyroData {
                    let x = data.rotationRate.x
                    let y = data.rotationRate.y
                    let z = data.rotationRate.z
                    if (x >= 0.8 && z >= 0.8 && y >= 0.8) {
                        print("complete")
                        self.stopGyros()
                        self.stopRepeat()
                    }
                }
            })
            
            RunLoop.current.add(self.timer, forMode: RunLoop.Mode.default)
        }
    }
    
    func stopGyros() {
        print("stop")
        if self.timer != nil {
            self.timer.invalidate()
            self.motion.stopGyroUpdates()
        }
    }
    
    func shake(view: UIView, for duration: TimeInterval = 0.5, withTranslation translation: CGFloat = 10) {
        let propertyAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 0.3) {
            view.transform = CGAffineTransform(translationX: translation, y: 0)
        }
        
        propertyAnimator.addAnimations( {
            view.transform = CGAffineTransform(translationX: 0, y: 0)
        }, delayFactor: 0.2)
        
        propertyAnimator.startAnimation()
    }

    func _repeat() {
        if (timeTrigger) {
            checkTimeTrigger()
        }
    }
    
    func checkTimeTrigger() {
        realTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        timeTrigger = false
    }
    
    @objc func updateCounter() {
        shake(view: phoneVibrate)
    }
    
    func stopRepeat() {
        timeTrigger = true
        realTime.invalidate()
    }
}
