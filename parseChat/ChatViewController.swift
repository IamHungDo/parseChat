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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> UITableViewCell  {
        return 5
    }

    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
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


