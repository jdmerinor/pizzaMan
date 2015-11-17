//
//  InterfaceControllerTamanho.swift
//  pizzaMan
//
//  Created by Juan Diego Merino on 11/16/15.
//  Copyright © 2015 Juan Diego Merino. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceControllerTamanho: WKInterfaceController {
    
    let tamanhos = ["chica","mediana","grande"]
    
    @IBOutlet var pickerWatchOS: WKInterfacePicker!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        cargarElementosPicker(tamanhos)
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
        Conocimiento.MiPizza.miPizza.tamanho = tamanhos[elementoSeleccionado]
        self.pushControllerWithName("masa", context: nil)
    }
  
    
}
