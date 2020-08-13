import Foundation
import UIKit

protocol View2Delegate: class {}

protocol View2StateProtocol {
    var girlName: String { get }
    var boyName: String { get }
    var background: UIColor { get }
}

class View2: UIView {
    
    @IBOutlet weak var girlName: UILabel!
    @IBOutlet weak var boyName: UILabel!
    
    weak var delegate: View2Delegate?
    var state: View2StateProtocol? {
        didSet {
            stateUpdate(state: state)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func stateUpdate(state: View2StateProtocol?) {
        updateGirlName(state: state)
        updateBoyName(state: state)
        updateBackground(state: state)
    }
    
    
    // UI 原子操作
    private func updateGirlName(state: View2StateProtocol?) {
        guard let state = state else { return }
        girlName.text = "GirlName:\(state.girlName)"
    }
    
    private func updateBoyName(state: View2StateProtocol?) {
        guard let state = state else { return }
        boyName.text = "BoyName:\(state.boyName)"
    }
    
    private func updateBackground(state: View2StateProtocol?) {
        guard let state = state else { return }
        backgroundColor = state.background
    }
    
}
