//
//  ViewPassing.swift
//  FirstApp
//
//  Created by José Guerra on 03-12-22.
//

import SwiftUI

class TestVM: ObservableObject {
    @Published var names: [String] = ["Tim"]
    
    func addName(newName: String) -> () {
        names.append(newName)
    }
}





struct ViewPassing: View {
    
    @StateObject var vm: TestVM = TestVM()

    var body: some View {
        
       
            VStack {
                List {
                    ForEach(vm.names, id: \.self) { name in
                        Text(name)
                            .font(.title)
                    }
                    
                }
                NavigationLink(destination: Parameters(viewModel: vm)) {
                    Text("Add name")
                }
                .environmentObject(vm)
                
            }
        
        
    }
}

struct Parameters: View {
    
    @State var addName: String = ""
    @ObservedObject var viewModel: TestVM
    
    var body: some View {
        
        VStack {
            
            List {
                ForEach(viewModel.names, id: \.self) { name in
                    Text(name)
                        .font(.title)
                }
                
            }
            
            TextField("Name to add", text: $addName)
                .frame(maxWidth: 300, maxHeight: 40)
                .background(.quaternary)
            
            Button {
                viewModel.addName(newName: addName)
            } label: {
                 Text("Add name")
            }
            
                
        }
    }
}

struct ViewPassing_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ViewPassing()
        }
    }
}
