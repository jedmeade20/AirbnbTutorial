//
//  SearchAndFilterBar.swift
//  AirbnbTutorial
//
//  Created by Johanan Edmeade on 11/15/23.
//

import SwiftUI

struct SearchAndFilterBar: View {
    @Binding var location : String
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
            
            VStack(alignment: .leading, spacing: 2) {
                Text(location.isEmpty ? "Where to" : location)
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text("\(location.isEmpty ? "Any where -" : "") Any week - Add Guest")
                    .font(.caption2)
                    .foregroundStyle(.gray)
            }
            Spacer()
            Button(action: {}, label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.black)
                
            })
        }
        .padding(.horizontal)
        .padding(.vertical,12)
        //container
        .overlay{
            Capsule()
                .stroke(lineWidth: 0.5)
                .foregroundStyle(Color(.systemGray4))
                .shadow(color: .black.opacity(0.2),radius: 2)
        }
        .padding()
    }
}

#Preview {
    SearchAndFilterBar(location: .constant("San Francisco"))
}
