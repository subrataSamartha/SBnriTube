//
//  File.swift
//  SBnriTube
//
//  Created by subrata Samartha on 28/08/23.
//

import Foundation

class NetworkManager {
    static var shared = NetworkManager()

    
    private init() {}
    
   
    func getVideos(completion: @escaping ((VideosModel?, String?) -> Void)){
        
        
        guard let endPointURL = Bundle.main.url(forResource: "APIRes", withExtension: "json") else {
            completion(nil, "could not find APIResponse.json")
            return
        }
        
        guard let videosURLData = try? Data(contentsOf: endPointURL) else {
            completion(nil, "Counld not convert data")
            return
        }
       
            
        do {
            let myDecoder = JSONDecoder()
            let videosData = try myDecoder.decode(VideosModel.self, from: videosURLData)
            completion(videosData, nil)
        } catch {
            completion(nil, "Error occured while decoding data")
        }
  
    }
}
