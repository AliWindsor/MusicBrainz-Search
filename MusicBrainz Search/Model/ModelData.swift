//
//  ModelData.swift
//  MusicBrainz Song Search
//
//  Created by Alicia Windsor on 17/07/2021.
//

import Foundation

class ArtistSearchModelData{
    var artists = [Artists]()

    public func loadArtists(searchTerm: String, completionHandler: @escaping([Artists]) -> Void){
        
        var url: URL
        
        if let unwrappedURL = URL(string: "https://musicbrainz.org/ws/2/artist/?query=artist:\(searchTerm)"){
            isSearchValid = true
            url = unwrappedURL
        }else {
            print("URL is invalid")
            isSearchValid = false
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "ACCEPT")
        
        let dataTask = URLSession.shared.dataTask(with: request){ data, response, error in
           if let data = data {
                if let artistResponse = try? JSONDecoder().decode(ArtistResponse.self, from: data){
                    completionHandler(artistResponse.artists ?? [])
                }
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else{
                print("Error with response: \(response)")
                return
            }
            
            if let error = error {
                print("Error Thrown : \(error)")
                return
            }
        }

        dataTask.resume()
    }
}
