//
//  NotasView.swift
//  FirstApp
//
//  Created by José Guerra on 16-11-22.
//

import SwiftUI

struct NotasView: View {
    
    @ObservedObject var vm: notaViewModel = notaViewModel()
    
    @State var pMaximo: String
    @State var nMaxima: String
    @State var nMinima: String
    @State var nAprobacion: String
    @State var nExigencia: String
    
    @State var isLoading: Bool = true
    
    //@Binding var puntajeMaximo: String
    
    @State var newList: [String] = []
    
    var body: some View {
        
        
        ScrollView {
            
            if isLoading {
                    
                
                Text("Notas")
                    .font(.system(size: 40))
                    .padding(.vertical, 20)
                
                ProgressView()
                    .frame(width: 200, height: 200)
                    .scaleEffect(x: 2, y: 2)
                
                    
                
            } else {
                
                HStack(spacing: 30) {
                    
                    Text(pMaximo)
                    Text(nMaxima)
                    Text(nMinima)
                    Text(nAprobacion)
                    Text(nExigencia)
            }
                
            ForEach(0...(Int(pMaximo) ?? 0), id: \.self) { punto in
                
                Text("\(punto) puntos --> ")
                    .font(.title2)
                
            }

            
            
            }
            
                
        }
        .scrollIndicators(.hidden)
        .onAppear {
            
            DispatchQueue.main.asyncAfter(deadline: .now()+3.0, execute: {
                isLoading.toggle()
            })
            
            newList = vm.getNota()
            
        }
        
        
    }
}

struct NotasView_Previews: PreviewProvider {
    static var previews: some View {
        NotasView(pMaximo: "20", nMaxima: "70", nMinima: "10", nAprobacion: "40", nExigencia: "60")
    }
}
