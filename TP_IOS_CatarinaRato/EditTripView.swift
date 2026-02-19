//
//  EditTripView.swift
//  TP_IOS_CatarinaRato
//
//  Created by Catarina Rato on 09/02/2026.
//

import SwiftUI

// View responsável pela edição de uma viagem existente.
// Permite alterar os dados de uma viagem previamente criada.
struct EditTripView: View {

    // Permite fechar a view atual após guardar alterações
    @Environment(\.dismiss) var dismiss

    // ViewModel observado para atualizar a viagem
    @ObservedObject var viewModel: TripViewModel

    // Viagem a editar.
    // @State permite que as alterações sejam refletidas localmente na interface
    @State var trip: Trip

    // Lista fixa de tipos de viagem disponíveis
    let tipos = ["Lazer", "Trabalho", "Família", "Aventura", "Cultural"]

    // Lista de imagens disponíveis na aplicação
    let imagensDisponiveis = ["paris", "london", "algarve", "alpes", "roma"]

    var body: some View {
        // NavigationStack permite título e toolbar na view
        NavigationStack {

            // Form cria um formulário adaptado a iOS
            Form {

                // Secção com informação geral da viagem
                Section("Informação Geral") {
                    TextField("Nome da viagem", text: $trip.nome)
                    TextField("Destino", text: $trip.destino)
                    TextField("Período / Data", text: $trip.periodo)
                }

                // Secção para seleção do tipo de viagem
                Section("Tipo de Viagem") {
                    Picker("Tipo", selection: $trip.tipo) {
                        ForEach(tipos, id: \.self) {
                            Text($0)
                        }
                    }
                }

                // Secção para edição da descrição da viagem
                Section("Descrição") {
                    TextEditor(text: $trip.descricao)
                        .frame(height: 100)
                }

                // Secção para seleção da imagem representativa da viagem
                Section("Imagem") {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(imagensDisponiveis, id: \.self) { img in
                                Image(img)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .clipShape(
                                        RoundedRectangle(cornerRadius: 10)
                                    )
                                    // Destaque visual da imagem selecionada
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(
                                                trip.imagem == img ? .blue : .clear,
                                                lineWidth: 3
                                            )
                                    )
                                    // Ao tocar na imagem, esta passa a ser a imagem da viagem
                                    .onTapGesture {
                                        trip.imagem = img
                                    }
                            }
                        }
                    }
                }
            }
            // Título da view
            .navigationTitle("Editar Viagem")
            .toolbar {

                // ✅ Botão para guardar as alterações efetuadas
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        // Atualiza a viagem no ViewModel
                        viewModel.updateTrip(trip)
                        // Fecha a view após guardar
                        dismiss()
                    } label: {
                        Label("Guardar", systemImage: "checkmark")
                    }
                }
            }
        }
    }
}
