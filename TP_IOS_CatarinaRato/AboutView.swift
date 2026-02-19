//
//  AboutView.swift
//  TP_IOS_CatarinaRato
//
//  Created by Catarina Rato on 09/02/2026.
//

import SwiftUI

struct AboutView: View {

    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                Image("Gradient_CESAE")
                    .resizable()
                .ignoresSafeArea()

                // 📄 CONTEÚDO
                ScrollView {
                    VStack(spacing: 20) {

                        Image("AppLogo2")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)

                        Label("Criado por: Catarina Rato", systemImage: "person.fill")
                            .font(.headline)

                        Label("Curso: Software Development", systemImage: "square.and.pencil")

                        Divider()

                        Text("Funcionalidades")
                            .font(.title3)
                            .bold()

                        Label("Planeamento de Viagens", systemImage: "airplane")
                        Label("Dados carregados de JSON", systemImage: "doc.text.fill")
                        Label("Criação, edição e remoção em memória", systemImage: "memorychip")

                        Divider()

                        Text("Autoavaliação")
                            .font(.title3)
                            .bold()

                        Text(
                            "A aplicação cumpre todos os requisitos pedidos, "
                            + "apresenta uma interface intuitiva e boas práticas de SwiftUI."
                        )
                        .multilineTextAlignment(.center)
                    }
                    .padding()
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {

                ToolbarItem(placement: .principal) {
                        HStack(spacing: 6) {
                            Image(systemName: "info.circle.fill")
                            Text("Sobre a App")
                                .font(.title2)
                                .bold()
                            
                        }
                    }
                
            
                // ❌ BOTÃO FECHAR
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Label("Fechar", systemImage: "xmark")
                    }
                }
            }
        }
    }
}

#Preview {
    AboutView()
}
