//
//  TransitionModel.swift
//  RxMemo
//
//  Created by do_yun on 2022/02/07.
//

import Foundation

enum TransitionStyle{
    case root
    case push
    case modal
}

enum TransitionError : Error{
    case navigationControllerMissing
    case cannotPop
    case unknown
}


