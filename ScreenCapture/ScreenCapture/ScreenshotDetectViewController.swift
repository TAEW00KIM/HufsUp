//
//  ViewController.swift
//  ScreenCapture
//
//  Created by 김태우 on 2022/06/02.
//

import UIKit

class ScreenshotDetectViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myView = BorderAnimation()
        myView.frame = CGRect(x: 107, y: 288, width: 200, height: 320)
        view.addSubview(myView)
        
        NotificationCenter.default.addObserver(forName: UIApplication.userDidTakeScreenshotNotification, object: nil, queue: OperationQueue.main) { notification in
            print("done")
        }
    }
}

