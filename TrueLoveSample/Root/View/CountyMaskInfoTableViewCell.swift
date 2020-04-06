//
//  CountyMaskInfoTableViewCell.swift
//  TrueLoveSample
//
//  Created by CHEN YI-SHAIN on 2020/4/7.
//  Copyright © 2020 CHEN YI-SHAIN. All rights reserved.
//

import UIKit

protocol CountyMaskInfoTableViewCellPresentable: TableViewCellPresentable {
    var name: String { get }
    var count: String { get }
}

class CountyMaskInfoTableViewCell: UITableViewCell {

    private var viewModel: CountyMaskInfoTableViewCellPresentable!
    @IBOutlet weak var countyName: UILabel!
    @IBOutlet weak var maskCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(_ viewModel: CountyMaskInfoTableViewCellPresentable) {
        self.viewModel = viewModel
        setupUserInterface()
    }
    
    func setupUserInterface() {
        countyName.text = viewModel.name
        maskCount.text = viewModel.count
    }
}
