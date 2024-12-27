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
    
    var body: some View {
        Text(itemList.titulo)
    }
}

