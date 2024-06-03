//
//  UserData.swift
//  HandlingUserInput
//
//  Created by qsp on 2024/6/2.
//

import Foundation
import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = Landmark.list
}
