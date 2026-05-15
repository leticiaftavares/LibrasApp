//
//  FormView.swift
//  LibrasApp
//
//  Created by User on 28/04/26.
//

import SwiftUI
import AVKit
import PhotosUI
import SwiftUIExtras
import CloudKit
import Nuvem

struct FormView: View {
    @State var signName: String = ""
    @State var signMeaning: String = ""
    @State var fullName: String = ""
    @Binding var isPresented: Bool
    
    @State var videoData: Data? = nil
    
    @State var selectedCategory = ""
    
    @State var selectionMulti: Set<String> = []
    
    let categories = ["Metodologia", "Ferramenta", "Código", "Negócio"]
    let tags = ["Linguagem", "Framework", "Desenvolvimento", "Conteúdo", "Planejamneto", "Documentação", "Pessoas"]
    
    var body: some View {
        
        NavigationStack {
            Form{
                Section("Nome do Sinal em Inglês *"){
                    TextField("Digite o nome em Inglês", text: $signName)
                    
                }
                Section("Nome do Sinal em Portguês *"){
                    TextField("Digite o nome em Português", text: $fullName)
                    
                }
                Section("Significado da Nome *"){
                    TextField("Digite o significado", text: $signMeaning, axis: .vertical)
                        .frame(height: 100, alignment: .topLeading)
                }
                Section("Upload video *"){
                    PhotoPickerDemo { data in
                        videoData = data
                    }
                        .frame(height: 100, alignment: .center)
                }
                Section("Categoria *"){
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                        ForEach(categories, id: \.self) { category in
                            Button {
                                selectedCategory = category
                            } label: {
                                Text(category)
//                                    .font(Font.system(size: 20))
                                    .padding(10)
                                    .frame(width: 140,height: 40)
                                    .background(selectedCategory == category ? .blue : .white)
                                    .cornerRadius(20)
                                    .foregroundStyle(selectedCategory == category ? .white : .blue)
                            }
                            .buttonStyle(.borderless)
                        }
                    }

                }
                Section("Tags *") {
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                        ForEach(tags, id: \.self) { tag in
                            Button {
                               
                                if selectionMulti.contains(tag) {
                                    selectionMulti.remove(tag)
                                } else {
                                    selectionMulti.insert(tag)
                                }
                            } label: {
                                Text(tag)
//                                    .font(.system(size: 20))
                                    .padding(10)
                                    .frame(width: 170, height: 40)
                                    .background(selectionMulti.contains(tag) ? .blue : Color(.systemGray6))
                                    .cornerRadius(20)
                                    .foregroundStyle(selectionMulti.contains(tag) ? .white : .blue)
                            }
                            .buttonStyle(.borderless)
                        }
                    }
                }
                    }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Send", systemImage: "checkmark"){
                        Task {
                            await save()
                            isPresented = false
                        }
                    }
                    .disabled(signName.isEmpty || signMeaning.isEmpty || selectedCategory == "" || selectionMulti.isEmpty || fullName.isEmpty || videoData == nil)                }
            }
        }
    }
    
    func save() async {
        
        let tagsSelecionadas = tags.filter { selectionMulti.contains($0) }
        
        do {
            var sign = Sign(
                name: signName,
                video: videoData,
                category: selectedCategory,
                handSettings: [UIImage()],
                meaning: signMeaning,
                tag: tagsSelecionadas,
                fullName: fullName,
                approved:  "false",
                isFavorite: false
            )
            try await sign.save(on: .default)
        } catch {
            print(error)
        }
    }
    
}

#Preview {
    @Previewable @State var isPresented: Bool = true
    FormView(isPresented: $isPresented)
}
