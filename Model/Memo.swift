//
//  Memo.swift
//  RxMemo
//
//  Created by do_yun on 2022/02/07.
//

import Foundation

struct Memo : Equatable{
    var content : String
    var insertDate: Date
    var identity: String
    
    init(content: String, insertDate: Date=Date()){
        self.content = content
        self.insertDate = insertDate
        self.identity = "\(insertDate.timeIntervalSinceReferenceDate)"
    }
    // 업데이트된 내용으로 새로운 메모 인스턴스를 만들 때 사용한다.
    init(original: Memo, updatedContent: String){
        self = original
        self.content = updatedContent
    }
}
