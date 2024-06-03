//
//  AddContactFeature.swift
//  TCA Plactice
//
//  Created by Jae hyung Kim on 6/3/24.
//

import ComposableArchitecture

@Reducer
struct AddContactFeature {
    
    // 외부 의존성 주입
    /*
     extension DependencyValues {
     /// An effect that dismisses the current presentation.
     ///
     /// See the documentation of ``DismissEffect`` for more information.
     public var dismiss: DismissEffect {
     get { self[DismissKey.self] }
     set { self[DismissKey.self] = newValue }
     }
     }
     */
    @Dependency(\.dismiss) var dismiss
    
    @ObservableState
    struct State: Equatable {
        var contact: Contact
    }
    
    enum Action {
        case cancelButtonTapped
        case saveButtonTapped
        case setName(String)
        
        case delegate(Delegate)
        
        // 부모만 딜리게이트를 듣게끔 해야함.
        enum Delegate: Equatable {
            //            case cancel
            case saveContact(Contact)
        }
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .cancelButtonTapped:
                return .run { _ in await self.dismiss() }
            case .saveButtonTapped:
                
                // state.contact 캡쳐
                return .run { [contact = state.contact] send in
                    await send(.delegate(.saveContact(contact)))
                    await self.dismiss()
                }
//                return .send(.delegate(.saveContact(state.contact)))
            case .setName(let name):
                state.contact.name = name
                
                return .none
            case .delegate:
                return .none
            }
        }
    }
    
}
