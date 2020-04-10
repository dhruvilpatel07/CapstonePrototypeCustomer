//
//  SettingsViewController.swift
//  CapstonePrototypeCustomer
//
//  Created by Dhruvil Patel on 2020-04-09.
//  Copyright © 2020 Dhruvil Patel. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class SettingsViewController: UIViewController {

    @IBOutlet weak var lblUid: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblName: UILabel!
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblUid.text = mainDelegate.userId
        let db = Firestore.firestore()
        var name = ""
        var email = ""
        //.whereField("uid", isEqualTo: mainDelegate.userId)
        db.collection("users").whereField("uid", isEqualTo: mainDelegate.userId)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                        let data = document.data()
                        name = data["name"] as! String
                        email = data["email"] as! String
                        print("name: \(name)")
                        print("email: \(email)")
                        self.lblName.text = name
                        self.lblEmail.text = email
                        
                    }
                }
        }



        // Do any additional setup after loading the view.
    }
    

    @IBAction func logoutTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
