//
//  ContactsViewController.swift
//  4month3lesson
//
//  Created by Telegey Nurbekova on 20/02/24.
//

import UIKit

class ContactsViewController: UIViewController, UITableViewDataSource {
    
    private let contactsLabel = MakerView().makerLabel(text: "My Contacts", font: Fonts.medium.size(16) ,textColor: .init(hex: "#000000"), textAlignment: .center)
    
    private let tableView = UITableView()
    
    private var contacts: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(hex: "#F6F6F6")
        
        //login label
        view.addSubview(contactsLabel)
        NSLayoutConstraint.activate(
            [contactsLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 65),
             contactsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        
        //table view
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [tableView.topAnchor.constraint(equalTo: contactsLabel.bottomAnchor,constant: 15),
             tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
             tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
             tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0)
            ])
        
        tableView.dataSource = self
        
        setData()
        
    }
    
    private func setData(){
        contacts = [
            Contact(name: "Jane Cooper", phoneNumber: "(270) 555-0117", image: "contact1"),
            Contact(name: "Devon Lane", phoneNumber: "(308) 555-0121", image: "contact2"),
            Contact(name: "Darrell Steward", phoneNumber: "(684) 555-0102", image: "contact3"),
            Contact(name: "Devon Lane", phoneNumber: "(704) 555-0127", image: "contact4"),
            Contact(name: "Courtney Henry", phoneNumber: "(505) 555-0125", image: "contact5"),
            Contact(name: "Wade Warren", phoneNumber: "(225) 555-0118", image: "contact6"),
            Contact(name: "Bessie Cooper", phoneNumber: "(406) 555-0120", image: "contact7"),
            Contact(name: "Robert Fox", phoneNumber: "(480) 555-0103", image: "contact8"),
            Contact(name: "Jacob Jones", phoneNumber: "(702) 555-0122", image: "contact9"),
            Contact(name: "Jenny Wilson", phoneNumber: "(239) 555-0108", image: "contact10"),
            
        ]
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "")
        let contact = contacts[indexPath.row]
        
        cell.textLabel?.text = contact.name
        cell.imageView?.image = UIImage(named: contact.image)
        cell.detailTextLabel?.text = contact.phoneNumber
        cell.detailTextLabel?.textColor = .init(hex: "#8A8A8D")
        return cell
    }
    
}
