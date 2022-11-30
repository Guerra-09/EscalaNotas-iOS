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
                .frame(height: 100)
                .frame(maxWidth: 180)
                .background(Color("textFieldBackground"))
                .cornerRadius(15)
                .multilineTextAlignment(.center)
                .font(.system(size: 30))
                .padding(18)
        }
        
       
        
        
    }
}


struct TextFieldViewModifier: ViewModifier {
    
    var maxWidthSize: CGFloat = 150
    var customPadding: CGFloat = 10
    
    func body(content: Content) -> some View {
        content
            .frame(height: 100)
            .frame(maxWidth: maxWidthSize)
            .background(Color("textFieldBackground"))
            .cornerRadius(15)
            .multilineTextAlignment(.center)
            .font(.system(size: 30))
            .padding(.horizontal, 5)
            .padding(.vertical, 10)
    }
    
}

//struct NotasModifier: ViewModifier {
//    
//    func body(content: Content) -> some View {
//        content
//            
//    
//}

struct InfoSheet: View {
    
    @State var title: String = "Informacion adicional"
    
    @State var exigenciaText: String = "Que es la exigencia?\nLa exigencia es la fracción del puntaje total que el evaluador determina como necesaria para considerar la evaluación como aprobada"
    
    
    var body: some View {
        
        VStack {
            
            Text(title)
                .font(.title)
            
            Text(exigenciaText)
                .font(.body)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 350, maxHeight: 100)
            
        }
        
    }
}



struct EscalaComponents_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            InfoSheet()
        }
        
    }
}
