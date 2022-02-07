//
//  MemoListViewModel.swift
//  RxMemo
//
//  Created by do_yun on 2022/02/07.
//

import Foundation
import RxSwift
import RxCocoa

class MemoListViewModel: CommonViewModel{
    var memoList : Observable<[Memo]>{
        return storage.memoList()
    }
}
