//
//  ComprasView.swift
//  SwiftDataAppCompras
//
//  Created by German David Vertel Narvaez on 27/12/24.
//

import SwiftUI

struct ComprasView: View {
    
    @Bindable var itemList : ListModel
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    @State private var articulo = ""
    @State private var precio = ""
    @State private var cantidad = ""
    
    @FocusState private var isFocus: Bool
    
    var body: some View {
        VStack{
            VStack{ // aqui va nuestro formulario
                TextField("Articulo", text: $articulo)
                    .textFieldStyle(.roundedBorder)
                    .focused($isFocus)
                
                HStack{
                    TextField("Precio", text: $precio)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 100)
                    Spacer()
                    //contador
                }
                
                HStack{
                    Button{
                        //
                    } label: {
                        Text("Agregar")
                    }
                    Spacer()
                        Text("Presupuesto: $\(itemList.presupuesto)")
                }
            }.padding(.all)
            
            List{
                Section("Carrito"){
                    }
            }
        }.navigationTitle(itemList.titulo)
            .navigationBarTitleDisplayMode(.inline)
    }
}

