//
//  SettingView.swift
//  NFL-LockScreen
//
//  Created by Aryan Verma on 12/05/26.
//

import SwiftUI

struct SettingsView: View {
    @Bindable var viewModel: ViewModel
    @FocusState var isKeyboardFocused: Bool
    @State var hapticCount: Int
    
    var body: some View {
        Form {
            Section("Image Links") {
                TextField("Image Link - 1", text: $viewModel.imageLink1)
                    .focused($isKeyboardFocused)
                
                TextField("Image Link - 2", text: $viewModel.imageLink2)
                    .focused($isKeyboardFocused)
            }
            Section("Delay on image change: \((viewModel.delay).formatted(.number))") {
                Slider(value: $viewModel.delay, in: 0...10, step: 1)
            }
            
            Section("Note: make sure default and backup image should be different") {
                VStack(alignment: .leading) {
                    Picker("Select default Lockscreen Wallpaper", selection: $viewModel.defaultImage) {
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach (Wallpaper.allCases, id: \.self) { image in
                                    ZStack {
                                        Image(image.rawValue)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 150, height: 250)
                                            .clipped()
                                            .onTapGesture {
                                                withAnimation(.bouncy) {
                                                    viewModel.defaultImage = image
                                                }
                                            }
                                        if viewModel.defaultImage == image {
                                            Image(systemName: "checkmark.circle.fill")
                                                .foregroundStyle(.blue)
                                                .scaleEffect(1.3)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .pickerStyle(.inline)
                    .padding(.bottom)
                    Divider()
                    Picker("Select wallpaper (If API fails)", selection: $viewModel.backupImage) {
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach (Wallpaper.allCases, id: \.self) { image in
                                    ZStack {
                                        Image(image.rawValue)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 150, height: 250)
                                            .clipped()
                                            .onTapGesture {
                                                withAnimation(.bouncy) {
                                                    viewModel.backupImage = image
                                                }
                                            }
                                        if viewModel.backupImage == image {
                                            Image(systemName: "checkmark.circle.fill")
                                                .foregroundStyle(.blue)
                                                .scaleEffect(1.3)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .pickerStyle(.inline)
                }
            }
        }
        .navigationTitle("Settings")
        .toolbarRole(.editor)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                if isKeyboardFocused {
                    Button(role: .confirm) {
                        isKeyboardFocused.toggle()
                        hapticCount += 1
                    } label: {
                        Image(systemName: "checkmark")
                    }
                    .buttonStyle(.glassProminent)
                    .sensoryFeedback(.success, trigger: hapticCount)
                }
            }
        }
    }
}

#Preview {
    let viewModel = ViewModel()
    NavigationStack {
        SettingsView(viewModel: viewModel, hapticCount: 0)
    }
}
