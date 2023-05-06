// Created by Alkın Çakıralar for MVVM-Music in 6.05.2023
// Using Swift 5.0
// You can contact me with a.cakiralar@gmail.com
// Follow me on https://medium.com/@acakiralar
// Send friend request on https://www.linkedin.com/in/alkincakiralar/ 

import Foundation

// MARK: - Main Object
struct SearchResponse: Codable {
    let resultCount: Int?
    let results: [SearchResult]?
}

// MARK: - Result Item
struct SearchResult: Codable {
    var trackId: Int?
    var trackName: String?
    var collectionName: String?
    var trackPrice: Double?
    var currency: String?
    var artworkUrl60: String?
}

// MARK: - Example Item
#if DEBUG
extension SearchResult {
    static var example: SearchResult {
        SearchResult(
            trackId: 157487434,
            trackName: "Home",
            collectionName: "Joe Satriani",
            trackPrice: 1.29,
            currency: "USD",
            artworkUrl60: "https://is5-ss1.mzstatic.com/image/thumb/Music113/v4/c4/c1/a2/c4c1a2ad-8777-20d8-a4ef-ecddabe0de1b/source/60x60bb.jpg"
        )
    }
}
#endif
