//
//  Conocimiento.swift
//  pizzaMan
//
//  Created by Juan Diego Merino on 11/8/15.
//  Copyright © 2015 Juan Diego Merino. All rights reserved.
//

import UIKit

public class Conocimiento {
    struct MiPizza {
        static var miPizza = Pizza()
        
    }
    
    class var pizza: Pizza {
        get { return MiPizza.miPizza }
        set { MiPizza.miPizza = newValue }
    }
    
    
    
}
