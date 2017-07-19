//
//  NetworkingServices.swift
//  CollectionView
//
//  Created by NareshNaidu on 03/07/17.
//  Copyright © 2017 NareshNaidu. All rights reserved.
//

import Foundation

typealias JSON  = [String: Any]

class NetworkingSerivce {
    static let shared = NetworkingSerivce()
    private init() {}
    
    func getImgurs(sucess sucessBlock: @escaping (GetImgursRespnse) -> Void) {
        guard let url = URL(string: "https://api.imgur.com/3/gallery/r/cats") else { return }
        var request = URLRequest(url: url)
        request.addValue("Client-ID c55baab2c06d21e" , forHTTPHeaderField: "authorization")
        
        let session = URLSession.shared.dataTask(with: request) { (data,response,error) in
            if let data = data {
                do{
                   guard let jsondata = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? JSON else { return }
                    let getImgursResponse = try GetImgursRespnse(json: jsondata)
                    DispatchQueue.main.async {
                        sucessBlock(getImgursResponse)
                    }
                } catch {
                    print(error)
                }
            }
        }
        session.resume()
    }

func downloadImage(fromLink link: String, sucess sucessBlock: @escaping (UIImage) -> Void) {
    guard let url = URL(string: link) else { return }
    let task = URLSession.shared.dataTask(with: url) { (data,response,error) in
        guard let data = data,
        let image = UIImage(data: data)
        else {return}
        DispatchQueue.main.async {
            sucessBlock(image)
            }
        }
        task.resume()
    }
}



