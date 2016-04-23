//
//  TamanoPizzaController.swift
//  PizzaWatch
//
//  Created by Jesús de Villar on 14/4/16.
//  Copyright © 2016 JdeVillar. All rights reserved.
//

import WatchKit
import Foundation


class TamanoPizzaController: WKInterfaceController {
    
    @IBOutlet var itemsTamanos: WKInterfacePicker!
    
    @IBOutlet var botonSiguiente: WKInterfaceButton!
    
    var tamanosPizza = ["Chica","Medina","Grande"]
    var tamano = ""
    
    @IBAction func navegaAMasa() {
        let valorContexto = Valor(tama: tamano)
        pushControllerWithName("masaPizza", context:valorContexto)
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)

        var itemArray = [WKPickerItem]()
        
        for tamano in tamanosPizza {
            let item = WKPickerItem()
            item.title = String(tamano)
            itemArray.append(item)
        }
        
        itemsTamanos.setItems(itemArray)
        
        self.botonSiguiente.setEnabled(false)
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

    @IBAction func pickerValueChanged(value: Int) {
        self.tamano = tamanosPizza[value]
        //activar el boton
        self.botonSiguiente.setEnabled(true)
    }
}
