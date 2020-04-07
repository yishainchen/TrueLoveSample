//
//  HomePageViewController.swift
//  TrueLoveSample
//
//  Created by CHEN YI-SHAIN on 2020/4/6.
//  Copyright © 2020 CHEN YI-SHAIN. All rights reserved.
//

import UIKit

protocol HomePageScreen: class, ActivityIndicatorPresenter {
    func setupRawInterface(viewModel: HomePageViewControllerViewModel)
}

class HomePageViewController: UIViewController, HomePageScreen {

    @IBOutlet private weak var tableView: UITableView!
    var presenter: HomePagePresenter!
    var viewModel: HomePageViewControllerViewModel?
    var activityIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        showActivityIndicator()
        presenter.getMaskStorageInfo()
    }

    func setupRawInterface(viewModel: HomePageViewControllerViewModel) {
        self.viewModel = viewModel
        self.navigationItem.title = viewModel.rawViewModel.title
        tableView.reloadData()
    }
    
    private func setupTableView() {
        registerCell()
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func registerCell() {
        tableView.register(CountyMaskInfoTableViewCell.nib, forCellReuseIdentifier: CountyMaskInfoTableViewCell.identifier)
    }
}

// MARK: - UITableViewDataSource
extension HomePageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.cellViewModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cellViewModel = viewModel?.cellViewModels[indexPath.row],
            let maskInfoCell = tableView.dequeueReusableCell(withIdentifier: CountyMaskInfoTableViewCell.identifier, for: indexPath) as? CountyMaskInfoTableViewCell {
            maskInfoCell.configure(cellViewModel)
            return maskInfoCell
        }
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension HomePageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let row = viewModel?.cellViewModels[indexPath.row] {
            return row.rowHeight
        }
        return 0
    }
}
