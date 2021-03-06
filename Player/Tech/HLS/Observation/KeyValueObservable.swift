//
//  KeyValueObservable.swift
//  Player
//
//  Created by Fredrik Sjöberg on 2017-04-07.
//  Copyright © 2017 emp. All rights reserved.
//

import Foundation

/// Defines an object which has `ObservableKeys` to use with `KVO`
internal protocol KeyValueObservable {
    /// Specifies observable keys
    associatedtype ObservableKeys
}
