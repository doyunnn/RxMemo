//
//  MemoListViewModel.swift
//  RxMemo
//
//  Created by do_yun on 2022/02/07.
//

import Foundation
import RxSwift
import RxCocoa
import Action

class MemoListViewModel: CommonViewModel{
    var memoList : Observable<[Memo]>{
        return storage.memoList()
    }
    
    func makeCreateAction()->CocoaAction{
        return CocoaAction { _ in
        
            return self.storage.createMemo(content: "")
                .flatMap { memo -> Observable<Void> in
                    let composeViewModel = MemoComposeViewModel(title: "새 메모", sceneCoordinator: self.sceneCoordinator, storage: self.storage, saveAction: self.performUpdate(memo: memo), cancelAction: self.performCancel(memo: memo))
                    let composeScene = Scene.compose(composeViewModel)
                    
                    return self.sceneCoordinator.transition(to: composeScene, using: .modal, animated: true)
                        .asObservable()
                        .map{ _ in }
                }
        }
    }
    func performUpdate(memo: Memo) -> Action<String, Void>{
        return Action { input in
            return self.storage.update(memo: memo, content: input).map { _ in }
        }
    }
    
    func performCancel(memo: Memo)->CocoaAction{
        return Action{
            return self.storage.delete(memo: memo).map { _ in }
        }
    }
}
