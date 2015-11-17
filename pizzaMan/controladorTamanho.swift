//
//  controladorBienvenida.swift
//  pizzaMan
//
//  Created by Juan Diego Merino on 11/5/15.
//  Copyright © 2015 Juan Diego Merino. All rights reserved.
//

import UIKit

class controladorTamanho: UIViewController {
    
    @IBOutlet weak var tamanhoSeleccionado: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        Conocimiento.MiPizza.miPizza.tamanho = tamanhoSeleccionado.titleForSegmentAtIndex(tamanhoSeleccionado.selectedSegmentIndex)
        print(Conocimiento.MiPizza.miPizza.tamanho)
    }
    
}