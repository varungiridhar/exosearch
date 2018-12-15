//
//  ARKitViewController.swift
//  exoPlanetProjectOne
//
//  Created by Varun Giridhar on 12/12/18.
//  Copyright © 2018 Varun Giridhar. All rights reserved.
//

import UIKit
import ARKit
import SceneKit
class ARKitViewController: UIViewController {
    
    @IBOutlet var distanceLabel: UILabel!
    @IBOutlet var sceneView: ARSCNView!
    var PlanetIdentifierAR = [String]()
    var PlanetaryMassJptAR = [String]()
    var RadiusJptAR = [String]()
    var PeriodDaysAR = [String]()
    var DistFromSunParsecAR = [String]()
    var DeclinationAR = [String]()
    var RightAscensionAR = [String]()

    
    var count = 0
    var planetNode = SCNNode()
    var distanceNode = SCNNode()
    var declinationNode = SCNNode()
    var rightascensionNode = SCNNode()

    var nameNode = SCNNode()
    let material = SCNMaterial()

    override func viewDidLoad() {
        super.viewDidLoad()
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        sceneView.session.run(configuration)

    }
    

    @IBAction func addPlanet(_ sender: Any) {
        //PlanetIdentifier
        var Planetname = PlanetIdentifierAR[count]
        if(Planetname == nil){
            Planetname = ""
        }
        //Radius
        var Planetradius = Float(RadiusJptAR[count])
        if(Planetradius==nil){
            Planetradius = 0.0
        }
        //Distance
        var distance = Float(DistFromSunParsecAR[count])
        if(distance==nil){
            distance = 0.0
        }
        //declination
        var declination = DeclinationAR[count]
        if(declination==nil){
            declination = " "
        }
        //ascension
        var rightascension = RightAscensionAR[count]
        if(rightascension==nil){
            rightascension = ""
        }


       
        makePlanet(name: Planetname, radius: Planetradius!, distance: distance!, declination: declination, rightascension: rightascension)    }
    
    @IBAction func nextPlanet(_ sender: Any) {
        count += 1
        
        //Remove Planet from scene
        planetNode.removeFromParentNode()
        
        //PlanetIdentifier
        var Planetname = "Name : " + PlanetIdentifierAR[count]
        if(Planetname == nil){
            Planetname = ""
        }
        
        //Radius
        var Planetradius = Float(RadiusJptAR[count])
            if(Planetradius==nil){
                Planetradius = 0.0
            }
        //Distance
        var distance = Float(DistFromSunParsecAR[count])
            if(distance==nil){
                distance = 0.0
            }
        //declination
        var declination = DeclinationAR[count]
        if(declination==nil){
            declination = " "
        }
        //ascension
        var rightascension = RightAscensionAR[count]
        if(rightascension==nil){
            rightascension = ""
        }
        

        
        
        makePlanet(name: Planetname, radius: Planetradius!, distance: distance!, declination: declination, rightascension: rightascension)
    }
    
    @IBAction func coordinateView(_ sender: Any) {
        
        
    }
    
    
    
    //Make Planet
    func makePlanet(name : String, radius : Float, distance : Float, declination : String, rightascension : String){
        //Planet
        planetNode = SCNNode(geometry: SCNSphere(radius: CGFloat(radius/69911)))
        planetNode.geometry?.firstMaterial?.diffuse.contents = UIImage.init(named: "EarthDiffuse")
        planetNode.position = SCNVector3(0, 0, -2)//this is in metres
        print(radius)
        sceneView.scene.rootNode.addChildNode(planetNode)

        
        
        //PlanetIdentifier
        let yVectorForName =  ((radius/69911)+0.2)
        let planetText = SCNText(string: name, extrusionDepth: 1)
        material.diffuse.contents = UIColor.white
        planetText.materials = [material]
        nameNode.position = SCNVector3(-0.2, -yVectorForName, -2)
        nameNode.scale = SCNVector3(0.005, 0.005, 0.005)
        nameNode.geometry = planetText
        sceneView.scene.rootNode.addChildNode(nameNode)
        
        //Distance
        let yVectorForDist =  yVectorForName + 0.1
        let distanceText = SCNText(string: "Distance : "+String(distance)+" parsecs", extrusionDepth: 1)
        material.diffuse.contents = UIColor.white
        planetText.materials = [material]
        distanceNode.position = SCNVector3(-0.2, -yVectorForDist, -2)
        distanceNode.scale = SCNVector3(0.005, 0.005, 0.005)
        distanceNode.geometry = distanceText
        sceneView.scene.rootNode.addChildNode(distanceNode)
        
        //Declination
        let yVectorForDeclination =  yVectorForDist + 0.1
        let declinationText = SCNText(string: "Decliantion : "+String(declination), extrusionDepth: 1)
        material.diffuse.contents = UIColor.white
        declinationText.materials = [material]
        declinationNode.position = SCNVector3(-0.2, -yVectorForDeclination, -2)
        declinationNode.scale = SCNVector3(0.005, 0.005, 0.005)
        declinationNode.geometry = declinationText
        sceneView.scene.rootNode.addChildNode(declinationNode)
        
        //RightAscension
        let yVectorForAscension =  yVectorForDeclination + 0.1
        let rightascensionText = SCNText(string: "RightAscension : "+String(rightascension), extrusionDepth: 1)
        material.diffuse.contents = UIColor.white
        rightascensionText.materials = [material]
        rightascensionNode.position = SCNVector3(-0.2, -yVectorForAscension, -2)
        rightascensionNode.scale = SCNVector3(0.005, 0.005, 0.005)
        rightascensionNode.geometry = rightascensionText
        sceneView.scene.rootNode.addChildNode(rightascensionNode)
        
        

        
        

        
        
    }

}
