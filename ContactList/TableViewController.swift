//
//  ViewController.swift
//  ContactList
//
//  Created by Can on 25.06.2019.
//  Copyright © 2019 layso. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

    var requestUrl = "https://randomuser.me/api/?seed=yilmaz&results=50"
    var getMethod = "GET"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GetUserData()
    }
    
    
    func GetUserData() {
        var request = URLRequest(url: URL(string: requestUrl)!)
        request.httpMethod = getMethod
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            do {
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(RandomUser.self, from: data!)
                for user in responseModel.results {
                    print(user.name.title.capitalized + " " + user.name.first.capitalized + " " + user.name.last.uppercased())
                    print(user.email)
                    print(user.location.street + " - " + user.location.city)
                    print()
                }
            } catch let error {
                print("JSON Serialization error: ", error)
            }
        }.resume()
    }

}

