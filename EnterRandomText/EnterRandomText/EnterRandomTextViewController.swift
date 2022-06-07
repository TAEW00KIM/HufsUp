//
//  ViewController.swift
//  EnterRandomText
//
//  Created by 김태우 on 2022/06/05.
//

import UIKit

class EnterRandomTextViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var randomTextView: UITextView!
    @IBOutlet weak var inputTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.inputTextField.delegate = self
        self.view.backgroundColor = .black
        
        textFieldShouldReturn(inputTextField)
        setTextField()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 5) {
            self.randomTextView.alpha = 0.0
        }
    }

    func randomText() -> String {
        var x = ""
        for _ in 0..<10 {
            let string = String(format: "%c", Int.random(in: 97..<123)) as String
            x += string
        }
        
        return x
    }
    
    func setTextField() {
        randomTextView.text = randomText()
        randomTextView.font = UIFont.systemFont(ofSize: 40)
        randomTextView.backgroundColor = .black
        randomTextView.textColor = UIColor(displayP3Red: 173/255, green: 79/255, blue: 224/255, alpha: 1)
        randomTextView.textAlignment = .center
        randomTextView.refreshControl?.contentVerticalAlignment = .center
        
        inputTextField.font = UIFont.systemFont(ofSize: 40)
        inputTextField.backgroundColor = .black
        inputTextField.textColor = UIColor(displayP3Red: 173/255, green: 79/255, blue: 224/255, alpha: 1)
        inputTextField.contentVerticalAlignment = .center
        inputTextField.textAlignment = .center
        inputTextField.layer.borderWidth = 5
        inputTextField.layer.borderColor = UIColor(displayP3Red: 173/255, green: 79/255, blue: 224/255, alpha: 1).cgColor
        inputTextField.layer.cornerRadius = 30
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text == randomTextView.text {
            inputTextField.becomeFirstResponder()
            print("passed")
        } else {
            inputTextField.resignFirstResponder()
            print("please try again")
        }
        
        return true
    }
}

