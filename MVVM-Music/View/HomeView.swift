// Created by Alkın Çakıralar for MVVM-Music in 6.05.2023
// Using Swift 5.0
// You can contact me with a.cakiralar@gmail.com
// Follow me on https://medium.com/@acakiralar
// Send friend request on https://www.linkedin.com/in/alkincakiralar/ 

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Search Text", text: $viewModel.searchText)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.words)
                    
                    if viewModel.isLoading {
                        ProgressView()
                            .padding(.horizontal)
                    }
                }
                .padding()
                
                Button {
                    viewModel.performSearch()
                } label: {
                    Text("SEARCH MUSIC")
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .opacity(!viewModel.isSearchEnabled ? 1.0 : 0.5)
                }
                .background(Color.accentColor)
                .cornerRadius(10)
                .disabled(!viewModel.isSearchEnabled)
                .padding()
                
                List {
                    ForEach(viewModel.results, id: \.trackId) {
                        let viewModel = SearchResultViewModel(model: $0)
                        SearchResultRow(resultVM: viewModel)
                    }
                }
                .listStyle(.inset)
            }
            .navigationTitle("MVVM Demo")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
