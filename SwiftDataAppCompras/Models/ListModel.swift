//
//  ListModel.swift
//  SwiftDataAppCompras
//
//  Created by German David Vertel Narvaez on 24/12/24.
//

import Foundation
import SwiftData

@Model
final class ListModel {
    var titulo: String
    var fecha: Date
    var completado: Bool
    var presupuesto: String
    var total: Float
    
    init(titulo: String, fecha: Date, completado: Bool, presupuesto: String, total: Float) {
        self.titulo = titulo
        self.fecha = fecha
        self.completado = completado
        self.presupuesto = presupuesto
        self.total = total
    }
 
}
