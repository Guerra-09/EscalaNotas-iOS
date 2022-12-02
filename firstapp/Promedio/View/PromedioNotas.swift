//
//  PromedioNotas.swift
//  FirstApp
//
//  Created by José Guerra on 21-10-22.
//

import SwiftUI



struct PromedioNotas: View {
    
    @StateObject private var vm: NotaViewModel = NotaViewModel()
    
    @State private var notasModel = [NotaModel]()
    
    @State var newNota : String = ""
    
    @State var notas = []
    
    @FocusState var isFocused: Bool
    
    
    var body: some View {
        
        VStack {
            ScrollView {
                
                // Estoy seguro de que esto es una mala practica
                Spacer()
                    .frame(height: 120)
                
            
                // Aqui se muestran los inputs
                VStack {
                    
                    ForEach(0..<vm.notas.count, id: \.self) { index in
                        HStack {
                            TextField("Nota", text: $vm.notas[index])
                                .focused($isFocused)
                                .modifier(PromedioInput())
                            
                            TextField("%Porcentaje%", text: $vm.porcentajes[index])
                                .focused($isFocused)
                                .modifier(PromedioInput())
                        }
                    }
                    
                }
                
                VStack {
                    
                    Text("\(vm.resultado, specifier: "%.2f")")
                        .font(.title)
                        .frame(width: 170, height: 80)
                        .background(Color("textFieldBackground"))
                        .cornerRadius(15)
                        .padding(.vertical, 30)
                    
                    
                    ForEach(vm.notaLog, id: \.self) { log in
                        Text("\(log)")
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                    }
                    
                    
                    
                    
                    
                }
                
                
            } //ScrollView end
            .scrollIndicators(.never)
            
            
            // Aqui estan los botones para agregar, borrar y calcular notas
            // Minimo de notas 2, Maximo 10
            HStack {
                Button {
                    vm.addRow()
                } label: {
                    Image(systemName: "plus.square.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                .disabled(vm.thereIsMany() ? true : false)
                
                
                
                // Aqui se calcula
                Button {
                    
                    vm.mean2()
                    isFocused.toggle()
                    
                } label: {
                    Text("Calcular")
                        .font(.title2)
                        .frame(width: 150, height: 80)
                        .background(.blue)
                        .cornerRadius(15)
                        .foregroundColor(.white)
                }
                
                
                Button {
                    vm.deleteRow()
                } label: {
                    Image(systemName: "minus.square.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                .disabled(vm.thereIsLittle() ? true : false)
                
                
            }
            
            
            
                
            
            
            
            
            
        }
        
        
        
    }
    
}

struct PromedioNotas_Previews: PreviewProvider {
    static var previews: some View {
        PromedioNotas()
    }
}
