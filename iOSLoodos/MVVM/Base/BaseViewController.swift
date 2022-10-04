//
//  BaseViewController.swift
//  iOSLoodos
//
//  Created by Yunus Emre Coskun on 29.09.2022.
//

import UIKit

class BaseViewController: UIViewController {
    
    public let loading : Loading = Loading()
    public let baseViewModel : BaseViewModel = BaseViewModel.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModels()
    }
    
    public func loadingStart() {
        DispatchQueue.main.async {
            self.loading.show(view: self.view)
        }
    }
    
    public func loadingStop() {
        loading.hide()
    }
    
    func bindViewModels() {
        baseViewModel.genericError = { [weak self] in
            DispatchQueue.main.async {
                self?.present(AlertView.goToAlert(title: "HATA",
                                                     message: "Fatal Error!"),
                                 animated: true)
            }
        }
    }
    
    func goToHomePage() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true, completion: nil)
        }
    }
}
