//
//  TripViewModel.swift
//  TP_IOS_CatarinaRato
//
//  Created by Catarina Rato on 09/02/2026.
//

import SwiftUI
import Combine

// ViewModel responsável pela gestão dos dados das viagens.
// Implementa o padrão MVVM, separando a lógica da interface.
class TripViewModel: ObservableObject {

    // Lista de viagens observável.
    // Qualquer alteração a esta variável atualiza automaticamente as views.
    @Published var trips: [Trip] = []

    // Inicializador do ViewModel.
    // Ao criar o ViewModel, os dados são carregados a partir do ficheiro JSON.
    init() {
        loadTripsFromJSON()
    }

    // Função responsável por carregar as viagens a partir do ficheiro trips.json.
    // O JSON é utilizado apenas como fonte inicial de dados.
    private func loadTripsFromJSON() {
        
        // Obtém o URL do ficheiro trips.json incluído no bundle da aplicação.
        guard let url = Bundle.main.url(forResource: "trips", withExtension: "json") else {
            print("Erro: trips.json não encontrado")
            return
        }

        do {
            // Lê os dados do ficheiro JSON
            let data = try Data(contentsOf: url)
            
            // Decodifica o JSON para um array de objetos Trip
            trips = try JSONDecoder().decode([Trip].self, from: data)
            
        } catch {
            // Em caso de erro na leitura ou descodificação do JSON
            print("Erro ao carregar JSON: \(error)")
        }
    }

    // Função para adicionar uma nova viagem.
    // A viagem é adicionada apenas em memória (não é escrita no JSON).
    func addTrip(
        nome: String,
        destino: String,
        periodo: String,
        tipo: String,
        descricao: String,
        imagem: String
    ) {
        // Gera um novo id incremental com base no maior id existente
        let newId = (trips.map { $0.id }.max() ?? 0) + 1

        // Cria um novo objeto Trip
        let newTrip = Trip(
            id: newId,
            nome: nome,
            destino: destino,
            periodo: periodo,
            tipo: tipo,
            descricao: descricao,
            imagem: imagem
        )

        // Adiciona a nova viagem à lista
        trips.append(newTrip)
    }

    // Função para atualizar uma viagem existente.
    // Procura a viagem pelo id e substitui os seus dados.
    func updateTrip(_ trip: Trip) {
        if let index = trips.firstIndex(where: { $0.id == trip.id }) {
            trips[index] = trip
        }
    }

    // Função para remover uma viagem específica da lista.
    // Utilizada pelo gesto de swipe na List.
    func deleteTrip(at offsets: IndexSet) {
        trips.remove(atOffsets: offsets)
    }

    // Função para remover todas as viagens da lista.
    // A remoção é feita apenas em memória.
    func deleteAllTrips() {
        trips.removeAll()
    }
}
