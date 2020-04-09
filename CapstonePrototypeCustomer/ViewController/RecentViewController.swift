//
//  RecentViewController.swift
//  CapstonePrototypeCustomer
//
//  Created by Dhruvil Patel on 2020-04-09.
//  Copyright © 2020 Dhruvil Patel. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class RecentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblMostRecent: UITableView!
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let db = Firestore.firestore()
        db.collection("users").getDocuments { (snapshot, error) in
            if error == nil && snapshot != nil {
                self.mainDelegate.userList.removeAll()
                for person in snapshot!.documents {
                    let personObject = person.data()
                    let personName = personObject["name"]
                    let personEmail = personObject["email"]
                    let personID = personObject["uid"]
                    
                    let personM = UsersCollection(id: personID as? String, name: personName as? String, email: personEmail as? String)
                    self.mainDelegate.userList.append(personM)
                }//end of for loop
                self.tblMostRecent.reloadData()
            }//end of if
            
        }

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainDelegate.userList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MostRecentTableViewCell
       // let person: PersonModel
        //person = personList[indexPath.row]
        let row = indexPath.row
        //cell.firstName.text = person.firstName
        //cell.lastName.text = person.lastName
        cell.lblName.text = mainDelegate.userList[row].name
        cell.lblEmail.text = mainDelegate.userList[row].email
        cell.lblId.text = mainDelegate.userList[row].id
        
        return cell
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
