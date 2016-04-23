//
//  marchandoController.swift
//  PizzaWatch
//
//  Created by Jesús de Villar on 23/4/16.
//  Copyright © 2016 JdeVillar. All rights reserved.
//

import WatchKit
import Foundation


class marchandoController: WKInterfaceController {

    @IBAction func MavegaAInicio() {
        pushControllerWithName("inicio", context:nil)
    }
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
