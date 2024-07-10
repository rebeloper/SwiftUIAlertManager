//
//  SwiftUIAlertManager.swift
//  SwiftUIAlertManager
//
//  Created by Alex Nagy on 18.06.2022.
//

import SwiftUI
import Combine

public class AlertManager: ObservableObject {
    @Published public var isAlertPresented: Bool = false
    @Published public var isConfirmationDialogPresented: Bool = false
    @Published public var options: AlertOptions = AlertOptions()
    
    public init() {}
    
    @ViewBuilder
    func actions() -> some View {
        if let actions = options.actions {
            ForEach(actions) { action in
                Button(role: action.role) {
                    action.action?()
                } label: {
                    Text(action.label)
                }
            }
        } else {
            Button(role: .cancel) {} label: { Text("Cancel") }
        }
    }
    
    @ViewBuilder
    func message() -> some View {
        if let message = options.message {
            Text(message)
        } else {
            EmptyView()
        }
    }
    
    public func present(options: AlertOptions) {
        self.options = options
        withAnimation {
            switch options.type {
            case .alert:
                isAlertPresented = true
            case .confirmationDialog:
                isConfirmationDialogPresented = true
            }
        }
    }
    
    public func present(_ type: AlertType,
                 title: String? = nil,
                 message: String? = nil,
                 actions: [AlertAction]? = nil) {
        present(options: .init(type: type, title: title, message: message, actions: actions))
    }
    
    public func present(_ preset: AlertPreset,
                 _ type: AlertType,
                 message: String,
                 actions: [AlertAction]? = nil) {
        var title = ""
        switch preset {
        case .error:
            title = "Error"
        case .success:
            title = "Success"
        case .warning:
            title = "Warning"
        case .info:
            title = "Info"
        }
        present(options: .init(type: type, title: title, message: message, actions: [AlertAction(role: .cancel, label: .ok)]))
    }
    
    public func present(_ error: Error,
                        actions: [AlertAction]? = nil) {
        present(.error, .alert, message: error.localizedDescription, actions: actions)
    }
    
    public func hide() {
        withAnimation {
            isAlertPresented = false
        }
    }
}
