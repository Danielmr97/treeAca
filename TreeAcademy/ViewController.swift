//
//  ViewController.swift
//  TreeAcademy
//
//  Created by Daniel Mayo on 28/12/22.
//


import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       // Se configura las imagenes
        let configuration = ARImageTrackingConfiguration()
        
        guard let trakingImage = ARReferenceImage.referenceImages(inGroupNamed: "characters", bundle: Bundle.main )
        else {
            fatalError("no esta la imagen")
        }
        
        
        
        configuration.trackingImages = trakingImage
        configuration.maximumNumberOfTrackedImages = 3
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node =  SCNNode()
        
        if let imageAnchor = anchor as? ARImageAnchor{
            
            let size = imageAnchor.referenceImage.physicalSize
            let plane = SCNPlane(width: size.width, height: size.height)
            plane.firstMaterial?.diffuse.contents = UIColor.blue
            plane.cornerRadius = 0.005
            
            
            let planeNode = SCNNode(geometry: plane)
            planeNode.eulerAngles.x = -.pi / 2
            node.addChildNode(planeNode)
            
            switch imageAnchor.referenceImage.name {
            case "avatar":
                plane.firstMaterial?.diffuse.contents = UIImage(named: "creador")
            case "diplo":
                plane.firstMaterial?.diffuse.contents = UIImage(named: "cursos")
            case "horario":
                plane.firstMaterial?.diffuse.contents = UIImage(named: "horarios")
            case "swift":
                plane.firstMaterial?.diffuse.contents = UIImage(named: "codigo")
            case "xcode":
                plane.firstMaterial?.diffuse.contents = UIImage(named: "xcodes ")
            case "swi":
                plane.firstMaterial?.diffuse.contents = UIImage(named: "tipos")
            default: break
    
            }
                
        }
        
        return node
    }
   
}



