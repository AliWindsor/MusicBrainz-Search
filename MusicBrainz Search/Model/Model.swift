//
//  Model.swift
//  MusicBrainz Song Search
//
//  Created by Alicia Windsor on 16/07/2021.
//

import Foundation

//http://musicbrainz.org/ws/2/artist/?query=artist:(SEARCHTERM)&fmt=json

struct ArtistResponse: Codable{
    let artists : [Artists]
}

struct Artists: Codable{
    let id: String?
    let type: String?
    let name: String?
    let country: String?
    let disambiguation: String?
}

