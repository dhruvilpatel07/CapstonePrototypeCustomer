//
//  MostRecentTableViewCell.swift
//  CapstonePrototypeCustomer
//
//  Created by Dhruvil Patel on 2020-04-09.
//  Copyright © 2020 Dhruvil Patel. All rights reserved.
//

import UIKit

class MostRecentTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNumberOfPeople: UILabel!
    @IBOutlet weak var lblPpl: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDateOfReservation: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
