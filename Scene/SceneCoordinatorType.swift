//
//  SceneCoordinatorType.swift
//  RxMemo
//
//  Created by do_yun on 2022/02/07.
//

import Foundation
import RxSwift

protocol SceneCoordinatorType {
    @discardableResult
    func transition(to scene : Scene, using style: TransitionStyle, animated: Bool) -> Completable
    
    @discardableResult
    func close(animated: Bool) -> Completable
}
