//
//  LockScreenView.swift
//  NFL-LockScreen
//
//  Created by Aryan Verma on 12/05/26.
//

import SwiftUI

struct LockScreenView: View {
    @State private var viewModel: ViewModel = ViewModel()
    @State var image: String = ""
    @State var tapped: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                APIImage(viewModel: viewModel, imageLink: image)
                    .id(image)
                    .scaleEffect(1.1)
                    .containerRelativeFrame([.horizontal, .vertical])
                
                VStack {
                    TimelineView(.periodic(from: Date.now, by: 1)) { context in
                        Text(context.date, format: .dateTime.day().month().year())
                            .dateFont(fontSize: 24)
                            .offset(x: 0, y: 20)
                        Text(context.date, format:  .dateTime.hour(.conversationalDefaultDigits(amPM: .omitted)).minute())
                            .clockFont(fontSize: 110)
                            .shadow(color: .black.opacity(0.1), radius: 3)
                    }
                    .shadow(color: .primary.opacity(0.20), radius: 20, x: 0, y: 0)
                    
                    .frame(maxWidth: .infinity, maxHeight: 150)
                    Spacer()
                    
                    // don't use a var to store Date.now bcz it will only store the current time and wont update it, instead directly attach Date.now to view and same goes for using Date.now outside TimelineView.
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button {
                        Task {
                            try await Task.sleep(nanoseconds: UInt64(viewModel.delay * 1_000_000_000))
                            image = viewModel.imageLink1
                        }
                    } label: {
                        Image(systemName: "flashlight.off.fill")
                            .font(.system(size: 20))
                    }
                    
                    Spacer()
                    
                    Button {
                        Task {
                            try await Task.sleep(nanoseconds: UInt64(viewModel.delay * 1_000_000_000))
                            image = viewModel.imageLink2
                        }
                    } label: {
                        Image(systemName: "camera.fill")
                            .font(.system(size: 20))
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(value: "Settings") {
                        Image(systemName: "gear")
                            .font(.title2)
                            .padding()
                    }
                    .navigationDestination(for: String.self) {_ in
                        SettingsView(viewModel: viewModel, hapticCount: 0)
                    }
                }
            }
        }
    }
}

#Preview {
    LockScreenView()
}

