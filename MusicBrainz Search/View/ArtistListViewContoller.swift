//
//  ViewController.swift
//  MusicBrainz Song Search
//
//  Created by Alicia Windsor on 16/07/2021.
//

import UIKit
import WebKit

class ArtistListViewController: UIViewController{
 
    let tableView = UITableView()
    var safeArea: UILayoutGuide!
    var artists: [Artists]?
    
    let textField = UITextField()
    let searchController = UISearchController(searchResultsController: nil)
    var searchTerm = ""
    
    let button = UIButton(type: .system)
    
    var webView: WKWebView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide

        searchBar()
        searchButton()
        setUpTable()
        setUpNavigation()
  
    }
    
  func searchButton(){
        view.addSubview(button)
    
       // button.frame = CGRect(x: 20, y: 20, width: 50, height: 50)
        button.setTitle("Search", for: .normal)
    
        button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
    
        button.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        
        button.leftAnchor.constraint(equalTo: textField.rightAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
  }
    
    @objc func buttonAction(_ sender: UIButton!){
        print("Button Tapped")
    }
    
   func searchBar() {
        view.addSubview(textField)
        
        textField.placeholder = "Search"
        //textField.text = searchTerm
    
        textField.frame = CGRect(x: 10,y: 200,width: 300.0,height: 30.0)
        
        textField.borderStyle = UITextField.BorderStyle.line

        textField.translatesAutoresizingMaskIntoConstraints = false
        
        
        //Layout Configs
        textField.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        
        textField.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        //textField.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

 }
    
    func setUpTable(){
        view.addSubview(tableView)
        
        if searchTerm != ""{
            ArtistSearchModelData().loadArtists(searchTerm: searchTerm){ [weak self] (artists) in
                  self?.artists = artists
                  
                  DispatchQueue.main.async{
                    self?.tableView.reloadData()
                  }
            }
        }else{
            artists = nil
        }
        
        
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
        self.navigationItem.title = "Artists"
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.orange,
            NSAttributedString.Key.font: UIFont(name: "Arial-BoldMT", size: 30)
        ]
    }
    
    

}



