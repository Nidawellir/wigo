//
//  RecorderViewController.swift
//  Wigo
//
//  Created by Apple User on 10/5/23.
//

import UIKit

open class RecorderViewController: UIViewController {
    public var recorderView: RecorderView = {
        var recorder = RecorderView()
        recorder.translatesAutoresizingMaskIntoConstraints = false
        return recorder
    }()
    
    public var recorder: Recorder {
        return recorderView.recorder
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        recorderView.recorder.captureSession.startRunning()
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        recorderView.recorder.captureSession.stopRunning()
    }
    
    override open func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}

