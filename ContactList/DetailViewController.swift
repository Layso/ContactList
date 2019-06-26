//
//  DetailViewController.swift
//  ContactList
//
//  Created by Can on 25.06.2019.
//  Copyright © 2019 layso. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var bigPicture: UIImageView!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var mail: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var street: UILabel!
    @IBOutlet weak var cell: UILabel!
    var user: UserInformation?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let user = user {
            bigPicture.image = UIImage(named: "icon.png")
            fullName.text = user.name.title.capitalized + " " + user.name.first.capitalized + " " + user.name.last.uppercased()
            mail.text = user.email
            phone.text = user.phone
            cell.text = user.cell
            street.text = user.location.street
            city.text = user.location.city
        }
    }
}
