//
//  CustomCell.swift
//  exoPlanetProjectOne
//
//  Created by Varun Giridhar on 12/10/18.
//  Copyright © 2018 Varun Giridhar. All rights reserved.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    
    var planetIdentifier : String?
    var planetaryMassJpt : String?
    var radiusJpt : String?
    var perioddays : String?



    
    var PlanetIdentifierView : UITextView = {
        var textview = UITextView()
        textview.translatesAutoresizingMaskIntoConstraints = false
        return textview
    }()
    var PlanetaryMassJptView : UITextView = {
        var textview = UITextView()
        textview.translatesAutoresizingMaskIntoConstraints = false
        return textview
    }()
    var RadiusJptView : UITextView = {
        var textview = UITextView()
        textview.translatesAutoresizingMaskIntoConstraints = false
        return textview
    }()
    var PeriodDays : UITextView = {
        var textview = UITextView()
        textview.translatesAutoresizingMaskIntoConstraints = false
        return textview
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(PlanetIdentifierView)
        self.addSubview(PlanetaryMassJptView)
        self.addSubview(RadiusJptView)
        self.addSubview(PeriodDays)



        PlanetIdentifierView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        PlanetIdentifierView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        PlanetIdentifierView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        PlanetIdentifierView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        PlanetaryMassJptView.leftAnchor.constraint(equalTo: self.PlanetIdentifierView.rightAnchor, constant: 10).isActive = true
        PlanetaryMassJptView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        PlanetaryMassJptView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        PlanetaryMassJptView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        RadiusJptView.leftAnchor.constraint(equalTo: self.PlanetaryMassJptView.rightAnchor, constant: 10).isActive = true
        RadiusJptView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        RadiusJptView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        RadiusJptView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        PeriodDays.leftAnchor.constraint(equalTo: self.RadiusJptView.rightAnchor, constant: 10).isActive = true
        PeriodDays.topAnchor.constraint(equalTo: RadiusJptView.bottomAnchor).isActive = true
        PeriodDays.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        PeriodDays.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        

    }
    override func layoutSubviews() {
        super.layoutSubviews()
        if let planetIdentifier = planetIdentifier {
            PlanetIdentifierView.text = planetIdentifier
        }
        if let planetaryMassJpt = planetaryMassJpt{
            PlanetaryMassJptView.text = String(planetaryMassJpt)
        }
        if let radiusJpt = radiusJpt{
            RadiusJptView.text = String(radiusJpt)
        }
        if let perioddays = perioddays{
            PeriodDays.text = String(perioddays)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
