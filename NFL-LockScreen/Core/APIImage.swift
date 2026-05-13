//
//  APIImage.swift
//  NFL-LockScreen
//
//  Created by Aryan Verma on 12/05/26.
//

import SwiftUI

struct APIImage: View {
    let viewModel: ViewModel
    let imageLink: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageLink)) { output in
            if output.error != nil {
                VStack{
                    Image(viewModel.defaultImage.rawValue)
                        .resizable()
                        .imageStyle()
                }
            } else if output.image == nil {
                Image(viewModel.backupImage.rawValue)
                    .resizable()
                    .imageStyle()
            } else if let image = output.image {
                image
                    .resizable()
                    .imageStyle()
            } else {
                ProgressView()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    let viewModel = ViewModel()
    NavigationStack {
        APIImage(viewModel: viewModel, imageLink: "")
    }
}
