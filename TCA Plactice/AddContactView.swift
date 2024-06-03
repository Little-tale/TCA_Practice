//
//  AddContactView.swift
//  TCA Plactice
//
//  Created by Jae hyung Kim on 6/3/24.
//

import SwiftUI
import ComposableArchitecture

struct AddContactView: View {
    
    // @Bindable -> TCA 상태 모델의 속성에 적용하여 SwiftUI 뷰와 바인딩할 수 있게 합니다
    @Perception.Bindable var store: StoreOf<AddContactFeature>
    
    
    var body: some View {
        Form {
            TextField("Name", text: $store.contact.name.sending(\.setName))
            Button("Save") {
                store.send(.saveButtonTapped)
            }
        }
        .toolbar {
            ToolbarItem {
                Button("Cancel") {
                    store.send(.cancelButtonTapped)
                }
            }
        }
    }
    
}


#Preview {
  NavigationStack {
    AddContactView(
      store: Store(
        initialState: AddContactFeature.State(
          contact: Contact(
            id: UUID(),
            name: "Blob"
          )
        )
      ) {
        AddContactFeature()
      }
    )
  }
}
