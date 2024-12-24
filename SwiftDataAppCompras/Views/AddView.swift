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
    @Environment(\.dismiss) var dismiss  //para que se quite la pantalla addview despues de guardar
    
    var body: some View {
        List{
            TextField("Titulo", text: $item.titulo)
            TextField("Presupuesto", text: $item.presupuesto)
                .keyboardType(.numberPad)
            DatePicker("Fecha", selection: $item.fecha)
            
            Button{
                context.insert(item)
                dismiss()
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
