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

/*
 Feature 은 뷰모델과는 다르게
 특정 기능을 또는 화면을 나타내는 하나의 모듈을 의미.
 
 Feature의 구성 요소
 State: 해당 Feature의 상태를 정의함. 상태는 View에서 표시되는 모든 데이터를 포함
 Action: 해당 Feature에서 발생할 수 있는 모든 사용자 액션이나 이벤트를 정의.
 Reducer: 액션이 발생했을 때 상태를 어떻게 변경할지를 정의하는 함수 상태와 액션을 받아서 새로운 상태를 반환
 */

@Reducer
struct ContactsFeature {
    
    @ObservableState
    struct State: Equatable {
        @Presents var addConsact: AddContactFeature.State?
        var contacts: IdentifiedArrayOf<Contact> = [] // 유저 이름 배열인데 ID가 있음
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
                
//            case .addContact(.presented(.delegate(.cancel))):
//                
//                state.addConsact = nil
//                return .none
                
            case let .addContact(.presented(.delegate(.saveContact(contact)))) :
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
