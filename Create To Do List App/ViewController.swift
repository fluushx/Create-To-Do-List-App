//
//  ViewController.swift
//  Create To Do List App
//
//  Created by Felipe Ignacio Zapata Riffo on 05-08-21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    var tasks = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Task"
        tableView.delegate = self
        tableView.dataSource = self
        //Setup
        if !UserDefaults().bool(forKey: "setup"){
            UserDefaults().set(true,forKey:"setup")
            UserDefaults().set(0,forKey:"count")
        }
        tableView.reloadData()
        updateTask()
        //get all current saved task
        
    }
    
    func updateTask (){
        tasks.removeAll()
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        for x in 0..<count{
            if let task = UserDefaults().value(forKey: "task_\(x+1)") as? String{
                tasks.append(task)
            }
        }
        tableView.reloadData()
    }
    @IBAction func didTapAddButton (){
        let vc = storyboard?.instantiateViewController(identifier: "Entry") as! EntryViewController
        vc.title = "New Task"
        vc.update = {
            DispatchQueue.main.async {
                self.updateTask()
                 
            }
           
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "Task") as! TaskViewController
        vc.title = "Delete Task"
        vc.task = tasks[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
    
}

 
