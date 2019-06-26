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
    var userArray = [UserInformation]()
    var selectedUser: UserInformation?
    
    @IBOutlet weak var tableView: UITableView!
    
    
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
                    self.userArray.append(user)
                }
                print(self.userArray.count)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print("JSON Serialization error: ", error)
            }
        }.resume()
    }

}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as? UserCell else {
            return UITableViewCell()
        }
        
        
        let user = userArray[indexPath.row]
        cell.name.text = user.name.first.capitalized + " " + user.name.last.uppercased()
        cell.mail.text = user.email
        cell.thumbnail.image = UIImage(named: "icon.png")
        
        return cell
    }
    
    
}


extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedUser = userArray[indexPath.row]
    }
}

