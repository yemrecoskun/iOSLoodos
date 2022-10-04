//
//  DetailViewController.swift
//  iOSLoodos
//
//  Created by Yunus Emre Coskun on 3.10.2022.
//

import Foundation
import UIKit

class DetailViewController: BaseViewController {
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareLabel()
    }
    
    public func setViewModel(model: HomeModel?) {
        viewModel.homeModel = model
    }
    
    private func prepareLabel() {
        if let model = viewModel.getHomeModel() {
            pointLabel.text = model.imdbRating
            dateLabel.text = model.released
            titleLabel.text = model.title
            descriptionLabel.text = model.plot
            DispatchQueue.main.async {
                self.navigationItem.title = model.title
                let data = try? Data(contentsOf: URL(string: model.poster)!)
                if let data = data {
                    self.imageView.image = UIImage(data: data)
                }
            }
        }
    }
}
