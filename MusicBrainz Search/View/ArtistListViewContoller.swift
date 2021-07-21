//
//  ViewController.swift
//  MusicBrainz Song Search
//
//  Created by Alicia Windsor on 16/07/2021.
//

import UIKit
import WebKit

public var isSearchValid:Bool = true

class ArtistListViewController: UIViewController{
    
    let tableView = UITableView()
    var safeArea: UILayoutGuide!
    var artists: [Artists]?
    
    let textField = UITextField()
    let searchController = UISearchController(searchResultsController: nil)
    var searchTerm = ""

    let button = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        safeArea = view.layoutMarginsGuide

        searchBar()
        searchButton()
        setUpNavigation()
        
        let textpaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.textField.frame.height))
        textField.leftView = textpaddingView
        textField.leftViewMode = UITextField.ViewMode.always
        
     
    }

    
  func searchButton(){
        view.addSubview(button)
    
        //button.setTitle("Search", for: .normal)
       // button.setTitleColor(.white, for: .normal)
    
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .white
    
        button.backgroundColor = .purple

        button.layer.cornerRadius = 15.0

        button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
    
        button.translatesAutoresizingMaskIntoConstraints = false
    
        //Layout Configs
        button.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        button.leftAnchor.constraint(equalTo: textField.rightAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true

  }
    
   func searchBar() {
        view.addSubview(textField)
    
        textField.placeholder = "Enter a name..."
    
        textField.textColor = .purple
    
        textField.layer.cornerRadius = 15.0
        textField.layer.borderWidth = 2.0
        textField.layer.borderColor = UIColor.purple.cgColor
  
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        //Layout Configs
        textField.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        textField.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 30).isActive = true
   }
    
    func setUpTable(){
        view.addSubview(tableView)
        
        searchTermValidity()
        
        //populate with data
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        
        //turn off autoresizing
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        //Layout Configs
        tableView.topAnchor.constraint(equalTo: textField.bottomAnchor).isActive = true
        
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
       
    }
  
    func setUpNavigation(){
        self.navigationItem.title = "Search for Artists"
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.orange,
            NSAttributedString.Key.font: UIFont(name: "Arial-BoldMT", size: 30)
        ]
    }

}



