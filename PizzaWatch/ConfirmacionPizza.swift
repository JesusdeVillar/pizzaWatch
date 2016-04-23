//
//  ConfirmacionPizza.swift
//  CreaTuPizza
//
//  Created by Jesús de Villar on 31/3/16.
//  Copyright © 2016 JdeVillar. All rights reserved.
//

import UIKit

class ConfirmacionPizza: UIViewController {

    var tamanoPizza: String = ""
    var tipoMasa: String = ""
    var tipoQueso: String = ""
    var ingredientesSeleccionados = [String]()
    
    @IBOutlet weak var tamano: UILabel!
    @IBOutlet weak var masa: UILabel!
    @IBOutlet weak var queso: UILabel!
    @IBOutlet weak var ingredientes: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tamano.text = "Pizza \(tamanoPizza)"
        masa.text = "de Masa \(tipoMasa)"
        if tipoQueso == "sin queso" {
            queso.text = tipoQueso
        } else {
            queso.text = "con Queso \(tipoQueso)"
        }
        
        var concatenaString: String = ""
        print("count: \(ingredientesSeleccionados.count)")
        for var i = 0; i<ingredientesSeleccionados.count; i = i + 1 {
            if i > 0 {
                concatenaString = concatenaString + ", "
            } else if i == ingredientesSeleccionados.count - 1 {
                concatenaString = concatenaString + " y "
            }
            concatenaString = concatenaString + " \(ingredientesSeleccionados[i])"
        }
        ingredientes.text = concatenaString
    }

    /*
    override func viewWillAppear(animated: Bool) {
        tamano.text = String(tamanoPizza)
        masa.text = String(tipoMasa)
        queso.text = String(tipoQueso)
        
    }
    */
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
