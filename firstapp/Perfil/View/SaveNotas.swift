//
//  SaveNotas.swift
//  FirstApp
//
//  Created by José Guerra on 02-12-22.
//

import SwiftUI

struct SaveNotas: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    
    @State var name: String = ""
    @State var notas: String = "3.4"// [Float]
    @State var porcentajes: String = "25" // [Float]
    @State var colorBackground: String = "blueBackground"
    
    @State var color: [String] = ["blueBackground", "greenBackground", "redBackground", "pinkBackground", "yellowBackground", "blackBackground"]
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                Text("Agregar materia")
                    .font(.title)
                    .padding(.vertical, 60)
                    .foregroundColor(viewModel.notasColor(color: colorBackground))
                
                
                TextField("Nombre materia", text: $name)
                    .frame(maxWidth: 300, minHeight: 60)
                    .background(Color("textFieldBackground"))
                    .cornerRadius(15)
                    .multilineTextAlignment(.center)
                
                ForEach(0..<viewModel.notasAgregadas.count, id: \.self) { index in
                    HStack {
                        TextField("Notas", text: $viewModel.notasAgregadas[index])
                            .frame(maxWidth: 150, minHeight: 60)
                            .background(Color("textFieldBackground"))
                            .cornerRadius(15)
                            .multilineTextAlignment(.center)
                        
                        TextField("Porcentajes", text: $viewModel.porcentajesAgregados[index])
                            .frame(maxWidth: 150, minHeight: 60)
                            .background(Color("textFieldBackground"))
                            .cornerRadius(15)
                            .multilineTextAlignment(.center)
                    }
                    
                }
            }
            .padding(.bottom, 20)
            .frame(maxWidth: 360, maxHeight: 560)
            .background(Color(colorBackground))
            .cornerRadius(15)
            
            
            /// Edit: Cambiar en un tiempo mas la estetica y posicionamiento de estos botones reqlos
            HStack {
                Spacer()
                Button {
                    viewModel.addRow(number: 1)
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.title)
                }
                Spacer()
                Button {
                    viewModel.deleteRow()
                } label: {
                    Image(systemName: "minus.circle")
                        .font(.title)
                }
                Spacer()
            }
            
            
            // Para agregar los colores...
            HStack(spacing: 20) {
                
                ForEach(color, id: \.self) { colors in
                    
                    Button {
                        colorBackground = colors
                    } label: {
                        Circle()
                            .foregroundColor(Color(colors))
                    }
                }
                
            }
            .padding(30)

            
            
            
            Button {
                
                
                viewModel.addMateria(materiaName: name, materiaColor: colorBackground)

                print("SaveNotas: \(viewModel.materias.debugDescription)")
                
                presentationMode.wrappedValue.dismiss()
                
            } label: {
                
                Text("Agregar \(Image(systemName: "paperplane"))")
                    .font(.title2)
                    .frame(width: 200, height: 80)
                    .background(.blue)
                    .cornerRadius(15)
                    .foregroundColor(.white)
            }
            

            
            
            
            
        }
        .onAppear {
            viewModel.clearVariables()
        }
        
        
        
    }
}

struct SaveNotas_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SaveNotas(viewModel: ProfileViewModel())
        }
        
    }
}
