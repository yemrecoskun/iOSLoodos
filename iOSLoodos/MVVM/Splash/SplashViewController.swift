//
//  ViewController.swift
//  iOSLoodos
//
//  Created by Yunus Emre Coskun on 25.09.2022.
//

import UIKit

class SplashViewController: BaseViewController {
    
    public let viewModel: SplashViewModel = SplashViewModel.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareNetworkConnectionControl {
            self.bindViewModel()
        }
    }
    
    func bindViewModel() {
        loadingStart()
        viewModel.getItemFirebase(key: "return") { value in
            self.loadingStop()
            if let value = value as? String {
                self.addTitleLabel(value)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.goToHomePage()
            }
        }
    }
    
    func addTitleLabel(_ value: String) {
        let title = UILabel()
        title.text = value
        title.numberOfLines = 0
        self.view.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        title.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        title.textAlignment = .center
        title.textColor = .white
    }
    
    
    
    func prepareNetworkConnectionControl(completion: @escaping (()-> ())){
        loadingStart()
        NetworkConnection.networkConnectionControl(completion: { status in
            self.loadingStop()
            
            if !status {
                DispatchQueue.main.async {
                    self.present(AlertView.goToAlert(title: "UYARI",
                                                     message: "Lütfen internet bağlantınızı kontrol ediniz.",
                                                     cancelButtonTitle: "Çıkış",
                                                     cancelButtonAction: { exit(0) },
                                                     buttonTitle: "Tekrar Dene",
                                                     buttonAction: { self.prepareNetworkConnectionControl(completion:{
                        self.bindViewModel()
                    }) }),
                                 animated: true)
                }
            }
            completion()
        })
    }
    
}
