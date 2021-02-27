//
//  
//  AndesSliderTypeFactory.swift
//  AndesUI
//
//  Created by Victor Chang on 25/02/2021.
//
//

import Foundation

class AndesSliderTypeFactory {
    static func provide(_ type: AndesSliderType) -> AndesSliderTypeProtocol {
        switch type {
        case .success:
            return AndesSliderTypeSuccess()
        case .error:
            return AndesSliderTypeError()
        }
    }
}
