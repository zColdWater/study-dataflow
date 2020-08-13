//
//  ViewControllerState.swift
//  AppDataFlow
//
//  Created by Henry.Zhu on 2020/8/13.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation
import UIKit


// Model
struct ViewControllerState {
    
    struct View1State: View1StateProtocol {
        private(set) var name: String
        private(set) var no: String
        private(set) var background: UIColor
    }
    
    struct View2State: View2StateProtocol {
        private(set) var girlName: String
        private(set) var boyName: String
        private(set) var background: UIColor
    }
    
    private(set) var view1IsShow: Bool
    private(set) var view2IsShow: Bool
    var view1State: View1State
    var view2State: View2State
    
}


// Actions
extension ViewControllerState.View1State {
    mutating func actionUpdateName(name: String) {
        self.name = name
    }
    
    mutating func actionUpdateNo(no: String) {
        self.no = no
    }
    
    mutating func actionUpdateBackground(_ color: UIColor) {
        self.background = color
    }
}


// Actions
extension ViewControllerState.View2State {
    mutating func actionUpdateGirlName(girlName: String) {
        self.girlName = girlName
    }
    
    mutating func actionUpdateBoyName(boyName: String) {
        self.boyName = boyName
    }
    
    mutating func actionUpdateBackground(_ color: UIColor) {
        self.background = color
    }
}



// Actions
extension ViewControllerState {
    mutating func actionShowView1(isShow: Bool) {
        view1IsShow = isShow
    }
    
    mutating func actionShowView2(isShow: Bool) {
        view2IsShow = isShow
    }
}
