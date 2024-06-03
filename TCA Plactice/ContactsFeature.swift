//
//  ContactsFeature.swift
//  TCA Plactice
//
//  Created by Jae hyung Kim on 6/3/24.
//

import Foundation
import ComposableArchitecture

struct Contact: Equatable, Identifiable {
    let id: UUID
    var name: String
}

/*
 IdentifiedArrayOf 란: 각 요소가 고유한 식별자를 가지고 있는 배열로, 특정 요소를 효율적으로 찾고 수정할수 있다.
 */

@Reducer
struct ContactsFeature {
    
    @ObservableState
    struct State: Equatable {
        @Presents var addConsact: AddContactFeature.State?
        var contacts: IdentifiedArrayOf<Contact> = []
    }
    
    enum Action {
        case addButtonTapped
        // .​PresentationAction은 자식으로부터의 액션을 부모가 받아 작업을 관찰이 가능하다.
        case addContact(PresentationAction<AddContactFeature.Action>)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .addButtonTapped:
                state.addConsact = AddContactFeature.State (
                    contact: Contact(id: UUID(), name: "" )
                )
                return .none
                
            
                
            case .addContact(.presented(.saveButtonTapped)):
                guard let contact = state.addConsact?.contact else { return .none}
                state.contacts.append(contact)
                state.addConsact = nil
                return .none
                
            case .addContact:
                return .none
                
            }
        }
        .ifLet(\.$addConsact, action: \.addContact) {
            AddContactFeature()
        }
    }
    
}
