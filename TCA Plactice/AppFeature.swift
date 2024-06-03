//
//  AppFeature.swift
//  TCA Plactice
//
//  Created by Jae hyung Kim on 6/3/24.
//


import ComposableArchitecture

@Reducer
struct AppFeature {
    
    struct State: Equatable {
        // AppFeature의 전체 상태의 일부로서 존재
        var tab1 = CounterFeature.State()
        var tab2 = CounterFeature.State()
    }
    
    enum Action {
        case tab1(CounterFeature.Action)
        case tab2(CounterFeature.Action)
    }
    // KeyPath 란. -> Swift 에서 타입의 특정 속성에 대한 경로를 나타내는 타입 -> 특정 타입의 인스턴스의 프로퍼티에 접근하거나 세팅이 가능
    // 읽기 전용이며, WritableKeyPath는 읽고 쓸수 있다.
    // Scope는 TCA의 특정 상태 및 액션을 하위 리듀서에 연결하는데 사용되는 도구
    // 상태와 액셕을 작은 부분으로 분할하고 각각의 하위 리듀서가 자신의 샅애와 액션만 처리하도록 할때 유용
    var body: some ReducerOf<Self> {
        
        Scope(state: \.tab1, action: \.tab1) { // 독립적 상태 액션 관리
            CounterFeature()
        }
        
        Scope(state: \.tab2, action: \.tab2) {
            CounterFeature()
        }
        
        Reduce { state, action in // 전체 Featuredml 상태 액션 관리
            // 
            return .none
        }
    }
}

