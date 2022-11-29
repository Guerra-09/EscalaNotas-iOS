//
//  ProfileView.swift
//  FirstApp
//
//  Created by José Guerra on 21-10-22.
//

import SwiftUI

struct ProfileView: View {
    
    @State var name: String = "Guerra"
    
    var body: some View {
        
        
        VStack {
            ZStack {
                
                Circle()
                    .foregroundColor(.blue)
                
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.white)
                
            }
            .frame(width: 300, height: 300)
            
            Text(name)
                .font(.title)
                .padding(30)
            
        
            
            // Mas cosas....
            
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
