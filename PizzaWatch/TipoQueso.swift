//
//  TipoQueso.swift
//  CreaTuPizza
//
//  Created by Jesús de Villar on 2/4/16.
//  Copyright © 2016 JdeVillar. All rights reserved.
//

import UIKit

class TipoQueso: UITableViewController {

    let tiposQueso: [String] = ["Mozzarela","Cheddar","Parmesano", "sin queso"]
    var tamano:String = ""
    var masa:String = ""
    var tipoQuesoSeleccionado: String = ""
    
    @IBOutlet weak var botonSiguiente: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.botonSiguiente.enabled = false
    }
    
    override func viewWillAppear(animated: Bool) {
        self.botonSiguiente.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tiposQueso.count
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let sigVistaIngredientes=segue.destinationViewController as! VistaIngredientes
         self.tipoQuesoSeleccionado = tiposQueso[(tableView.indexPathForSelectedRow?.row)!]
         sigVistaIngredientes.tipoQueso = self.tipoQuesoSeleccionado
         sigVistaIngredientes.tamanoPizza = tamano
         sigVistaIngredientes.tipoMasa = masa
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = self.tiposQueso[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        botonSiguiente.enabled = true
    }
    

}
