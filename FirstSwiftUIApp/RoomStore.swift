//  RoomStore.swift

import SwiftUI
import Combine

class RoomStore : ObservableObject {
    @Published var rooms = [Room]()
    
    init(rooms: [Room] = []) {
        self.rooms = rooms
    }
}
