//
//  AlertManagerModifier.swift
//
//
//  Created by Alex Nagy on 12.08.2024.
//

import SwiftUI

struct AlertManagerModifier: ViewModifier {
    
    @StateObject private var alertManager = AlertManager()
    
    func body(content: Content) -> some View {
        content
            .environmentObject(alertManager)
            .alert(alertManager.options.title ?? "Alert", isPresented: $alertManager.isAlertPresented) {
                alertManager.actions()
            } message: {
                alertManager.message()
            }
            .confirmationDialog(alertManager.options.title ?? "", isPresented: $alertManager.isConfirmationDialogPresented, titleVisibility: alertManager.options.title == nil ? .hidden : .visible) {
                alertManager.actions()
            } message: {
                alertManager.message()
            }
    }
}
