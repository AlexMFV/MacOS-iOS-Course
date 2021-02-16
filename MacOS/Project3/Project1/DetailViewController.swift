//
//  DetailViewController.swift
//  Project1
//
//  Created by Alex Valente on 14/02/2021.
//

import Cocoa

class DetailViewController: NSViewController {
    @IBOutlet var imageView: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    func imageSelected(name: String){
        imageView.image = NSImage(named: name)
    }
    
}
