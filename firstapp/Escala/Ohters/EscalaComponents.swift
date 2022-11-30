//
//  EscalaComponents.swift
//  FirstApp
//
//  Created by José Guerra on 16-11-22.
//

import SwiftUI

struct FieldComponent: View {
    
    @State var state: String
    @State var placeholder: String
    
    var body: some View {
        
        
        VStack {
            
            Text(state)
                .font(.caption)
            
            TextField("0", text: $placeholder)
                .frame(height: 80)
                .frame(maxWidth: 400)
                .background(Color("textFieldBackground"))
                .cornerRadius(15)
                .multilineTextAlignment(.center)
                .font(.system(size: 30))
        }
        .padding()
       
        
        
    }
}


struct TextFieldViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(height: 80)
            .frame(maxWidth: 400)
            .background(Color("textFieldBackground"))
            .cornerRadius(15)
            .multilineTextAlignment(.center)
            .font(.system(size: 30))
    }
    
}

struct EscalaComponents_Previews: PreviewProvider {
    static var previews: some View {
        FieldComponent(state: "Nota Maxima", placeholder: "70")
    }
}
