//
//  DetailVC.swift
//  StateRestoration
//
//  Created by Ish on 6/11/18.
//  Copyright © 2018 Illuminated Bits LLC. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
   
    var date:Date?
    var keyboardOrigin:CGFloat = 1000000{
        didSet{
            self.calculatePosition()
        }
    }
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var textView: UITextView!
    override var preferredStatusBarStyle: UIStatusBarStyle {return .lightContent}
    let formatter = DateFormatter()

    //Save Data
    override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
        // Save the filename so that we can load it later
        if let date = date{
            coder.encode(formatter.string(from: date), forKey: "filename")
        }
    }
    //Restore Data
    override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
        if let identifier = coder.decodeObject(forKey: "filename") as? String, let date = formatter.date(from: identifier){
            self.date = date
            self.title = formatter.string(from: date)
            let text =  UserDefaults.standard.string(forKey: formatter.string(from: date))
            textView.text = text
            if textView.text.count == 0{
                self.textView.becomeFirstResponder()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.backgroundColor = .clear
        self.navigationController?.navigationBar.tintColor = .brightTurquoise
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,NSAttributedString.Key.font: UIFont.systemFont(ofSize: 36, weight: .bold)
           ]
        let color =  UIColor.brightTurquoise
        formatter.timeStyle = .none
        formatter.dateStyle = .medium
        textView.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        textView.tintColor = .brightTurquoise
        textView.layer.borderWidth = 2.0
        textView.layer.cornerRadius = 4.0
        textView.layer.borderColor = color.cgColor
        textView.backgroundColor = color.withAlphaComponent(0.06)
        if let date = date {
            self.title = formatter.string(from: date)
            let text =  UserDefaults.standard.string(forKey: formatter.string(from: date))
            textView.text = text
        }
        if textView.text.count == 0{
            self.textView.becomeFirstResponder()
        }
        NotificationCenter.default.addObserver(self,
                           selector: #selector(keyboardWillChangeFrame(_:)),
                           name: UIResponder.keyboardWillChangeFrameNotification,
                           object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(saveData),
                                               name: UIApplication.willResignActiveNotification,
                                               object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @objc func saveData(){
        if let date = self.date{
        UserDefaults.standard.set(textView.text, forKey: formatter.string(from: date))
        }
    }
    
    func calculatePosition(){
        
        DispatchQueue.main.async {
            let bottom =  (self.view.frame.origin.y + self.view.frame.size.height)
            let delta = bottom  - self.keyboardOrigin
            if delta > 0{
                self.bottomConstraint.constant = delta //+ 32
                self.view.layoutIfNeeded()
            }
            else{
                self.bottomConstraint.constant = 32
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func keyboardWillChangeFrame(_ notification:Notification){
        if let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue{
            let newFrame =   self.view.convert(keyboardFrame, from: self.view.window)
            keyboardOrigin = newFrame.origin.y
        }
    }
    
    @objc func keyboardWillHide(_ notification:Notification){
        if let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue{
            let newFrame =   self.view.convert(keyboardFrame, from: view.window)
            self.keyboardOrigin = newFrame.origin.y
        }
        self.bottomConstraint.constant = 32
        
    }
 
    @IBAction func dismissPressed(_ sender: Any) {
        if date != nil {
            self.saveData()
        }
        self.navigationController?.popViewController(animated: true)
    }
}
