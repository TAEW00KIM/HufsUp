//
//  ViewController.swift
//  ScreenRotation
//
//  Created by 김태우 on 2022/05/31.
//

import UIKit

class ScreenRotationViewController: UIViewController {

    @IBOutlet weak var screenRotation: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        determineScreenRotation()
    }
    
    func determineScreenRotation() {
        if UIDevice.current.orientation.isLandscape {
            print("landscape")
        } else {
            print("portrait")
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        determineScreenRotation()
        print("completed")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

