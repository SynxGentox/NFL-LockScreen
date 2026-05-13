//
//  ViewModel.swift
//  NFL-LockScreen
//
//  Created by Aryan Verma on 12/05/26.
//

import Foundation
import Observation

@Observable
final class ViewModel {
    var imageLink1: String = ""
    var imageLink2: String = ""
    var delay: Double = 3
    var backupImage: Wallpaper = .pro17
    var defaultImage: Wallpaper = .pro16
    
}
