//
//  ViewController.swift
//  exoPlanetProjectOne
//
//  Created by Varun Giridhar on 12/10/18.
//  Copyright © 2018 Varun Giridhar. All rights reserved.
//

import UIKit
import FirebaseDatabase



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    var PlanetIdentifier = [String]()
    var PlanetaryMassJpt = [String]()
    var RadiusJpt = [String]()
    var PeriodDays = [String]()
    var DistFromSunParsec = [String]()
    var Declination = [String]()
    var RightAscension = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(CustomCell.self, forCellReuseIdentifier: "custom")
        getdata()


        
    }

    func getdata(){
        let databaseRef = Database.database().reference()
        
        for x in 1...100{
            
            let ref = databaseRef.child("myarray").child(String(x))
            
            for y in 0...25{
                
                ref.child(String(y)).observe(.value) { (snapshot) in
                    
                    //PlanetIdentifier
                    if(y==0){
                        self.PlanetIdentifier.append(snapshot.value as! String)
                        self.tableView.reloadData()

                    }
                    //PlanetaryMassJpt
                    if(y==2){
                        if let planetarymass = snapshot.value as? NSNumber{
                            let data = planetarymass.stringValue
                            self.PlanetaryMassJpt.append(data)
                        }else{
                            if let stringplantarymass = snapshot.value as? NSString{
                                let data = String(stringplantarymass)
                                self.PlanetaryMassJpt.append(data)
                            }
                        }
                    }
                    
                    //RadiusJpt
                    if(y==3){
                        if let radiusjpt = snapshot.value as? NSNumber{
                            let data = radiusjpt.stringValue
                            let number = NumberFormatter().number(from: data)
                            let numberFloatValue = number?.floatValue
                            let radius = numberFloatValue! * 69911
                            self.RadiusJpt.append(String(radius))
                        }else{
                            if let stringradiusjpt = snapshot.value as? NSString{
                                let data = String(stringradiusjpt)
                                self.RadiusJpt.append(data)
                            }
                        }
                    }
                    
                    //PeriodDays
                    if(y==4){
                        if let perioddays = snapshot.value as? NSNumber{
                            let data = perioddays.stringValue
                            self.PeriodDays.append(data)
                        }else{
                            if let stringperioddays = snapshot.value as? NSString{
                                let data = String(stringperioddays)
                                self.PeriodDays.append(data)
                            }
                        }
                    }
                    //RightAscension
                    if(y==16){
                        if let rightascension = snapshot.value as? NSNumber{
                            let data = rightascension.stringValue
                            self.RightAscension.append(data)
                        }else{
                            if let stringrightascension = snapshot.value as? NSString{
                                let data = String(stringrightascension)
                                self.RightAscension.append(data)
                            }
                        }
                    }
                    //Declination
                    if(y==17){
                        if let declination = snapshot.value as? NSNumber{
                            let data = declination.stringValue
                            self.Declination.append(data)
                        }else{
                            if let stringdeclination = snapshot.value as? NSString{
                                let data = String(stringdeclination)
                                self.Declination.append(data)
                            }
                        }
                    }
                    if(y==18){
                        if let distance = snapshot.value as? NSNumber{
                            let data = distance.stringValue
                            self.DistFromSunParsec.append(data)
                        }else{
                            if let stringdistance = snapshot.value as? NSString{
                                let data = String(stringdistance)
                                self.DistFromSunParsec.append(data)
                            }
                        }
                    }
                    
                    

                    
       
                }
            }
        }
    }
    
    //Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlanetIdentifier.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "custom") as! CustomCell
        cell.planetIdentifier = PlanetIdentifier[indexPath.row]
        




        
        return cell
    }
    
    @IBAction func onButtonTap(_ sender: Any) {
        performSegue(withIdentifier: "tableToAR", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! ARKitViewController
        vc.PlanetIdentifierAR = self.PlanetIdentifier
        vc.PlanetaryMassJptAR = self.PlanetaryMassJpt
        vc.RadiusJptAR = self.RadiusJpt
        vc.PeriodDaysAR = self.PeriodDays
        vc.DistFromSunParsecAR = self.DistFromSunParsec
        vc.DeclinationAR = self.Declination
        vc.RightAscensionAR = self.RightAscension
        
                
            
        }
    }


