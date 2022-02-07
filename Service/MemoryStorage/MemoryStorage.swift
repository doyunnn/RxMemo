//
//  MemoryStorage.swift
//  RxMemo
//
//  Created by do_yun on 2022/02/07.
//

import Foundation
import RxSwift

class MemoryStorage: MemoStorageType{
    private var list = [
        Memo(content: "hello swift", insertDate: Date().addingTimeInterval(-10)),
        Memo(content: "Lorem", insertDate: Date().addingTimeInterval(-20))
    ]
    
    //배열이 새로운 내용으로 업데이트 되면 새로운 next 이벤트를 방출해야한다 따라서 Subject
    private lazy var store = BehaviorSubject<[Memo]>(value: list)
    
    @discardableResult
    func createMemo(content: String) -> Observable<Memo> {
        let memo = Memo(content: content)
        list.insert(memo, at: 0)
        
        store.onNext(list)
        return Observable.just(memo)
    }
    
    @discardableResult
    func memoList() -> Observable<[Memo]> {
        return store
    }
    
    @discardableResult
    func update(memo: Memo, content: String) -> Observable<Memo> {
        let updated = Memo(original: memo, updatedContent: content)
        
        if let index = list.firstIndex(where: {$0 == memo}){
            list.remove(at: index)
            list.insert(updated, at: index)
        }
        store.onNext(list)
        return Observable.just(updated)
    }
    
    @discardableResult
    func delete(memo: Memo) -> Observable<Memo> {
        if let index = list.firstIndex(where: {$0 == memo}){
            list.remove(at: index)
        }
        store.onNext(list)
        return Observable.just(memo)
    }
    
    
}
