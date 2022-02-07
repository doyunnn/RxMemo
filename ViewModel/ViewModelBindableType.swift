//
//  ViewModelBindableType.swift
//  RxMemo
//
//  Created by do_yun on 2022/02/07.
//

import UIKit

// mvvm 패턴으로 구현할 때는 ViewModel을 viewcontroller의 속성으로 추가한다 그런다음 viewmodel과 view를 바인딩한다.
// 이기능을 수행하는 특별한 protocol을 선언
protocol ViewModelBindableType {
    associatedtype viewModelType
    
    var viewModel : viewModelType! {get set}
    func bindViewModel()
    
    
}
extension ViewModelBindableType where Self : UIViewController{
    mutating func bind(viewModel: Self.viewModelType){
        self.viewModel = viewModel
        loadViewIfNeeded()
        
        bindViewModel()
    }
}
