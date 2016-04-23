//
//  TipoMasa.swift
//  CreaTuPizza
//
//  Created by Jesús de Villar on 2/4/16.
//  Copyright © 2016 JdeVillar. All rights reserved.
//

import UIKit

class TipoMasa: UITableViewController {

    let tiposMasa: [String] = ["Fina","Crujiente","Gruesa"]
    var tamano:String = ""
    var tipoMasaSeleccionada:String = ""
    
    @IBOutlet weak var botonSiguiente: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        botonSiguiente.enabled = false
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
        return tiposMasa.count
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let sigVistaQueso=segue.destinationViewController as! TipoQueso
        
        
        self.tipoMasaSeleccionada = tiposMasa[(tableView.indexPathForSelectedRow?.row)!]
        sigVistaQueso.masa = self.tipoMasaSeleccionada
        sigVistaQueso.tamano = self.tamano
 
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = self.tiposMasa[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        botonSiguiente.enabled = true
    }


}
