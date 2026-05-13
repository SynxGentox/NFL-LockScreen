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
            if output.image == nil {
                Image(imageLink == viewModel.defaultImage.rawValue ? viewModel.backupImage.rawValue : viewModel.defaultImage.rawValue)
                    .resizable()
                    .imageStyle()
            }
            if output.error != nil {
                VStack{
                    Image(viewModel.backupImage.rawValue)
                        .resizable()
                        .imageStyle()
                        .scaleEffect(1.1)
                        .ignoresSafeArea()
                }
            } else if let image = output.image {
                image
                    .resizable()
                    .imageStyle()
                    .scaleEffect(1.1)
                    .ignoresSafeArea()
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
