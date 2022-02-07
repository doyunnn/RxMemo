//
//  Scene.swift
//  RxMemo
//
//  Created by do_yun on 2022/02/07.
//

import UIKit

enum Scene{
    case list(MemoListViewModel)
    case detail(MemoDetailViewModel)
    case compose(MemoComposeViewModel)
}

extension Scene{
    func instantiate(from storyboard: String = "Main") -> UIViewController{
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        
        switch self {
        case .list(let memoListViewModel):
            guard let nav = storyboard.instantiateViewController(withIdentifier: "ListNav") as? UINavigationController else{
                fatalError()
            }
            guard var listVC = nav.viewControllers.first as? MemoListViewController else{
                fatalError()
            }
            
            DispatchQueue.main.async {
                listVC.bind(viewModel: memoListViewModel)
            }

            return nav
        case .detail(let memoDetailViewModel):
            // 네비게이션을 사용하지 않아 고려하지 않음
            guard var detailVC = storyboard.instantiateViewController(withIdentifier: "DetailVC") as? MemoDetailViewController else{
                fatalError()
            }
            
            DispatchQueue.main.async {
                detailVC.bind(viewModel: memoDetailViewModel)
            }
            
            return detailVC
        case .compose(let memoComposeViewModel):
            guard let nav = storyboard.instantiateViewController(withIdentifier: "ComposeNav") as? UINavigationController else{
                fatalError()
            }
            guard var composeVC = nav.viewControllers.first as? MemoComposeViewController else{
                fatalError()
            }
            DispatchQueue.main.async {
                composeVC.bind(viewModel: memoComposeViewModel)
            }
            
            return nav
        }
    }
}
