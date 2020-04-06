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
    
    required init(interactor: HomePageInteractor) {
        self.interactor = interactor
    }
    
    func getMaskStorageInfo() {
        interactor.getMaskStorageInfo()
    }
}
