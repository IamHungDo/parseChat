//
//  ViewController.swift
//  parseChat
//
//  Created by Hung Do on 2/22/17.
//  Copyright © 2017 Hung Do. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    
    @IBAction func loginButton(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Chat") as! ChatViewController

        self.present(nextViewController, animated:true, completion:nil)
    }
    
    @IBAction func signUpButton(_ sender: Any) {
    }

    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

