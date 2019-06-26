//
//  UserCell.swift
//  ContactList
//
//  Created by Can on 25.06.2019.
//  Copyright © 2019 layso. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var mail: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    
    
    
    func setUser(user: UserInformation, index: Int) {
        let picUrl = URL(string: user.picture.thumbnail)
        getImage(from: picUrl!)
        
        thumbnail.layer.borderWidth = 1
        thumbnail.layer.masksToBounds = false
        thumbnail.layer.borderColor = UIColor.black.cgColor
        thumbnail.layer.cornerRadius = thumbnail.frame.height/2
        thumbnail.clipsToBounds = true
        
        if (index%2 == 0) {
            backgroundColor = UIColor.lightGray
        }
        
        name.text = user.name.first.capitalized + " " + user.name.last.uppercased()
        mail.text = user.email
    }
    
    
    func getImage(from url: URL) {
        getData(from: url) {data, response, error in
            guard let data = data, error == nil else {return}
            DispatchQueue.main.async {
                self.thumbnail.image = UIImage(data: data)
            }
        }
    }
    
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
