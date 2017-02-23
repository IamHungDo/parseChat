//
//  ChatViewController.swift
//  parseChat
//
//  Created by Hung Do on 2/22/17.
//  Copyright © 2017 Hung Do. All rights reserved.
//

import UIKit
import Parse


class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageField: UITextField!
    
    var message = PFObject(className: "Message")
    
    @IBAction func sendButton(_ sender: Any) {
        if messageField.text != nil {
            message["text"] = messageField.text
            
            message.saveInBackground(block: { (success: Bool ,error: Error?) in
                if (success) {
                    print(self.message["text"])
                } else {
                    print(error!.localizedDescription)
                }
            })
            
            
        }
        messageField.text = ""
        tableView.reloadData()
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(ChatViewController.onTimer), userInfo: nil, repeats: true)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int  {
        return 10
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell", for: indexPath) as! ChatViewCell
        cell.messageLabel.text = message["text"] as! String?
        
        
        return cell
    }
    
    func onTimer() {
        
        let query = PFQuery(className:"Message")
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                if let objects = objects {
                    for object in objects {
                        print(object["text"])
                    }
                }
            } else {
                // Log details of the failure
                print("error")
            }
            query.order(byDescending: "Message")


        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}


