//
//  MeetingPointModuleOutput.swift
//  Wigo
//
//  Created by Apple User on 8/24/23.
//

import Foundation

protocol MeetingPointModuleOutput: AnyObject {
    func closeMeetingPoint()
    func sendGeolocation(longitude: Double, latitude: Double, address: String)
}
