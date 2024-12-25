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
                        CardView(item: item)
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



struct CardView: View {
    var item: ListModel
    var body: some View {
        HStack{
            Circle()
                .foregroundColor(item.completado ? .green : .red)
                .frame(width: 20, height: 20)
            VStack(alignment: .leading){
                Text(item.titulo)
                    .bold()
                Text("\(item.fecha, format: Date.FormatStyle(date: .numeric, time: .shortened))")
                    .font(.callout)
                    .foregroundStyle(.gray)
                    
            }
        }
    }
}
