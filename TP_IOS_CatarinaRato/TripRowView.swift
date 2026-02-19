//
//  TripRowView.swift
//  TP_IOS_CatarinaRato
//
//  Created by Catarina Rato on 09/02/2026.
//

import SwiftUI

// View responsável por representar visualmente uma única viagem na lista.
// É utilizada dentro da List na TripListView.
struct TripRowView: View {

    // Viagem a apresentar na linha da lista
    let trip: Trip

    var body: some View {
        // HStack organiza os elementos horizontalmente
        HStack(spacing: 12) {

            // Imagem representativa da viagem
            Image(trip.imagem)
                .resizable()              // Permite redimensionar a imagem
                .scaledToFill()           // Preenche o espaço mantendo a proporção
                .frame(width: 70, height: 70)
                .clipShape(               // Aplica cantos arredondados à imagem
                    RoundedRectangle(cornerRadius: 10)
                )

            // VStack para organizar a informação textual verticalmente
            VStack(alignment: .leading, spacing: 4) {

                // Nome da viagem
                Text(trip.nome)
                    .font(.headline)

                // Destino da viagem
                Text(trip.destino)
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                // Linha com ícone do tipo de viagem + período e tipo
                HStack(spacing: 6) {

                    // Ícone SF Symbol correspondente ao tipo de viagem
                    Image(systemName: iconForType(trip.tipo))
                        .foregroundColor(.blue)

                    // Texto com período e tipo de viagem
                    Text("\(trip.periodo) • \(trip.tipo)")
                }
                .font(.caption)
                .foregroundColor(.gray)
            }
        }
        // Espaçamento vertical entre linhas da lista
        .padding(.vertical, 4)
    }

    // Função auxiliar que associa cada tipo de viagem
    // a um SF Symbol específico.
    // Isto permite cumprir o requisito de utilização de SF Symbols.
    private func iconForType(_ tipo: String) -> String {
        switch tipo {
        case "Lazer":
            return "sun.max.fill"
        case "Trabalho":
            return "briefcase.fill"
        case "Família":
            return "house.fill"
        case "Aventura":
            return "figure.hiking"
        case "Cultural":
            return "building.columns.fill"
        default:
            return "airplane"
        }
    }
}
