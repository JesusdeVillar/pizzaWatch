//
//  MasaPizzaController.swift
//  PizzaWatch
//
//  Created by Jesús de Villar on 20/4/16.
//  Copyright © 2016 JdeVillar. All rights reserved.
//

import WatchKit
import Foundation


class MasaPizzaController: WKInterfaceController {

    var masaPizza = ["Delgada","Crujiente","Gruesa"]
    var masa = ""
    var tamano = ""
    
    @IBOutlet var itemPickerMasa: WKInterfacePicker!
    
    @IBOutlet var botonMasaSiguiente: WKInterfaceButton!
    
    @IBAction func navegaAQueso() {
        let valorContexto = Valor(tama: tamano)
        valorContexto.tipoMasa = masa
        pushControllerWithName("quesoPizza", context:valorContexto)
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let c = context as! Valor
        self.tamano = String(c.tamanoPizza)
        print("tamaño: \(self.tamano)")
 
        var itemArray = [WKPickerItem]()
        
        for masa in masaPizza {
            let item = WKPickerItem()
            item.title = String(masa)
            itemArray.append(item)
        }
        
        itemPickerMasa.setItems(itemArray)
        
        self.botonMasaSiguiente.setEnabled(false)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func itemPickerMasaChange(value: Int) {
        self.masa = masaPizza[value]
        //activar el boton
        self.botonMasaSiguiente.setEnabled(true)
    }
    

}
