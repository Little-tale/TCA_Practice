//
//  CounterFeatureTests.swift
//  TCA Plactice
//
//  Created by Jae hyung Kim on 6/3/24.
//

import ComposableArchitecture
import XCTest

@testable import TCA_Plactice


final class CounterFeatureTests: XCTestCase {
    
    func testCounter() async {
        let store = TestStore(initialState: CounterFeature.State()) {
            CounterFeature()
        }
        
        await store.send(.incrementButtonTapped) {
            $0.count = 1
        }
        await store.send(.decrementButtonTapped) {
            $0.count = 0
        }
        
    }
    
}
