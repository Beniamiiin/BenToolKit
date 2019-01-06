//
//  DispatchQueue+EasyApi.swift
//
//  Created by Beniamin Sarkisian on 04/01/2019.
//  Copyright © 2019 bsarkisian.me. All rights reserved.
//

import Foundation

public extension DispatchQueue {
    
    static func asyncAfter(queue: DispatchQueue = .main, delay: TimeInterval, _ completion: @escaping VoidClosure) {
        _ = queue.asyncAfter(deadline: .now() + delay, execute: completion)
    }
    
}
