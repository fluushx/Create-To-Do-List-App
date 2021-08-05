//
//  EntryViewController.swift
//  Create To Do List App
//
//  Created by Felipe Ignacio Zapata Riffo on 05-08-21.
//

import UIKit

class EntryViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet var textField: UITextField!
    var update: (()-> Void?)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem =  UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        saveTask()
    }

    @objc func saveTask(){
        guard let text = textField.text, !text.isEmpty else {
            return
        }
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        let newcount = count + 1
        UserDefaults().setValue(newcount, forKey: "count")
        
        UserDefaults().setValue(text, forKey: "task_\(newcount)")
        update?()
        navigationController?.popViewController(animated: true)
    }
}
