//
//  SettingsView.swift
//  test
//
//  Created by shafia on 05/08/2025.
//

import SwiftUI

enum AppTheme: String, CaseIterable, Identifiable {
    case light, dark, system
    var id: String { rawValue }
}

struct SettingsView: View {
    @AppStorage("theme") private var selectedTheme: AppTheme = .system

    var body: some View {
        Form {
            Picker("Theme", selection: $selectedTheme) {
                ForEach(AppTheme.allCases) { theme in
                    Text(theme.rawValue.capitalized).tag(theme)
                }
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    SettingsView()
}
