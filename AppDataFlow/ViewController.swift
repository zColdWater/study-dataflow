//
//  ViewController.swift
//  AppDataFlow
//
//  Created by Henry.Zhu on 2020/8/13.
//  Copyright © 2020 Henry. All rights reserved.
//

import UIKit

protocol ViewControllerDelegate: class {
    func result(_ result: ViewController.Result)
}

class ViewController: UIViewController {
    
    struct Result {}
    
    var state: ViewControllerState? {
        didSet {
            stateUpdate(state: self.state)
        }
    }
    
    @IBOutlet weak var view1: View1!
    @IBOutlet weak var view2: View2!
    @IBOutlet weak var textfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func stateUpdate(state: ViewControllerState?) {
        layoutViews(state: state)
        updateSubviews(state: state)
    }
    
    private func layoutViews(state: ViewControllerState?) {
        guard let state = state else { return }
        showView1(state.view1IsShow)
        showView2(state.view2IsShow)
    }
    
    private func updateSubviews(state: ViewControllerState?) {
        guard let state = state else { return }
        view1.state = state.view1State
        view2.state = state.view2State
    }
    
}


extension ViewController {
    
    // UI Input Event 输入事件
    @IBAction func switchAction(_ sender: UISwitch) {
        state?.actionShowView1(isShow: sender.isOn)
        state?.actionShowView2(isShow: sender.isOn)
    }
    
    @IBAction func editingChanged(_ sender: UITextField) {
        guard let text = sender.text else { return }
        switch text {
        case "view1:blue":
            state?.view1State.actionUpdateBackground(.blue)
        case "view2:pink":
            state?.view2State.actionUpdateBackground(.systemPink)
        case "Name:":
            state?.view1State.actionUpdateName(name: text)
        case "No":
            state?.view1State.actionUpdateNo(no: text)
        case "GirlName":
            state?.view2State.actionUpdateGirlName(girlName: text)
        case "BoyName":
            state?.view2State.actionUpdateBoyName(boyName: text)
        default:
            print("No Match!")
        }
    }
    
}


// Setups
private extension ViewController {

    func setup() {
        setupState()
        setupView1()
        setupView2()
    }
    
    func setupState() {
        let view1State = ViewControllerState.View1State(name: "Henry.Zhu", no: "1", background: .yellow)
        let view2State = ViewControllerState.View2State(girlName: "Huahua", boyName: "Henry", background: .cyan)
        state = ViewControllerState(view1IsShow: true, view2IsShow: true, view1State: view1State, view2State: view2State)
    }
    
    func setupView1() {
        view1.delegate = self
    }
    
    func setupView2() {
        view2.delegate = self
    }
    
}


// UI Atomic Operator
private extension ViewController {
    
    func showView1(_ isShow: Bool) {
        if isShow {
            view1.isHidden = false
        } else {
            view1.isHidden = true
        }
    }
    
    func showView2(_ isShow: Bool) {
        if isShow {
            view2.isHidden = false
        } else {
            view2.isHidden = true
        }
    }
    
}


extension ViewController: View1Delegate {
    
}

extension ViewController: View2Delegate {
    
}
