//
//  controladorBienvenida.swift
//  pizzaMan
//
//  Created by Juan Diego Merino on 11/5/15.
//  Copyright © 2015 Juan Diego Merino. All rights reserved.
//

import UIKit

class controladorIngredientes: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var miTableView: UITableView!
    let ingredientes = ["Pepperoni", "Salami", "Jamón", "Tomate", "Pollo", "Albaca", "Carne de Cerdo", "Tocineta", "Pavo", "Salchicha", "Aceituna", "Cebolla", "Pimiento", "Piña", "Anchoas","Atún","Carne","Champiñon","Maicitos","Chorizo","Esparragos","Extra queso","Lomito","Camarones","Calamares","Palmitos","Salchicha","Tocineta"]
    var ingredientesSeleccionados : [String] = []
    @IBOutlet weak var botonOrdenarPizza: UIButton!
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let miCelda = tableView.dequeueReusableCellWithIdentifier("ingrediente", forIndexPath: indexPath)
        if let celdasSeleccionadas = tableView.indexPathsForSelectedRows{ //Si hay elementos seleccionados
            if celdasSeleccionadas.contains(indexPath){//Si la celda que voy a imprimir estaba seleccionada
                miCelda.accessoryType = .Checkmark
            }else{//Si no, asegure que queda limpia
                miCelda.accessoryType = .None
            }
        }
        miCelda.textLabel!.text = ingredientes[indexPath.row]
        return miCelda
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        miTableView.allowsMultipleSelection = true
        botonOrdenarPizza.enabled = false
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //Se selecciona la celda recien seleccionada y se le pone el Checkmark
        let laCeldaSeleccionada = tableView.cellForRowAtIndexPath(indexPath)!
        laCeldaSeleccionada.accessoryType = .Checkmark
        //Se revisa si es el primer elemento seleccionado, de ser así se habilita el botón para ordenar
        let numeroIngredientesSeleccionados = miTableView.indexPathsForSelectedRows!.count
        if numeroIngredientesSeleccionados == 1 {
            botonOrdenarPizza.enabled = true
        }
        
        //Se incluye el ingrediente correspondiente a la lista de ingredientes seleccionados
        if !ingredientesSeleccionados.contains(laCeldaSeleccionada.textLabel!.text!){
            ingredientesSeleccionados.append(laCeldaSeleccionada.textLabel!.text!)
        }
    }
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        
        if let numeroIngredientesSeleccionados = miTableView.indexPathsForSelectedRows{
            if numeroIngredientesSeleccionados.count > 4 { //Con la que se va a agregar quedaría en 5
                //Presentar alerta
                let alertaMaximosIngredientes = UIAlertController(title: "Demasiados ingredientes", message: "Máximo puedes seleccionar 5 ingredientes", preferredStyle: .Alert)
                alertaMaximosIngredientes.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
                self.presentViewController(alertaMaximosIngredientes, animated: true, completion: nil)
                //Devuelve nil indicando que esta fila no será seleccionada
                return nil
            }
        }
        
        return indexPath
    }
    
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        //Se selecciona la celda que va a salir de la selección y se le quita el chulito
        let miCelda = tableView.cellForRowAtIndexPath(indexPath)
        miCelda!.accessoryType = .None
        if let indicesCeldasSeleccionadas = tableView.indexPathsForSelectedRows{
            print("Numero de ingredientes seleccionados actualmente \(indicesCeldasSeleccionadas.count)")
        }else{
            botonOrdenarPizza.enabled = false
        }
        
        if let numeroIngrediente = ingredientesSeleccionados.indexOf(miCelda!.textLabel!.text!){
            ingredientesSeleccionados.removeAtIndex(numeroIngrediente)
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //refresca los ingredientes de la pizza con la selección actual
        Conocimiento.MiPizza.miPizza.ingredientes = ingredientesSeleccionados

        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
}