//
//  ViewExtension.swift
//  ProsaHi
//
//  Created by фкшуа on 12/11/25.
//

import Foundation
import SwiftUI

extension View {
    func pad(_ edges: Edge.Set = .all, _ length: CGFloat? = nil) -> some View {
        self.padding(edges, length)
    }

    func pad(vertical: CGFloat? = nil, horizontal: CGFloat? = nil) -> some View
    {
        self
            .padding(.vertical, vertical ?? 0)
            .padding(.horizontal, horizontal ?? 0)
    }

    func pad(
        top: CGFloat? = nil,
        bottom: CGFloat? = nil,
        leading: CGFloat? = nil,
        trailing: CGFloat? = nil
    ) -> some View {
        self
            .padding(.top, top ?? 0)
            .padding(.bottom, bottom ?? 0)
            .padding(.leading, leading ?? 0)
            .padding(.trailing, trailing ?? 0)
    }

    func toast(_ toast: Binding<Toast?>) -> some View {
        self.modifier(ToastModifier(toast: toast))
    }
}
