// Created by Alkın Çakıralar for MVVM-Music in 6.05.2023
// Using Swift 5.0
// You can contact me with a.cakiralar@gmail.com
// Follow me on https://medium.com/@acakiralar
// Send friend request on https://www.linkedin.com/in/alkincakiralar/ 

import Foundation

struct SearchResultViewModel {
    let model: SearchResult
    
    var trackName: String {
        model.trackName ?? ""
    }
    
    var imgUrl: URL? {
        URL(string: model.artworkUrl60 ?? "")
    }
    
    var fullPrice: String {
        guard let gPrice = model.trackPrice, let gCurrency = model.currency else {
            return "N/A"
        }
        
        return gPrice.formatted(.currency(code: gCurrency))
    }
}
