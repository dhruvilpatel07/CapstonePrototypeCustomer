//
//  UsersCollection.swift
//  CapstonePrototypeCustomer
//
//  Created by Dhruvil Patel on 2020-04-09.
//  Copyright © 2020 Dhruvil Patel. All rights reserved.
//

import UIKit

class UsersCollection: NSObject {
    
    var id: String?
    var name: String?
    var email: String?
    
    init(id:String?, name:String?, email:String?) {
        self.id = id
        self.name = name
        self.email = email
    }

}
