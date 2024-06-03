//
//  TCA_PlacticeApp.swift
//  TCA Plactice
//
//  Created by Jae hyung Kim on 6/3/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCA_PlacticeApp: App {
    
    
    static let store = Store(initialState: CounterFeature.State()) {
        CounterFeature() // 스토어는 한번만 제공되어야만 한다.
        ._printChanges() // body가 다시 그려질 때(상태 값이 변경될 때), 뷰의 프로퍼티가 어떤 값으로 변하는지 콘솔에 출력해주는 method
    }
    
    var body: some Scene {
        WindowGroup {
            CounterView(
                store: TCA_PlacticeApp.store
            )
        }
    }
    
    
    
}
