//
//  ViewModel.swift
//  MusicBrainz Song Search
//
//  Created by Alicia Windsor on 16/07/2021.
//

import Foundation
import UIKit
import SafariServices

extension ArtistListViewController: UITableViewDataSource, UITableViewDelegate{
    
    @objc func buttonAction(_ sender: UIButton!){
        let unformattedSearchTerm = textField.text ?? ""
        searchTerm = unformattedSearchTerm.replacingOccurrences(of: " ", with: "_")

        setUpTable()
    }
    
    //MARK: Check the validity of the search term
    
    func searchTermValidity(){
        if searchTerm != ""{
            isSearchValid = true
            ArtistSearchModelData().loadArtists(searchTerm: searchTerm){ [weak self] (artists) in
                  self?.artists = artists
                  
                  DispatchQueue.main.async{
                    self?.tableView.reloadData()
                  }
            }
        }else{
           isSearchValid = false
        }
        
        //display alert if search term/url is invalid
        if !isSearchValid{
            print("alert")
            showAlert(withTitle: "No Results", withMessage: "Please try searching for a different artist.")
        }else{
            print("no alert")
        }
    }
    
    //MARK: UITableView Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let artistsCount = artists {
            return artistsCount.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.artist = artists![indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func showAlert(withTitle title: String, withMessage message:String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
            })
            alert.addAction(ok)
            DispatchQueue.main.async(execute: {
                self.present(alert, animated: true)
            })
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let mbid = artists?[indexPath.row].id{
            
            var urlString = "https://musicbrainz.org/artist/\(mbid)"
            
            if let myURL = URL(string: urlString){
                let config = SFSafariViewController.Configuration()
                config.entersReaderIfAvailable = true

                let vc = SFSafariViewController(url: myURL, configuration: config)
                present(vc, animated: true)
            }else{
               print("Invalid URL")
            }
            
        }else{
            print("Invalid mbid")
        }
    }
    
    
 
}

extension String {
    var isValidURL: Bool {
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) {
            // it is a link, if the match covers the whole string
            return match.range.length == self.utf16.count
        } else {
            return false
        }
    }
}
