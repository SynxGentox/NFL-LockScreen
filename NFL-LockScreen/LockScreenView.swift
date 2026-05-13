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
                if image.isEmpty {
                    Image(viewModel.defaultImage.rawValue)
                        .resizable()
                        .imageStyle()
                } else {
                    APIImage(viewModel: viewModel, imageLink: image)
                }
                
                VStack {
                    Spacer().frame(height: 100)
                    TimelineView(.periodic(from: Date.now, by: 1)) { context in
                        Text(context.date, format: .dateTime.day().month().year())
                            .dateFont(fontSize: 24)
                            .offset(x: 0, y: 20)
                        Text(context.date, format:  .dateTime.hour(.conversationalDefaultDigits(amPM: .omitted)).minute())
                            .clockFont(fontSize: 110)
                            .shadow(color: .black.opacity(0.1), radius: 3)
                    }
                    .shadow(color: .primary.opacity(0.20), radius: 20, x: 0, y: 0)
                    
                    // don't use a var to store Date.now bcz it will only store the current time and wont update it, instead directly attach Date.now to view and same goes for using Date.now outside TimelineView.
                    
                    Spacer()
                }
                
                let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestureAction))
                swipeGesture.direction = .down
                swipeGesture.numberOfTouchesRequired = 3
                self.view.addGestureRecognizer(swipeGesture)
                
                @objc func swipeGestureAction(_ gesture: UISwipeGestureRecognizer) {
                    if gesture.numberOfTouchesRequired = gesture.numberOfTouches {
                        NavigationLink(AppRoute.settingsView, value: AppRoute.settingsView)
                            .navigationDestination(for: AppRoute.settingsView) {
                                SettingsView(viewModel: viewModel, hapticCount: 0)
                            }
                    }
                }
                
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button {
                        Task {
                            try await Task.sleep(nanoseconds: UInt64(viewModel.delay * 1_000_000_000))
                            print("tapped1")
                        }
                        image = viewModel.imageLink1
                    } label: {
                        Image(systemName: "flashlight.off.fill")
                            .font(.system(size: 20))
                    }
                    
                    Spacer()
                    
                    Button {
                        Task {
                            try await Task.sleep(nanoseconds: UInt64(viewModel.delay * 1_000_000_000))
                            print("tapped2")
                        }
                        image = viewModel.imageLink2
                    } label: {
                        Image(systemName: "camera.fill")
                            .font(.system(size: 20))
                    }
                }
            }
        }
    }
}

#Preview {
    LockScreenView()
}

