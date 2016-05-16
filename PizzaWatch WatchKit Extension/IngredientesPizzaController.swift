//
//  IngredientesPizzaController.swift
//  PizzaWatch
//
//  Created by Jesús de Villar on 21/4/16.
//  Copyright © 2016 JdeVillar. All rights reserved.
//

import WatchKit
import Foundation


class IngredientesPizzaController: WKInterfaceController {

    var ingredientesPizza = ["jamón","pepperoni","pavo","salchicha", "aceituna", "cebolla", "pimiento", "piña", "anchoa"]
    var masa = ""
    var tamano = ""
    var queso = ""
    var ingredientes = [String]()
    var ingredientesSeleccionados = [Int]()
    let maxIngreSelect = 5
    
    @IBOutlet var itemsIngredientes: WKInterfaceTable!
    @IBOutlet var botonIngreSiguiente: WKInterfaceButton!
    
    @IBAction func navegaAConfirmacion() {
        //litas de ingrdientes
        
        for ingre in ingredientesSeleccionados {
            let nombre = ingredientesPizza[ingre]
            ingredientes.append(nombre)
        }
        
        print(ingredientes)
        
        let valorContexto = Valor(tama: tamano, masa: masa, queso: queso, ingre: ingredientes)
        pushControllerWithName("confirmacionPizza", context:valorContexto)

    }
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let c = context as! Valor
        self.tamano = String(c.tamanoPizza)
        self.masa = String(c.tipoMasa)
        self.queso = String(c.tipoQueso)
        print("queso: \(self.queso)")
        self.ingredientesSeleccionados.removeAll()

        itemsIngredientes.setNumberOfRows(ingredientesPizza.count, withRowType: "row")
        
        for i in 0 ..< ingredientesPizza.count {
            let row = itemsIngredientes.rowControllerAtIndex(i) as? rowController
            let labelValue = ingredientesPizza[i]
            row!.rowLabel.setText(labelValue)
        }
        
        self.botonIngreSiguiente.setEnabled(false)
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int){
        let row = itemsIngredientes.rowControllerAtIndex(rowIndex) as? rowController
        var pos = 0
        //se introduce en nuevo elemnto en un array
        //si existe en el array se selecciona
        if ingredientesSeleccionados.contains(rowIndex) {
            pos = ingredientesSeleccionados.indexOf(rowIndex)!
            ingredientesSeleccionados.removeAtIndex(pos)
            row!.rowLabel.setTextColor(UIColor.whiteColor())
        //si no existe se deselecciona
        } else {
            if (ingredientesSeleccionados.count < maxIngreSelect) {
            ingredientesSeleccionados.append(rowIndex)
            row!.rowLabel.setTextColor(UIColor.greenColor())
            }
        }
        
        if (ingredientesSeleccionados.count > 0){
            self.botonIngreSiguiente.setEnabled(true)
        } else {
            self.botonIngreSiguiente.setEnabled(false)
        }
        print(rowIndex)
    }
}
