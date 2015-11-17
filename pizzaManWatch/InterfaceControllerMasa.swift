//
//  InterfaceControllerMasa.swift
//  pizzaMan
//
//  Created by Juan Diego Merino on 11/16/15.
//  Copyright © 2015 Juan Diego Merino. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceControllerMasa: WKInterfaceController {

    @IBOutlet var pickerWatchOS: WKInterfacePicker!
    
    let masas = ["delgada","crujiente","gruesa"]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        cargarElementosPicker(masas)
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

    
    
    //Funciones propias
    
    //Cargar datos al picker
    func cargarElementosPicker(elementosACargar : [String]) {
        var arrayElementos : [WKPickerItem] = []
        for esteElemento in elementosACargar{
            let elemento = WKPickerItem()
            elemento.title = esteElemento
            arrayElementos.append(elemento)
        }
        pickerWatchOS.setItems(arrayElementos)
    }
    
    var elementoSeleccionado : Int = 0
    
    @IBAction func seleccionoAlgo(value: Int) {
        elementoSeleccionado = value
        print(elementoSeleccionado)
    }
    
    
    @IBAction func siguienteInterfaz() {
        Conocimiento.MiPizza.miPizza.masa = masas[elementoSeleccionado]
        self.pushControllerWithName("queso", context: nil)
    }
    
}
