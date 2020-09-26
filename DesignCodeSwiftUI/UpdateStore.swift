//
//  UpdateStore.swift
//  DesignCodeSwiftUI
//
//  Created by Yaser on 8/28/20.
//  Copyright © 2020 Yaser. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}
