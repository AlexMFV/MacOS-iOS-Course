//
//  Pin.swift
//  Project5
//
//  Created by Alex Valente on 17/02/2021.
//

import Cocoa
import MapKit

class Pin: NSObject, MKAnnotation {
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    var color: NSColor
    
    init(title: String, coords: CLLocationCoordinate2D, color: NSColor = NSColor.green) {
        self.title = title
        self.coordinate = coords
        self.color = color
    }
}
