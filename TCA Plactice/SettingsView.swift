//
//  SettingsView.swift
//  TCA Plactice
//
//  Created by Jae hyung Kim on 6/3/24.
//

import ComposableArchitecture
import SwiftUI

struct SettingsView: View {
    
    @Perception.Bindable var store: StoreOf<ExalmpleSettings>
    
    var body: some View {
        Form {
            
            TextField("Display name", text: $store.displayName)
            Toggle("Notifications", isOn: $store.enableNotifications)
        }
    }
    
}
