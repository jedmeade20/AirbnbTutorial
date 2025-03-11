//
//  ProfileOptionRowView.swift
//  AirbnbTutorial
//
//  Created by Johanan Edmeade on 11/17/23.
//

import SwiftUI

struct ProfileOptionRowView: View {
    let imageName : String
    let title : String
    
    var body: some View {
        
        VStack{
            HStack{
                Image(systemName: imageName)
                
                Text(title)
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            Divider()
        }
    }
}

#Preview {
    ProfileOptionRowView(imageName: "gear", title: "Settings")
}
