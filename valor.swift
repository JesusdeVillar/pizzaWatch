//
//  valor.swift
//  PizzaWatch
//
//  Created by Jesús de Villar on 20/4/16.
//  Copyright © 2016 JdeVillar. All rights reserved.
//

import WatchKit

class Valor: NSObject {

    var tamanoPizza: String
    var tipoMasa: String
    var tipoQueso: String
    var ingredientesSeleccionados = [String]()
    
    init(tama:String) {
        tamanoPizza = tama
        tipoMasa = ""
        tipoQueso = ""
    }
    
    init(tama:String, masa: String) {
        tamanoPizza = tama
        tipoMasa = masa
        tipoQueso = ""
    }
    
    init(tama:String, masa: String, queso:String) {
        tamanoPizza = tama
        tipoMasa = masa
        tipoQueso = queso
    }
    
    init(tama:String, masa: String, queso:String, ingre: [String]) {
        tamanoPizza = tama
        tipoMasa = masa
        tipoQueso = queso
        ingredientesSeleccionados = ingre
    }
}