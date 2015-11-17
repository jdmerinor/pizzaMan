//
//  Pizza.swift
//  pizzaMan
//
//  Created by Juan Diego Merino on 11/5/15.
//  Copyright © 2015 Juan Diego Merino. All rights reserved.
//

import Foundation

public class Pizza{
    var tamanho : String?
    var masa : String?
    var queso : String?
    var ingredientes : [String] = [] //Maximo 5 elementos
    
    
    func imprimirPizza () -> String{
        var pizza = "Su pizza es \(self.tamanho!) con masa \(self.masa!), queso \(self.queso!) y los siguientes ingredientes: \n\n"
        for esteIngrediente in self.ingredientes{
            pizza.appendContentsOf("\(esteIngrediente) \n")
        }
        return pizza
    }
    
}

