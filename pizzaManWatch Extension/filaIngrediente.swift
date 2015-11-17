//
//  filaIngrediente.swift
//  pizzaMan
//
//  Created by Juan Diego Merino on 11/16/15.
//  Copyright © 2015 Juan Diego Merino. All rights reserved.
//

import WatchKit

public class filaIngrediente: NSObject {
    
    @IBOutlet var labelIngrediente: WKInterfaceLabel!
    public var valor : String
    public var seleccionado : Bool
    
    init(valor: String) {
        self.valor = valor
        self.seleccionado = false
    }
    
    override init() {
        self.valor = ""
        self.seleccionado = false
    }
    

}
