Artist Search Using MusicBrainz API

This is an application built using MusicBrainz API.

Features:
    •    User to types a keyword into the search bar.
    •    API returns a json file of artists who's name which matches the keyword.
    •    Data is displayed as a UITableView.
    •    User selects any item from the list and a webkit page is loaded with detailed information about the artist.

I have attempted to implement the following:
    •    Programatic UI with UIKit.
    •    MVVM architecture.
    •    RESTful call to MusicBrainz API


Frameworks/Libraries Used:
    •    UIKit
    •    SFSafariViewController
    •    Codable
    •    URLRequest
    •    URLSession
    •    JSONDecoder
    
Known Issues:
Currently having a few issues with the alert appearing everytime the tableview is reloaded, as opposed to appearing only when the table view is nil. Working on a fix.

Future Work:
In the future I would like to attempt implementing the SearchBar and Search Button as part of a UIStackView to allow for better spacing between the two elements.

I could also attempt the have search bar centered in the view before the table view is loaded in.

If you are interested in a similar project using SwiftUI, I have one on my profile which uses LastFM's API. 
