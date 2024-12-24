//
//  AddView.swift
//  SwiftDataAppCompras
//
//  Created by German David Vertel Narvaez on 24/12/24.
//

import SwiftUI
import SwiftData

struct AddView: View {
    
    @State private var item = ListModel()
    @Environment(\.modelContext) var context
    
    var body: some View {
        List{
            TextField("Titulo", text: $item.titulo)
            TextField("Presupuesto", text: $item.presupuesto)
                .keyboardType(.decimalPad)
            DatePicker("Fecha", selection: $item.fecha)
            
            Button{
                context.insert(item)
            } label: {
                Text("Guardar")
            }
            
            .navigationTitle("Crear Compra")
        }
    }
}

#Preview {
    AddView()
}
