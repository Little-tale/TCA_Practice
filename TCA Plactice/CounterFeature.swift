//
//  CounterFeature.swift
//  TCA Plactice
//
//  Created by Jae hyung Kim on 6/3/24.
//

import ComposableArchitecture
import Foundation

@Reducer // 메크로 Reducer
struct CounterFeature {
    
    @ObservableState // TCA 의 관찰 옵저버블
    struct State { // 상태 관리 구조체
        var count = 0
        var fact: String?
        var isLoading = false
    }
    
    enum Action { // 사용자의 액션
        case decrementButtonTapped // 감소 버튼 탭
        case incrementButtonTapped // 증가 버튼 탭
        case factButtonTapped
        case factResponse(String)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .decrementButtonTapped:
                state.count -= 1
                return .none
                
            case .incrementButtonTapped:
                state.count += 1
                return .none
                
            case .factButtonTapped:
                state.fact = nil
                state.isLoading = true
                return .run { [ count = state.count ] send in
                    print("number: ", count )
                    let (data, response) = try await URLSession.shared.data(from: URL(string: "http://numbersapi.com/\(count)")!)
                    print("SSSS",data)
                    let fact = String(decoding: data, as: UTF8.self)
                    
                    await send(.factResponse(fact))
                }
                
            case let .factResponse(fact):
                state.fact = fact
                state.isLoading = false
                return .none
            }
        }
    }
}

extension CounterFeature {
    
}

/*
 extension Reducer where Body: Reducer, Body.State == State, Body.Action == Action {
   /// Invokes the ``Body-40qdd``'s implementation of ``reduce(into:action:)-1t2ri``.
   @inlinable
   public func reduce(
     into state: inout Body.State, action: Body.Action
   ) -> Effect<Body.Action> {
     self.body.reduce(into: &state, action: action)
   }
 }
 */

/*
 public struct Reduce<State, Action>: Reducer {
   @usableFromInline
   let reduce: (inout State, Action) -> Effect<Action>

   @usableFromInline
   init(
     internal reduce: @escaping (inout State, Action) -> Effect<Action>
   ) {
     self.reduce = reduce
   }
 */



