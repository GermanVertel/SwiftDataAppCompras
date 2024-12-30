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
    @Environment(\.modelContext) var context
    
    var body: some View {
        NavigationStack{
            List{
                Section("Activas"){
                    ForEach(items) { item in
                        NavigationLink(value: item) {
                            CardView(item: item)
                            .swipeActions(edge: .leading){
                                Button(role: .destructive){
                                        context.delete(item)
                                } label: {
                                    Image(systemName: "trash")
                                }
                            }
                        }
                        
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
            .navigationDestination(for: ListModel.self) {
                ComprasView(itemList: $0)
            
        }
        
        
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

struct ContadorView: View {
    @Binding var contador: Int
    var body: some View {
        HStack{
            Button{
                contador -= 1
                if contador <= 1{
                    contador = 1
                }
            } label: {
                Image(systemName: "minus")
            }
            Text("\(contador)")
            
            Button{
                contador += 1
            } label: {
                Image(systemName: "plus")
            }
        }
    }    
}
