//
//  UserProfile.swift
//  DesignCodeSwiftUI
//
//  Created by Yaser on 9/14/20.
//  Copyright © 2020 Yaser. All rights reserved.
//

import SwiftUI
import  Combine

class UserProfile: ObservableObject{
    @Published var isLogged = UserDefaults.standard.bool(forKey: "isLogged") {
        didSet {
            UserDefaults.standard.set(self.isLogged, forKey: "isLogged")
        }
    }
    @Published var showLogin = false
}
