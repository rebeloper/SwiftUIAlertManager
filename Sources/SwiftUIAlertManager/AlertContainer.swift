//
//  AlertContainer.swift
//  
//
//  Created by Alex Nagy on 10.07.2024.
//

import SwiftUI

public struct AlertContainer<Content: View>: View {
    
    @ViewBuilder public let content: (AlertManager) -> Content
    
    @StateObject private var alertManager = AlertManager()
    
    public init(content: @escaping (AlertManager) -> Content) {
        self.content = content
    }
    
    public var body: some View {
        content(alertManager)
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
