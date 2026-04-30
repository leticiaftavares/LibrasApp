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

struct FormView: View {
    @State var signName: String = ""
    @State var signMeaning: String = ""
    @Binding var isPresented: Bool
    
    @State var selectedCategory = ""
    
    @State var selectionMulti: Set<String> = [""]
    
    let categories = ["metodologia", "ferramentas", "código", "negócios"]
    let tags = ["metodologia", "ferramentas", "código", "negócios"]

    
    var body: some View {
        
        NavigationStack {
            Form{
                Section("Nome do Sinal"){
                    TextField("Digite o nome", text: $signName)
                    
                }
                Section("Significado da Nome"){
                    TextField("Digite o significado", text: $signMeaning, axis: .vertical)
                        .frame(height: 100, alignment: .topLeading)
                }
                Section("upload video"){
                    PhotoPickerDemo()
                        .frame(height: 100)
                }
                Section("Categoria"){
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                        ForEach(categories, id: \.self) { category in
                            Button {
                                selectedCategory = category
                            } label: {
                                Text(category)
                                    .font(Font.system(size: 20))
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
                Section("Tags"){
                    
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                        Group(selection: $selectionMulti) {
                            ForEach(tags, id: \.self) { tag in
                                Text(tag)
                                    .font(Font.system(size: 20))
                                    .padding(10)
                                    .frame(width: 140,height: 40)
                                    .background(selectionMulti.contains(tag) ? .blue : .white)
                                    .cornerRadius(20)
                                    .foregroundStyle(selectionMulti.contains(tag) ? .white : .blue)
                            }
                        }
                    }
                    .buttonStyle(.borderless)
                }
                    }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Send", systemImage: "checkmark"){
                        isPresented = false
                    }
                    .disabled(signName.isEmpty || signMeaning.isEmpty || selectedCategory == "" || selectionMulti == [""])
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var isPresented: Bool = true
    FormView(isPresented: $isPresented)
}
