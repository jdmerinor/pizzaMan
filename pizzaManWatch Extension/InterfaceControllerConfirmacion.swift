//
//  InterfaceControllerConfirmacion.swift
//  pizzaMan
//
//  Created by Juan Diego Merino on 11/16/15.
//  Copyright © 2015 Juan Diego Merino. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceControllerConfirmacion: WKInterfaceController {

    @IBOutlet var labelDescripcionPizza: WKInterfaceLabel!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        labelDescripcionPizza.setText(Conocimiento.MiPizza.miPizza.imprimirPizza())
        
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
    @IBAction func noEstabaBienElPedido() {
        let alertaCocina = WKAlertAction.init(title: "OK", style: WKAlertActionStyle.Default, handler: {
            self.popController()
        })
        self.presentAlertControllerWithTitle("Recfique", message: "Por favor verifique en los pasos anteriores lo que desee modificar a su pedido", preferredStyle: .Alert, actions: [alertaCocina])
    }
    
    @IBAction func siEstabaBienElPedido() {
        let alertaCocina = WKAlertAction.init(title: "OK", style: WKAlertActionStyle.Default, handler: {
            self.popToRootController()
        })
        self.presentAlertControllerWithTitle("En preparación", message: "Su pedido ya fue enviado a cocina para su preparación", preferredStyle: .Alert, actions: [alertaCocina])
    }
    

}
