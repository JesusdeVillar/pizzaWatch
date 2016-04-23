//
//  QuesoPizzaController.swift
//  PizzaWatch
//
//  Created by Jesús de Villar on 21/4/16.
//  Copyright © 2016 JdeVillar. All rights reserved.
//

import WatchKit
import Foundation

class QuesoPizzaController: WKInterfaceController {

    var quesoPizza = ["Mozzarela","Cheddar","Permaseno","Sin Queso"]
    var masa = ""
    var tamano = ""
    var queso = ""
    
    @IBOutlet var itemPickerQueso: WKInterfacePicker!
    
    @IBOutlet var botonQuesoSiguiente: WKInterfaceButton!
    
    @IBAction func navegaAIngredientes() {
        let valorContexto = Valor(tama: tamano, masa: masa, queso: queso)
        pushControllerWithName("ingredientesPizza", context:valorContexto)

    }
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let c = context as! Valor
        self.tamano = String(c.tamanoPizza)
        self.masa = String(c.tipoMasa)
        print("masa: \(self.masa)")

        var itemArray = [WKPickerItem]()
        
        for queso in quesoPizza {
            let item = WKPickerItem()
            item.title = String(queso)
            itemArray.append(item)
        }
        
        itemPickerQueso.setItems(itemArray)
        
        self.botonQuesoSiguiente.setEnabled(false)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func itemPickerQuesoChanged(value: Int) {
        self.queso = quesoPizza[value]
        //activar el boton
        self.botonQuesoSiguiente.setEnabled(true)
    }
}
