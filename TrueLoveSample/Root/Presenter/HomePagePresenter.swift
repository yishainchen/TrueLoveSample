//
//  HomePagePresenter.swift
//  TrueLoveSample
//
//  Created by CHEN YI-SHAIN on 2020/4/6.
//  Copyright © 2020 CHEN YI-SHAIN. All rights reserved.
//

import Foundation

protocol HomePagePresenter {
    func getMaskStorageInfo()
}

class HomePageDefaultPresenter: HomePagePresenter {
    fileprivate weak var view: HomePageScreen?
    fileprivate var interactor: HomePageInteractor
    
    required init(view: HomePageScreen?, interactor: HomePageInteractor) {
        self.view = view
        self.interactor = interactor
    }
    
    func getMaskStorageInfo() {
        interactor.getMaskStorageInfo { (maskInfoMap) in
            if let maskInfoMap = maskInfoMap {
                let viewModel = HomePageViewControllerViewModelBuilder().buildViewModel(with: maskInfoMap)
                DispatchQueue.main.async {
                    self.view?.setupRawInterface(viewModel: viewModel)
                    self.view?.hideActivityIndicator()
                }
            } else {
                DispatchQueue.main.async {
                    self.view?.hideActivityIndicator()
                }
            }
        }
    }
}
