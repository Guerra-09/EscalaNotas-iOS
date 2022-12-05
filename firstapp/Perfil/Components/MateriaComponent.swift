//
//  MateriaBig.swift
//  FirstApp
//
//  Created by José Guerra on 04-12-22.
//

import SwiftUI

struct MateriaComponent: View {
    
    @State var materiaName: String
    @State var textColor: Color
    @State var materiaNotas: [Float]
    @State var materiaPorcentajes: [Int]
    @State var materiaColor: String
    @State var promedio: String
    @State var reducedSize: Bool
    
    var body: some View {
        
        if !reducedSize {
            
            Button {
                
                reducedSize = true
                print(reducedSize.description)
                
            } label: {
                
                
                VStack {
                    VStack(spacing: 30) {
                        Text("\(materiaName)")
                            .foregroundColor(textColor)

                        Grid(verticalSpacing: -7) {

                            GridRow() {

                                ForEach(materiaNotas, id: \.self) { notita in
                                    Text("\(notita.description)")
                                        .frame(width: 60, height: 50)

                                }


                            }
                            .background(.gray)
                            .cornerRadius(10)

                            GridRow() {
                                ForEach(materiaPorcentajes, id: \.self) { notita in
                                    Text("\(notita.description)%")
                                        .font(.subheadline)
                                        .frame(width: 60, height: 40)
                                }
                            }
                        }
                        .foregroundColor(textColor)
                        

                    }
                    .frame(maxWidth: 300, minHeight: 156)
                    .background(Color(materiaColor))
                    .cornerRadius(10)
                    
                    HStack {
                        Text("Promedio Final: \(promedio)")
                            .font(.caption)
                            .foregroundColor(.black)
                    }
                    .padding(.leading, 80)
                    
                }
            }
            
            
 
        } else {
            
            
            
            Button {
                
                reducedSize = false
                print(reducedSize.description)
                
            } label: {
                VStack(spacing: 5) {
                    
                    Text(materiaName)
                        .foregroundColor(textColor)

                    Grid(verticalSpacing: -7) {

                        GridRow() {

                            ForEach(materiaNotas, id: \.self) { notita in
                                Text("\(notita.description)")
                                    .frame(width: 60, height: 50)

                            }


                        }

                    }
                    .foregroundColor(textColor)
                }
                .frame(maxWidth: 300, minHeight: 80)
                .background(Color(materiaColor))
                .cornerRadius(10)
            }

        }
        // Else
        
    }
}

struct MateriaBig_Previews: PreviewProvider {
    static var previews: some View {
        
        MateriaComponent(materiaName: "Mate", textColor: .white, materiaNotas: [5.0, 5.8, 5.8, 6.2], materiaPorcentajes: [15, 25, 30, 35], materiaColor: "blackBackground", promedio: "5.4" , reducedSize: false)
        
    }
}
