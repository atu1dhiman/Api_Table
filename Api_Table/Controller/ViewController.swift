//
//  ViewController.swift
//  Api_Table
//
//  Created by Atul Dhiman on 26/08/22.
//

import UIKit

class ViewController: UIViewController {



    @IBOutlet weak var tableView: UITableView!
    
    let movieViewModel = MovieViewModel()
    let touristViewModel = TouristViewModel()
    let  nationstat = NationViewModel()
    
    var moviedata = [ResultModel]()
    var touristdata = [Datum]()
    var nationdata = [Country]()
    //var tourisDataNew: TouristModel?
    //var nationDataNew : NationModel?
    let sectionTitle = ["Movie Info", "Tourist Info", "Nation Info"]
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.cellload()
        self.MovieGrid()
        self.tourGrid()
        self.nationGrid()
        tableView.dataSource = self
        tableView.delegate = self
        
        
      
    }
    private func reloadtable(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    private func cellload(){
        self.tableView.register(UINib(nibName: "TouristTableViewCell", bundle: nil), forCellReuseIdentifier: "TouristTableViewCell")
        self.tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
        self.tableView.register(UINib(nibName: "NationTableViewCell", bundle: nil), forCellReuseIdentifier: "NationTableViewCell")
    }
    
    func MovieGrid(){
        movieViewModel.parse{
            values in
            self.moviedata = values
            self.reloadtable()
        }
    }
    func tourGrid(){
        touristViewModel.tour{
            values in
            self.touristdata = values
            self.reloadtable()
        }
    }
    func nationGrid(){
        nationstat.nation{
            values in
            self.nationdata = values
            self.reloadtable()
        }
    }


}
extension ViewController : UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            if moviedata.count > 0 {
                return 12
            }
            else{
                return 0
            }
        }
        else if section == 1{
            if touristdata.count > 0 {
                return 4
            }
            else{
                return 0
            }
        }else{
            if nationdata.count > 0 {
                return nationdata.count
            }
            else{
                return 0
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
            if self.moviedata.count > 0{
                let bind = moviedata[indexPath.row]
                //cell.ProfileImg?.image = UIImage(named: bind.artworkUrl100!)
                cell.ArtistLabel?.text = bind.trackName
                cell.KindLabel?.text = bind.artistName
                return cell
            }
            else{
                return UITableViewCell()
            }
            
        }
        else if  indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TouristTableViewCell", for: indexPath) as! TouristTableViewCell
            //guard let tourData = tourisDataNew?.data else {return UITableViewCell()}
            if self.touristdata.count > 0{
                let bind = touristdata[indexPath.row]
                cell.touristnameLabel?.text = bind.createdat
                cell.touristemail?.text = bind.touristName
                return cell
            }else{
                return UITableViewCell()
            }
           
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "NationTableViewCell", for: indexPath) as! NationTableViewCell
            if self.nationdata.count > 0{
                let bind = nationdata[indexPath.row]
                cell.countrylabel?.text = bind.countryID
                //cell.statlabel?.text = bind.probability
                return cell
            }else{
                return UITableViewCell()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: tableView.frame.size.width, height: 30.0))
        view.backgroundColor = .systemMint
        let label = UILabel(frame: CGRect(x: 15, y: 0.0, width: tableView.frame.size.width, height: 40.0))
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = sectionTitle[section]
        label.textColor = .white
        view.addSubview(label)
        return view
    }
    
    
    
}
