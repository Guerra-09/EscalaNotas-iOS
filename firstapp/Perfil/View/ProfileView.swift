//
//  ProfileView.swift
//  FirstApp
//
//  Created by José Guerra on 21-10-22.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject private var vm: ProfileViewModel = ProfileViewModel()
    
    @State var name: String = "Guerra"
    
    
    @State var log: String = "hola"
    
    var body: some View {
        
        
        ScrollView {
            
            
            Text(name)
                .font(.title)
                .padding(30)
            
            Divider()
                .background(.gray)
            
            
            VStack {
                HStack {
                    // Esto hace las cartas mas pequenas, se hara desde una subview
                    Button {
                        vm.reducedSize.toggle()
                    } label: {
                        Image(systemName: vm.reducedSize ? "book.circle.fill" : "book.circle")
                            .font(.title)
                            .tint(.black)
                    }
                    
                    Spacer()

                    
                    Text("Materias")
                        .font(.title)
                        .padding(.vertical, 20)
                    
                    Spacer()
                    
                    NavigationLink(destination: SaveNotas(viewModel: vm), label: {
                        
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 25, height: 25)
                    })
                }
                
                
                
                MateriaView(vm: vm)
                
            }
            
            
        
            
            // Mas cosas....
            
        }
        .environmentObject(vm)
    }
    
    func notasColor(color: String) -> Color {
        
        switch color {
        case "blackBackground":
            return .white
            
        case "pinkBackground":
            return .white
            
        default:
            return .black
        }
        
        
    }
    

}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView()
        }
        
    }
}
