//
//  InterfaceControllerIngredientes.swift
//  pizzaMan
//
//  Created by Juan Diego Merino on 11/16/15.
//  Copyright © 2015 Juan Diego Merino. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceControllerIngredientes: WKInterfaceController {
    
    @IBOutlet var tablaIngredientes: WKInterfaceTable!
    let ingredientes = ["Pepperoni", "Salami", "Jamón", "Tomate", "Pollo", "Albaca", "Carne de Cerdo", "Tocineta", "Pavo", "Salchicha", "Aceituna", "Cebolla", "Pimiento", "Piña", "Anchoas","Atún","Carne","Champiñon","Maicitos","Chorizo","Esparragos","Extra queso","Lomito","Camarones","Calamares","Palmitos","Salchicha","Tocineta"]
    
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        cargarDatos(ingredientes)
        
        
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
    
    //Funciones personalizadas
    
    //Función para meter la información a la tabla
    func cargarDatos (datos: [String]){
        tablaIngredientes.setNumberOfRows(ingredientes.count, withRowType: "ingrediente")
        for (index,esteIngrediente) in ingredientes.enumerate() {
            let row = tablaIngredientes.rowControllerAtIndex(index) as! filaIngrediente
            row.seleccionado = false
            row.valor = esteIngrediente
            row.labelIngrediente.setText(esteIngrediente)
            
        }
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        let filaSeleccionada = tablaIngredientes.rowControllerAtIndex(rowIndex) as! filaIngrediente
        
        
        if filaSeleccionada.seleccionado { //Si ya estaba seleccionado este ingrediente
            filaSeleccionada.seleccionado = false
            filaSeleccionada.labelIngrediente.setTextColor(UIColor(red: 255, green: 255, blue: 255, alpha: 1))
        }else{ //Si va a ser seleccionado
            if getIngredientesSeleccionados().count < 5 { //Si con este que voy a ingresar no superaré el límite permita la inserción
                filaSeleccionada.seleccionado = true
                filaSeleccionada.labelIngrediente.setTextColor(UIColor(red: 0, green: 255, blue: 0, alpha: 1))
            }else{
                print ("Error más de 5")
                let alertaError = WKAlertAction.init(title: "OK", style: WKAlertActionStyle.Default, handler: {
                    print("error")
                })
                self.presentAlertControllerWithTitle("Muchos ingredientes", message: "Máximo son 5 ingredientes", preferredStyle: .Alert, actions: [alertaError])
            }
        }
        
    }
    
    func getIngredientesSeleccionados() -> [String] {
        var ingredientesSeleccionados : [String] = []
        
        for i in 0 ... ingredientes.count - 1 {
            let fila = tablaIngredientes.rowControllerAtIndex(i) as! filaIngrediente
            
            if fila.seleccionado { //Si está seleccionado incluyala en la lista final
                ingredientesSeleccionados.append(fila.valor)
            }
        }
        return ingredientesSeleccionados
    }
    
    
    @IBAction func siguienteInterfaz() {
        let ingredientesSeleccionados = getIngredientesSeleccionados()
        
        if ingredientesSeleccionados.count == 0 {
            let alertaPocosIngredientes = WKAlertAction.init(title: "OK", style: WKAlertActionStyle.Default, handler: {})
            self.presentAlertControllerWithTitle("Muy pocos ingredientes", message: "Debe seleccionar al menos un ingrediente", preferredStyle: .Alert, actions: [alertaPocosIngredientes])
        }else{
            Conocimiento.MiPizza.miPizza.ingredientes = getIngredientesSeleccionados()
            self.pushControllerWithName("confirmacion", context: nil)
        }
        
    }
    
    
}
