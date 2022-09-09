//
//  NationViewModel.swift
//  Api_Table
//
//  Created by Atul Dhiman on 02/09/22.
//

import Foundation

struct NationViewModel{
    func nation(comp: @escaping ([Country]) -> () ){
         
        let api = URL(string: "https://api.nationalize.io?name=nathaniel")
        
        URLSession.shared.dataTask(with: api!){
            data, response, error in
            if error != nil{
                print(error?.localizedDescription)
                return
            }
            do{
              let res = try JSONDecoder().decode(NationModel.self, from: data!)
                print(res)
                comp(res.country!)
            }catch{
                
            }
        }.resume()
    }
}
