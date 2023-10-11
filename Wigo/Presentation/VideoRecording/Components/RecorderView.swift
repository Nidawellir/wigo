//
//  RecorderView.swift
//  Wigo
//
//  Created by Apple User on 10/5/23.
//

import UIKit
import AVFoundation

open class RecorderView: UIView {
    public private(set) var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    public var recorder: Recorder = {
        var recorder = Recorder()
        return recorder
    }()
    
    public init() {
        super.init(frame: CGRect())
        self.videoPreviewLayer = AVCaptureVideoPreviewLayer(session: self.recorder.captureSession)
        self.videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        if let sublayers = self.layer.sublayers, !sublayers.isEmpty {
            self.layer.insertSublayer(self.videoPreviewLayer!, below: sublayers[0])
        }
        else {
            self.layer.addSublayer(self.videoPreviewLayer!)
        }
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        self.videoPreviewLayer?.frame = CGRect(x: 0, y: 0, width: frame.width , height: frame.height)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

