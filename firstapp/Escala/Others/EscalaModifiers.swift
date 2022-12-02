//
//  EscalaModifiers.swift
//  FirstApp
//
//  Created by José Guerra on 02-12-22.
//

import SwiftUI

struct ViewTest: View {
    var body: some View {
        
        VStack {
            Text("10 -> 3.5")
                .modifier(NotaModifier(color: .red))
        }
        
        
    }
}


struct NotaModifier: ViewModifier {
    
    var color: Color? 
    
    func body(content: Content) -> some View {
        content
            .frame(width: 100, height: 50)
            .background(Color("textFieldBackground"))
            .cornerRadius(5)
            .foregroundColor(color)
            
            
    }
    
}


struct EscalaModifiers_Previews: PreviewProvider {
    static var previews: some View {
        ViewTest()
    }
}
