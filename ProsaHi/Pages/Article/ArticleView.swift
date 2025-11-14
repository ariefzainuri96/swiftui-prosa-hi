//
//  DetailView.swift
//  ProsaHi
//
//  Created by фкшуа on 10/11/25.
//

import SwiftUI

struct ArticleView: View {
    let content: String

    private let diModule = DiModule.shared

    private var appRouter: AppRouter

    init(content: String) {
        appRouter = diModule.resolve(AppRouter.self)

        self.content = content
    }

    var body: some View {
        ZStack {
            Color.white

            ScrollView {
                VStack(alignment: .leading) {
                    Text("Article View").foregroundStyle(.black)
                    
                    Text("Content: \(content)").foregroundStyle(.black)

                    Button(
                        action: {
                            appRouter.popToRoot(useNavigateCount: true)
                        },
                        label: {
                            Text("Back To Detail")
                        })
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    ArticleView(content: "Tes")
}
