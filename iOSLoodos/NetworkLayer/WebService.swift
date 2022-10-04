//
//  WebService.swift
//  iOSLoodos
//
//  Created by Yunus Emre Coskun on 30.09.2022.
//

import Foundation

public class WebService {
    private static let url = "https://www.omdbapi.com/"
    private static var queryItems =  [URLQueryItem(name: "apikey", value: "a0c8873b")]
    
    func Request <T: Encodable,U: Decodable,V: Encodable> (api: String? = nil, queryItems: V? = nil, requestModel: T? = nil, completion: @escaping (ResponseModel<U>) -> ()){
        if let url = URL(string: WebService.url + (api ?? "")) {
            if var urls = URLComponents(string: WebService.url) {
                if let jsonQueryItems = try? JSONSerialization.jsonObject(with: JSONEncoder().encode(queryItems)) as? [String: Any] ?? [:] {
                    urls.queryItems = WebService.queryItems + jsonQueryItems.map({URLQueryItem(name: $0.key, value: $0.value as? String)})
                }
                var request = URLRequest(url: urls.url!)
                if let requestModel = requestModel {
                    request.httpMethod = "POST"
                    do {
                        request.httpBody = try JSONEncoder().encode(requestModel)
                        
                    } catch {
                        print("WEB SERVICE ERROR LOG: Don't Json Encoder requestModel")
                        completion(ResponseModel(isStatus: .fail))
                    }
                }
                URLSession.shared.dataTask(with: request) { (data, response, error) in
                    if error != nil {
                        completion(ResponseModel(isStatus: .fail))
                    } else if let data = data {
                        let model = try? JSONDecoder().decode(U.self, from: data)
                        if let model = model{
                            completion(ResponseModel(isStatus: .success, response: model))
                            return
                        }
                    }
                    completion(ResponseModel(isStatus: .fail))
                }.resume()
            }
        }
    }
}
