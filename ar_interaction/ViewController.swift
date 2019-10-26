//
//  ViewController.swift
//  ar_interaction
//
//  Created by Masaya on 2019/10/26.
//  Copyright © 2019 中山雅也. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    var omniLight: SCNLight!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // デリゲートを設定
        sceneView.delegate = self
        
        // シーンを設定
        sceneView.scene = SCNScene()
        
        // デバッグ用のポイントクラウド表示
        // sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        
        // 平面検出
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        
        // 自動的に環境マップを作成する
        configuration.environmentTexturing = .automatic
        
        // セッションを介しする
        sceneView.session.run(configuration)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        // scnファイルからシーンを読み込む
        let scene = SCNScene(named: "art.scnassets/Space_Invader.scn")
        
        // シーンからノードを検索
        let invaderNode = (scene?.rootNode.childNode(withName: "invader", recursively: false))!
        
        // 検出面の子要素にする
        node.addChildNode(invaderNode)
    }
}
