//
//  HomePageBuilder.swift
//  TrueLoveSample
//
//  Created by CHEN YI-SHAIN on 2020/4/6.
//  Copyright © 2020 CHEN YI-SHAIN. All rights reserved.
//

import UIKit

protocol HomePageBuilder {
    func buildHomeScreenModule() -> UIViewController
}

final class HomePageDefaultBuilder: HomePageBuilder {
    
    func buildHomeScreenModule() -> UIViewController {
        let view = HomePageViewController(nibName: HomePageViewController.identifier, bundle: nil)
        let interactor = HomePageDefaultInteractor(maskInfoService: MaskInfoService())
        let presenter = HomePageDefaultPresenter(view: view, interactor: interactor)
        view.presenter = presenter
        return view
    }
}

