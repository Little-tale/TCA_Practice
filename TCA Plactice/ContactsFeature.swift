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
        var contacts: IdentifiedArrayOf<Contact> = []
    }
    
    enum Action {
        case addButtonTapped
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .addButtonTapped:
                
                return .none
            }
        }
    }
    
}
