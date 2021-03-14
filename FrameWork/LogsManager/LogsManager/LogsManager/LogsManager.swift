//
//  LogsManager.swift
//  LogsManager
//
//  Created by Usman Tarar on 3/14/21.
//

import Foundation

open class LogsManager {
    public init() {}
    
    open func log(api: String, lat: Double = 0.0, lon: Double = 0.0, time: Int64 = 0, ext: String = "", callback: @escaping ([String: Any]?, Error?) -> Void) {
        let payload: [String: Any] = [
            "lat": lat,
            "lon": lon,
            "time": time,
            "ext": ext,
        ]


        let url = URL(string: api)!

        let session = URLSession.shared

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: payload, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
            callback(nil, error)
        }

        //HTTP Headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request, completionHandler: { data, response, error in

            guard error == nil else {
                callback(nil, error)
                return
            }

            guard let data = data else {
                callback(nil, NSError(domain: "dataNilError", code: -100001, userInfo: nil))
                return
            }

            do {
                //create json object from data
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
                    callback(nil, NSError(domain: "invalidJSONTypeError", code: -100009, userInfo: nil))
                    return
                }
                print(json)
                callback(json, nil)
            } catch let error {
                print(error.localizedDescription)
                callback(nil, error)
            }
        })

        task.resume()
    }
}
