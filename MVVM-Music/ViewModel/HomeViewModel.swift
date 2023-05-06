// Created by Alkın Çakıralar for MVVM-Music in 6.05.2023
// Using Swift 5.0
// You can contact me with a.cakiralar@gmail.com
// Follow me on https://medium.com/@acakiralar
// Send friend request on https://www.linkedin.com/in/alkincakiralar/

import Foundation

class HomeViewModel: ObservableObject {
    @Published var results = [SearchResult]()
    @Published var searchText: String = "" {
        didSet {
            isSearchEnabled = searchText.count > 2
        }
    }

    @Published var isSearchEnabled = false
    @Published var isLoading = false

    func performSearch() {
        isLoading = true

        let search = searchText.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        
        guard let gURL = URL(string: "https://itunes.apple.com/search?term=\(search)") else {
            isLoading = false
            return
        }
        
        Task { @MainActor in
            do {
                let (data, _) = try await URLSession.shared.data(from: gURL)
                
                let response = try JSONDecoder().decode(SearchResponse.self, from: data)
                
                isLoading = false
                results = response.results ?? []
            } catch {
                isLoading = false
                print("An error occured \(error)")
            }
        }
    }
}
