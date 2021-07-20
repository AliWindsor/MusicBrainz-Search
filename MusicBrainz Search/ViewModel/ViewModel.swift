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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let mbid = artists?[indexPath.row].id{
            
            if let myURL = URL(string:"https://musicbrainz.org/artist/\(mbid)"){
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

