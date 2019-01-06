//
//  Constants.swift
//
//  Created by Beniamin Sarkisian on 04/01/2019.
//  Copyright © 2019 bsarkisian.me. All rights reserved.
//

import UIKit
import Foundation

public enum Alpha: CGFloat {
    case hide = 0.0
    case show = 1.0
    case half = 0.5
}

public enum Animation: TimeInterval {
    case none = 0.0
    case `default` = 0.3
}

public enum Delay: TimeInterval {
    case none = 0.0
    case bit = 0.1
}
