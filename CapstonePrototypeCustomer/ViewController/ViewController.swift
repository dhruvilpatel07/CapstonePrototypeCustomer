//
//  ViewController.swift
//  CapstonePrototypeCustomer
//
//  Created by Dhruvil Patel on 2020-04-09.
//  Copyright © 2020 Dhruvil Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements(){

        Utilities.styleHollowButton(btnLogin)
        Utilities.styleHollowButton(btnSignUp)
        
        
    }

    @IBAction func btnTapped(_ sender: Any) {
        let today = Date()
        print(today)
        let modifiedDate = Calendar.current.date(byAdding: .hour, value: -2, to: today)!
        print(modifiedDate)
    }
    
}

