//
//  ProfileView.swift
//  AirbnbTutorial
//
//  Created by Johanan Edmeade on 11/17/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            //login view
            VStack(alignment: .leading, spacing: 32){
                VStack (alignment: .leading, spacing: 8){
                    Text("Profile")
                        .font(.largeTitle)
                    .fontWeight(.semibold)
                    
                    Text("Log in to start planning your next trip")

                }
                    Button{
                    //action
                    print("log in")
                }label: {
                    Text("Log in")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 360, height: 48)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                HStack{
                    Text("Don't have an account?")
                    
                    Text("Sign up")
                        .bold()
                        .underline()
                }
                .font(.caption)
                
            }
            
            VStack(spacing: 24){
                ProfileOptionRowView(imageName: "gear", title: "Settings")
                
                ProfileOptionRowView(imageName: "gear", title: "Accesibilty")
                
                ProfileOptionRowView(imageName: "questionmark.circle", title: "Visit Help Center")
            }
            .padding(.vertical)
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
