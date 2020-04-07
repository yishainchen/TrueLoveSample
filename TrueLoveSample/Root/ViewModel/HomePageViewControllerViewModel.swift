//
//  HomePageViewControllerViewModel.swift
//  TrueLoveSample
//
//  Created by CHEN YI-SHAIN on 2020/4/7.
//  Copyright © 2020 CHEN YI-SHAIN. All rights reserved.
//

import Foundation

struct HomePageViewControllerViewModel {
    let cellViewModels: [CountyMaskInfoTableViewCellViewModel]
    
    let rawViewModel: HomePageViewControllerRawInterfaceViewModel
}

final class HomePageViewControllerViewModelBuilder {
    func buildViewModel(with maskInfoMap: [String: Int]) -> HomePageViewControllerViewModel {
        let rawViewModel = HomePageViewControllerRawInterfaceViewModel()
        var cellViewModels = [CountyMaskInfoTableViewCellViewModel]()
        for maskInfo in maskInfoMap {
            let cellViewModel = CountyMaskInfoTableViewCellViewModel(name: maskInfo.key, count: String(maskInfo.value))
            cellViewModels.append(cellViewModel)
        }
        
        return HomePageViewControllerViewModel(cellViewModels: cellViewModels, rawViewModel: rawViewModel)
    }
}

struct HomePageViewControllerRawInterfaceViewModel {
    let title: String = "各縣市超商成人口罩庫存"
}
