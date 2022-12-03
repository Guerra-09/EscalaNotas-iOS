//
//  BackButton.swift
//  FirstApp
//
//  Created by José Guerra on 02-12-22.
//

import SwiftUI

struct BackButton: View {
    var body: some View {
        
        ZStack {
            Image(systemName: "chevron.backward")
                .font(.title)
                .foregroundColor(.white)
        }
        .frame(width: 40, height: 40)
        .background(.black)
        .cornerRadius(.infinity)
        
        
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}
