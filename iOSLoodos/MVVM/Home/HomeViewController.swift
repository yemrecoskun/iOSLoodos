//
//  HomeViewController.swift
//  iOSLoodos
//
//  Created by Yunus Emre Coskun on 30.09.2022.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    var viewModel = HomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    func bindViewModel() {
        viewModel.homeModelResponse = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.loadingStop()
            }
        }
        viewModel.error = { [weak self] in
            DispatchQueue.main.async {
                self?.present(AlertView.goToAlert(title: "HATA",
                                                  message: "Film bulunamadı!",
                                                  buttonTitle: "TAMAM"),
                                 animated: true)
                self?.loadingStop()
            }
        }
    }
    
    @IBAction func onClickSearch(_ sender: Any) {
        loadingStart()
        if let text = textField.text {
            viewModel.getSearchFilm(value: text)
        }
    }
}

extension HomeViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsTableModel()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let result = viewModel.selectRowsTableModel(indexPath.row){
            
        if let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell {
            let data = try? Data(contentsOf: URL(string: result.poster)!)
            if let data = data {
                tableViewCell.imageViews.image = UIImage(data: data)
                tableViewCell.imageViews.contentMode = .scaleAspectFill
                tableViewCell.imageViews.layer.cornerRadius = 15.0
                tableViewCell.imageViews.layer.masksToBounds = true
            }
            tableViewCell.headerLabel.text = result.title
            tableViewCell.descriptionLabel.text = result.actors
            tableViewCell.dateLabel.text = result.released
            return tableViewCell
        }
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.firebaseAnalyticsLogged(model: ["film" : viewModel.homeModel?.title as Any])
        performSegue(withIdentifier: "DetailVC", sender: nil)
    }
}

// MARK: segue
extension HomeViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailVC" {
            if let detailViewController = segue.destination as? DetailViewController {
                detailViewController.setViewModel(model: viewModel.homeModel)
            }
        }
    }
}
