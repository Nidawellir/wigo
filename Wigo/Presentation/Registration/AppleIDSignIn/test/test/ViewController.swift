//
//  ViewController.swift
//  test
//
//  Created by Apple User on 10/12/23.
//

import UIKit
import AVFoundation

final class ViewController: UIViewController {
    
    private let videoView: VideoRecordingView = .init()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = videoView
        videoView.cameraConfiguration()
    }
}


