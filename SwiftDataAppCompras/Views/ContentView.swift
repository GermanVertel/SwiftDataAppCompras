//
//  ContentView.swift
//  SwiftDataAppCompras
//
//  Created by German David Vertel Narvaez on 24/12/24.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    
    @Query(sort: \ListModel.titulo, order: .forward)private var items: [ListModel]
    @State private var show = false
    
    
    var body: some View {
        NavigationStack{
            List{
                Section("Activas"){
                    ForEach(items) { item in
                        Text(item.titulo)
                    }
                }
                Section("Completadas"){
                    
                }
                                
                }
            .navigationTitle("Mis Compras")
            .toolbar {
                ToolbarItem{
                    Button {
                        show.toggle()
                    } label : {
                        Image(systemName: "plus")
                    }
                }
            }
            
            .sheet( isPresented: $show, content:{
                NavigationStack{
                    AddView()
                }.presentationDetents([.medium])
            })
            
            }
        }
     
}

#Preview {
    ContentView()
}
