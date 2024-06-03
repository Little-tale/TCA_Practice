//
//  ExalmpleSettings.swift
//  TCA Plactice
//
//  Created by Jae hyung Kim on 6/3/24.
//

import ComposableArchitecture


@Reducer
struct ExalmpleSettings {
    
    enum Digest: String, CaseIterable, Equatable {
        case daily = "Daily"
        case weekly = "Weekly"
        case monthly = "Monthly"
    }
    
    
    @ObservableState
    struct State: Equatable {
        var digest = Digest.daily
        var displayName = ""
        var enableNotifications = false
        var isLoading = false
        var protectMyPosts = false
        var sendEmailNotifications = false
        var sendMobileNotifications = false
    }
    
    
//    enum Action {
//        case digestChanged(Digest)
//        case displayNameChanged(String)
//        case enableNotificationsChanged(Bool)
//        case protectMyPostsChanged(Bool)
//        case sendEmailNotificationsChanged(Bool)
//        case sendMobileNotificationsChanged(Bool)
//    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
    }
    
    var body: some ReducerOf<Self> {
        
//        Reduce { state, action in
//            switch action {
//            case .digestChanged(let digest):
//                state.digest = digest
//                return .none
//                
//                
//            case .displayNameChanged(let displayName):
//                state.displayName = displayName
//                return .none
//                
//                
//            case let .enableNotificationsChanged(isOn):
//                state.enableNotifications = isOn
//                return .none
//                
//                
//            case let .protectMyPostsChanged(isOn):
//                state.protectMyPosts = isOn
//                return .none
//                
//                
//            case let .sendEmailNotificationsChanged(isOn):
//                state.sendEmailNotifications = isOn
//                return .none
//                
//                
//            case let .sendMobileNotificationsChanged(isOn):
//                state.sendMobileNotifications = isOn
//                return .none
//            }
//        }
        
        BindingReducer()
    }
    
}
