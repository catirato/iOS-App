//
//  AddTripView.swift
//  TP_IOS_CatarinaRato
//
//  Created by Catarina Rato on 09/02/2026.
//

import SwiftUI

// View responsável pela criação de uma nova viagem.
// Apresenta um formulário onde o utilizador pode introduzir os dados da viagem.
struct AddTripView: View {

    // Permite fechar a view atual (sheet)
    @Environment(\.dismiss) var dismiss

    // ViewModel observado para adicionar a nova viagem
    @ObservedObject var viewModel: TripViewModel

    // Estados locais para armazenar os dados introduzidos pelo utilizador
    @State private var nome = ""
    @State private var destino = ""
    @State private var periodo = ""
    @State private var tipo = "Lazer"
    @State private var descricao = ""
    @State private var imagem = "paris"

    // Lista fixa de tipos de viagem (requisito do enunciado)
    let tipos = ["Lazer", "Trabalho", "Família", "Aventura", "Cultural"]

    // Lista de imagens disponíveis incluídas na aplicação
    let imagensDisponiveis = ["paris", "london", "algarve", "alpes", "roma"]

    var body: some View {
        // NavigationStack permite apresentar título e toolbar
        NavigationStack {

            // Form cria automaticamente um layout de formulário adaptado a iOS
            Form {

                // Secção com informação geral da viagem
                Section("Informação Geral") {
                    TextField("Nome da viagem", text: $nome)
                    TextField("Destino", text: $destino)
                    TextField("Período / Data", text: $periodo)
                }

                // Secção para seleção do tipo de viagem
                Section("Tipo de Viagem") {
                    Picker("Tipo", selection: $tipo) {
                        ForEach(tipos, id: \.self) {
                            Text($0)
                        }
                    }
                }

                // Secção para introdução de uma descrição mais detalhada
                Section("Descrição") {
                    TextEditor(text: $descricao)
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
                                                imagem == img ? .blue : .clear,
                                                lineWidth: 3
                                            )
                                    )
                                    // Ao tocar na imagem, esta passa a ser a selecionada
                                    .onTapGesture {
                                        imagem = img
                                    }
                            }
                        }
                    }
                }
            }
            // Título da view
            .navigationTitle("Nova Viagem")
            .toolbar {

                // ❌ Botão para cancelar a criação da viagem
                // Fecha a view sem guardar dados
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Label("Cancelar", systemImage: "xmark")
                    }
                }

                // ✅ Botão para guardar a nova viagem
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        // Adiciona a nova viagem ao ViewModel
                        viewModel.addTrip(
                            nome: nome,
                            destino: destino,
                            periodo: periodo,
                            tipo: tipo,
                            descricao: descricao,
                            imagem: imagem
                        )
                        // Fecha a view após guardar
                        dismiss()
                    } label: {
                        Label("Guardar", systemImage: "checkmark")
                    }
                    // Desativa o botão se os campos essenciais estiverem vazios
                    .disabled(nome.isEmpty || destino.isEmpty)
                }
            }
        }
    }
}
