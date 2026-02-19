//
//  trip.swift
//  TP_IOS_CatarinaRato
//
//  Created by Catarina Rato on 09/02/2026.
//

import SwiftUI

struct Trip: Identifiable, Codable {
    let id: Int
    var nome: String
    var destino: String
    var periodo: String
    var tipo: String
    var descricao: String
    var imagem: String
}

