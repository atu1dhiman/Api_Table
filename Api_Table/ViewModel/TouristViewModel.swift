//
//  TouristViewModel.swift
//  Api_Table
//
//  Created by Atul Dhiman on 02/09/22.
//

import Foundation

struct TouristViewModel{
    func tour(comp: @escaping ([Datum]) -> () ){
         
        let api = URL(string: "http://restapi.adequateshop.com/api/Tourist?page=2")
        
        URLSession.shared.dataTask(with: api!){
            data, response, error in
            if error != nil{
                print(error?.localizedDescription)
                return
            }
            do{
              let res = try JSONDecoder().decode(TouristModel.self, from: data!)
                print(res)
                comp(res.data!)
            }catch{
                
            }
        }.resume()
    }
}
