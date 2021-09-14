//
//  File.swift
//  MyHabits
//
//  Created by Vadim on 09.08.2021.
//

import UIKit
class AlphaButton: UIButton {
    override var isSelected: Bool {
        didSet {
            alpha = isSelected ? 0.7 : 1.0
        }
    }
}
