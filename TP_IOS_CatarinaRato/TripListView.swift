//
//  TripListView.swift
//  TP_IOS_CatarinaRato
//
//  Created by Catarina Rato on 09/02/2026.
//

import SwiftUI

// View principal da aplicação.
// Responsável por apresentar a lista de viagens e a navegação principal.
struct TripListView: View {

    // ViewModel observado pela view.
    // @StateObject garante que o ViewModel é criado uma única vez.
    @StateObject private var viewModel = TripViewModel()

    // Controla a apresentação da view de criação de uma nova viagem
    @State private var showAddTrip = false

    // Controla a apresentação da view "Sobre a App"
    @State private var showAbout = false
    
    var body: some View {
        // NavigationStack permite navegação moderna em SwiftUI (iOS 16+)
        NavigationStack {

            // Lista de viagens
            List {
                // Itera sobre todas as viagens carregadas pelo ViewModel
                ForEach(viewModel.trips) { trip in

                    // Ao selecionar uma viagem, abre a view de edição
                    NavigationLink {
                        EditTripView(viewModel: viewModel, trip: trip)
                    } label: {
                        // Linha personalizada da lista
                        TripRowView(trip: trip)
                    }
                }
                // Permite apagar uma viagem individual com gesto de swipe
                .onDelete(perform: viewModel.deleteTrip)
            }
            // Mantém o título em modo inline para permitir uso de toolbar personalizada
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {

                // 🟦 LOGO AO CENTRO DA NAVIGATION BAR
                // O logótipo funciona como botão e abre a vista "Sobre a App"
                ToolbarItem(placement: .principal) {
                    Button {
                        showAbout = true
                    } label: {
                        Image("AppLogo2")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                            .padding(.top)
                    }
                }

                // 🗑️ BOTÃO PARA APAGAR TODAS AS VIAGENS
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        viewModel.deleteAllTrips()
                    } label: {
                        Label("Limpar", systemImage: "trash")
                    }
                }

                // ➕ BOTÃO PARA ADICIONAR NOVA VIAGEM
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        showAddTrip = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }

            // Apresenta a view de criação de nova viagem como sheet
            .sheet(isPresented: $showAddTrip) {
                AddTripView(viewModel: viewModel)
            }

            // Apresenta a view "Sobre a App" em ecrã inteiro
            .fullScreenCover(isPresented: $showAbout) {
                AboutView()
            }
        }
    }
}

// Preview da view para o Xcode Canvas
#Preview {
    TripListView()
}
