import Foundation
import UIKit

protocol View1Delegate: class {}

protocol View1StateProtocol {
    
    var name: String { get }
    var no: String { get }
    var background: UIColor { get }
    
}

class View1: UIView {
    
    @IBOutlet weak var nameTitle: UILabel!
    @IBOutlet weak var noTitle: UILabel!
    
    weak var delegate: View1Delegate?
    var state: View1StateProtocol? {
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
    
    private func stateUpdate(state: View1StateProtocol?) {
        updateNameTitle(state: state)
        updateNoTitle(state: state)
        updateBackground(state: state)
    }
    
    
    // UI 原子操作
    private func updateNameTitle(state: View1StateProtocol?) {
        guard let state = state else { return }
        nameTitle.text = "Name:\(state.name)"
    }
    
    private func updateNoTitle(state: View1StateProtocol?) {
        guard let state = state else { return }
        noTitle.text = "No.\(state.no)"
    }
    
    private func updateBackground(state: View1StateProtocol?) {
        guard let state = state else { return }
        backgroundColor = state.background
    }
}
