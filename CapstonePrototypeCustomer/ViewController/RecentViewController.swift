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
        tblMostRecent.reloadData()
        /*db.collection("users").getDocuments { (snapshot, error) in
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
            
        }*/
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings
        
        db.collection("reservations").whereField("uid", isEqualTo: mainDelegate.userId).getDocuments { (querySnapshot, err) in
            if let err = err {
                print("Error getting Document")
            }else{
                self.mainDelegate.reservationList.removeAll()
                for document in querySnapshot!.documents{
                    print("\(document.documentID) => \(document.data())")
                    let data = document.data()
                    let customerId = data["uid"]
                    let customerName = data["name"]
                    let customerPhoneNumber = data["phoneNumber"]
                    let numberOfCustmer = data["numberOfPeople"]
                    let bookingDate = Date.init()
                    
                    //let date = Date(timeIntervalSince1970: postTimestamp.seconds)
                    /*
                     let db = Firestore.firestore()
                     let settings = db.settings
                     settings.areTimestampsInSnapshotsEnabled = true
                     db.settings = settings
                     
                     With this change, timestamps stored in Cloud Firestore will be read back as Firebase Timestamp objects instead of as system Date objects. So you will also need to update code expecting a Date to instead expect a Timestamp. For example:
                     
                     // old:
                     let date: Date = documentSnapshot.get("created_at") as! Date
                     // new:
                     let timestamp: Timestamp = documentSnapshot.get("created_at") as! Timestamp
                     let date: Date = timestamp.dateValue()
                     */
                    //let timestamp: Timestamp = data["dateAndTime"] as! Timestamp
                    //let rDate : Date = timestamp.dateValue()
                    //let rDate : Date = timestamp.dateValue()
                    
                    
                    let reservationObject = ReservationCollection(id: customerId as! String, name: customerName as! String, phoneNumber: customerPhoneNumber as! String, numberOfPeople: numberOfCustmer as! Int, dateAndTime: bookingDate as! Date)
                    self.mainDelegate.reservationList.append(reservationObject)
                    
                }
                self.tblMostRecent.reloadData()
            }//end of if err
        }//end of query

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainDelegate.reservationList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MostRecentTableViewCell
       // let person: PersonModel
        //person = personList[indexPath.row]
        let row = indexPath.row
       // cell.lblName.text = mainDelegate.userList[row].name
        //cell.lblEmail.text = mainDelegate.userList[row].email
        //cell.lblId.text = mainDelegate.userList[row].id
        cell.lblName.text = mainDelegate.reservationList[row].name
        let formatter = DateFormatter()
       // formatter.calendar = datePicker.calendar
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        let dateString = formatter.string(from:mainDelegate.reservationList[row].dateAndTime!)
        cell.lblDateOfReservation.text = dateString
        cell.lblPhoneNumber.text = mainDelegate.reservationList[row].phoneNumber
        cell.lblNumberOfPeople.text = String(format: "%.0d", mainDelegate.reservationList[row].numberOfPeople!)
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let Modify = UITableViewRowAction(style: .normal, title: "Modify") { (action, index) in
            print("Modify button tapped")
        }
        Modify.backgroundColor = .orange
        
        let more = UITableViewRowAction(style: .normal, title: "More") { (action, index) in
            print("More button tapped")
        }
        more.backgroundColor = .green
        
        let delete = UITableViewRowAction(style: .normal, title: "Delete") { (action, index) in
            print("Delete button tapped")
        }
        delete.backgroundColor = .red
        
        return [Modify,more,delete]
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
