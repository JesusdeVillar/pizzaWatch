//
//  ConfiramcionPizzaController.swift
//  PizzaWatch
//
//  Created by Jesús de Villar on 23/4/16.
//  Copyright © 2016 JdeVillar. All rights reserved.
//

import WatchKit
import Foundation


class ConfiramcionPizzaController: WKInterfaceController {

    @IBOutlet var tamano: WKInterfaceLabel!
    @IBOutlet var masa: WKInterfaceLabel!
    @IBOutlet var queso: WKInterfaceLabel!
    @IBOutlet var ingredientes: WKInterfaceLabel!
    
    @IBAction func NavegaAInicio() {
        pushControllerWithName("inicio", context:nil)
    }
    
    @IBAction func Canfirmacion() {
        pushControllerWithName("alHorno", context:nil)
    }
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let c = context as! Valor
        
        var tipoQueso = ""
        if c.tipoQueso == "Sin Queso" {
            tipoQueso = c.tipoQueso
        } else {
            tipoQueso = "con Queso \(c.tipoQueso)"
        }
        
        self.tamano.setText("Pizza \(c.tamanoPizza)")
        self.masa.setText("con masa \(c.tipoMasa)")
        self.queso.setText(tipoQueso)
        
        var ingreConcatenados: String = ""
        for i in 0...c.ingredientesSeleccionados.count - 1 {
            if i > 0 {
                if ((i == c.ingredientesSeleccionados.count - 1) && (c.ingredientesSeleccionados.count > 1)){
                    ingreConcatenados = ingreConcatenados + " y "
                } else {
                    ingreConcatenados = ingreConcatenados + ", "
                }
            }
            ingreConcatenados = ingreConcatenados + " \(c.ingredientesSeleccionados[i])"
        }
        self.ingredientes.setText(ingreConcatenados)
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
