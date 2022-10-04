//
//  BaseViewModel.swift
//  iOSLoodos
//
//  Created by Yunus Emre Coskun on 30.09.2022.
//

import Foundation
import FirebaseDatabase
import FirebaseAnalytics

public class BaseViewModel {
    
    private let database = Database.database().reference()
    var startBack : PublishedCallVoid?
    var stopBack : PublishedCallVoid?
    var genericError : PublishedCallVoid?
    var webService = WebService.init()
    
    public func getItemFirebase(key: String, completion: @escaping (AnyObject) -> ()) {
            startBack?()
            database.child(key).observeSingleEvent(of: .value, with: { result in
                guard let value = result.value as AnyObject? else { return }
                self.stopBack?()
                completion(value)
            })
    }
    
    public func firebaseAnalyticsLogged(model: [String:Any]) {
        Analytics.logEvent("FilmDetail", parameters: model)
    }
}
