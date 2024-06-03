//
//  CounterFeature.swift
//  TCA Plactice
//
//  Created by Jae hyung Kim on 6/3/24.
//

import ComposableArchitecture

@Reducer // 메크로 Reducer
struct CounterFeatureViewModel {
    
    @ObservableState // TCA 의 관찰 옵저버블
    struct State { // 상태 관리 구조체
        var count = 0
    }
    
    enum Action { // 사용자의 액션
        case decrementButtonTapped // 감소 버튼 탭
        case incrementButtonTapped // 증가 버튼 탭
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
            }
        }
    }
    
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



