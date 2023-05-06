// Created by Alkın Çakıralar for MVVM-Music in 6.05.2023
// Using Swift 5.0
// You can contact me with a.cakiralar@gmail.com
// Follow me on https://medium.com/@acakiralar
// Send friend request on https://www.linkedin.com/in/alkincakiralar/

import SwiftUI

struct SearchResultRow: View {
    let resultVM: SearchResultViewModel

    var body: some View {
        HStack {
            AsyncImage(url: resultVM.imgUrl) { image in
                image.resizable()
            } placeholder: {
                Image(systemName: "camera.fill")
            }
            .frame(width: 50, height: 50)
            .cornerRadius(10)
            
            Text(resultVM.trackName)
                .font(.title3)
                .lineLimit(2)
            
            Spacer()
            
            VStack {
                Text("Price")
                    .font(.caption2)
                Text(resultVM.fullPrice)
                    .font(.caption2.weight(.heavy))
            }
        }
        .padding()
    }
}

struct SearchResultRow_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultRow(resultVM: SearchResultViewModel(model: SearchResult.example))
            .previewLayout(
                .fixed(width: 360,
                       height: 80)
            )
    }
}
