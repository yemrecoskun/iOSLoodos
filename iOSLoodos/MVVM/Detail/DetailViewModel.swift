//
//  DetailViewModel.swift
//  iOSLoodos
//
//  Created by Yunus Emre Coskun on 4.10.2022.
//

import Foundation

public class DetailViewModel: BaseViewModel {
    var homeModel: HomeModel?
    
    public func getHomeModel() -> HomeModel? {
        return homeModel
    }
}
