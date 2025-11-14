//
//  DetailView.swift
//  ProsaHi
//
//  Created by фкшуа on 10/11/25.
//

import SwiftUI

struct ForgotView: View {
    private let diModule = DiModule.shared

    private var appRouter: AppRouter

    init() {
        appRouter = diModule.resolve(AppRouter.self)
    }

    var body: some View {
        ZStack {
            Color.white

            ScrollView {
                VStack(alignment: .leading) {
                    Text("Forgot View").foregroundStyle(.black)

                    Button(
                        action: {
                            appRouter.navigate(to: .article(content: "From Forgot View"), shouldCount: true)
                        },
                        label: {
                            Text("Article")
                        })
                    
                    Button(
                        action: {
                            appRouter.logout()
                        },
                        label: {
                            Text("Logout")
                        })
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    if #available(iOS 16.0, *) {
        DetailView()
    }
}
