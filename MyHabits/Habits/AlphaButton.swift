

import UIKit
class AlphaButton: UIButton {
    override var isSelected: Bool {
        didSet {
            alpha = isSelected ? 0.7 : 1.0
        }
    }
}
