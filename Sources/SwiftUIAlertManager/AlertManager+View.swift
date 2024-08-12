//
//  AlertManager+View.swift
//
//
//  Created by Alex Nagy on 12.08.2024.
//

import SwiftUI

extension View {
    
    /// Sets up the `alertManager` as an `Environment`
    func usesAlertManager() -> some View {
        self.modifier(AlertManagerModifier())
    }
    
    /// Presents a sheet with an `alertManager` as an `Environment` when a binding to a Boolean value that you
    /// provide is true.
    /// - Parameters:
    ///   - isPresented: A binding to a Boolean value that determines whether
    ///     to present the sheet that you create in the modifier's
    ///     `content` closure.
    ///   - onDismiss: The closure to execute when dismissing the sheet.
    ///   - content: A closure that returns the content of the sheet.
    func sheetWithAlertManager<Content: View>(isPresented: Binding<Bool>,
                                              onDismiss: (() -> Void)? = nil,
                                              @ViewBuilder content: @escaping () -> Content) -> some View {
        self.sheet(isPresented: isPresented, onDismiss: onDismiss) {
            content().usesAlertManager()
        }
    }
    
    /// Presents a sheet with an `alertManager` as an `Environment` using the given item as a data source
    /// for the sheet's content.
    /// - Parameters:
    ///   - item: A binding to an optional source of truth for the sheet.
    ///     When `item` is non-`nil`, the system passes the item's content to
    ///     the modifier's closure. You display this content in a sheet that you
    ///     create that the system displays to the user. If `item` changes,
    ///     the system dismisses the sheet and replaces it with a new one
    ///     using the same process.
    ///   - onDismiss: The closure to execute when dismissing the sheet.
    ///   - content: A closure returning the content of the sheet.
    func sheetWithAlertManager<Item: Identifiable, Content: View>(item: Binding<Item?>,
                                                                  onDismiss: (() -> Void)? = nil,
                                                                  @ViewBuilder content: @escaping (Item) -> Content) -> some View {
        self.sheet(item: item, onDismiss: onDismiss) { item in
            content(item).usesAlertManager()
        }
    }
#if !os(macOS)
    /// Presents a modal view with an `alertManager` as an `Environment` that covers as much of the screen as
    /// possible when binding to a Boolean value you provide is true.
    /// - Parameters:
    ///   - isPresented: A binding to a Boolean value that determines whether
    ///     to present the sheet.
    ///   - onDismiss: The closure to execute when dismissing the modal view.
    ///   - content: A closure that returns the content of the modal view.
    func fullScreenCoverWithAlertManager<Content: View>(isPresented: Binding<Bool>,
                                                        onDismiss: (() -> Void)? = nil,
                                                        @ViewBuilder content: @escaping () -> Content) -> some View {
        self.fullScreenCover(isPresented: isPresented, onDismiss: onDismiss) {
            content().usesAlertManager()
        }
    }
    
    /// Presents a modal view with an `alertManager` as an `Environment` that covers as much of the screen as
    /// possible using the binding you provide as a data source for the
    /// sheet's content.
    /// - Parameters:
    ///   - item: A binding to an optional source of truth for the sheet.
    ///     When `item` is non-`nil`, the system passes the contents to
    ///     the modifier's closure. You display this content in a sheet that you
    ///     create that the system displays to the user. If `item` changes,
    ///     the system dismisses the currently displayed sheet and replaces
    ///     it with a new one using the same process.
    ///   - onDismiss: The closure to execute when dismissing the modal view.
    ///   - content: A closure returning the content of the modal view.
    func fullScreenCoverWithAlertManager<Item: Identifiable, Content: View>(item: Binding<Item?>,
                                                                            onDismiss: (() -> Void)? = nil,
                                                                            @ViewBuilder content: @escaping (Item) -> Content) -> some View {
        self.fullScreenCover(item: item, onDismiss: onDismiss) { item in
            content(item).usesAlertManager()
        }
    }
#endif
}

