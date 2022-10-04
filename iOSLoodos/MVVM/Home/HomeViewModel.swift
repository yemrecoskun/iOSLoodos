//
//  HomeViewModel.swift
//  iOSLoodos
//
//  Created by Yunus Emre Coskun on 30.09.2022.
//

import Foundation

public class HomeViewModel: BaseViewModel {
    var homeModelResponse : PublishedCallVoid?
    var homeModel: HomeModel?
    var error: PublishedCallVoid?
    func getSearchFilm(value: String) {
        let request = HomeRequest(value)
        webService.Request(queryItems: request, requestModel: request) { (result: ResponseModel<HomeModel>) in
            if result.isStatus == .success {
                if let response = result.response {
                    self.homeModelResponse?()
                    self.homeModel = response
                }
            } else {
                self.error?()
            }
        }
    }
    
    func numberOfRowsTableModel() -> Int {
        return homeModel != nil ? 1 : 0
    }
    
    func selectRowsTableModel(_ index : Int) -> HomeModel? {
        return homeModel 
    }
}
