//
//  TaskViewController.swift
//  Create To Do List App
//
//  Created by Felipe Ignacio Zapata Riffo on 05-08-21.
//

import UIKit

class TaskViewController: UIViewController {
    @IBOutlet var labelTask: UILabel!
    var task:String?
//    init(task:String){
//        self.task = task
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
 
        navigationItem.rightBarButtonItem =  UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
        labelTask.text = task
 
    }
    
    @objc func deleteTask(){
//        let newCount = count - 1
//        UserDefaults().setValue(newCount, forKey: "count")
//        UserDefaults().setValue(nil, forKey: "task_\(currentPosition)")
        
    }
 

}
