//
//  controladorConfirmacion.swift
//  pizzaMan
//
//  Created by Juan Diego Merino on 11/10/15.
//  Copyright © 2015 Juan Diego Merino. All rights reserved.
//

import UIKit

class controladorConfirmacion : UIViewController{
    
    @IBOutlet weak var campoDescripcionPizza: UITextView!
    
    @IBAction func volverARevisar(sender: UIButton) {
        self.navigationController!.popViewControllerAnimated(true)
        self.navigationController?.navigationBarHidden = false
    }
    
    
    @IBAction func Realizarpedido(sender: UIButton) {
        let alertaPedidoExitoso = UIAlertController(title: "Pedido exitoso", message: "Su pedido a sido realizado con éxito, si desea puede pedir más pizzas 😀", preferredStyle: .Alert)
        let accionBotonOK = UIAlertAction(title: "Ok", style: .Default) { (action) in
            // pop here
            if let navController = self.navigationController {
                navController.popToRootViewControllerAnimated(true)
                self.navigationController?.navigationBarHidden = false
            }
        }
        alertaPedidoExitoso.addAction(accionBotonOK)
        self.presentViewController(alertaPedidoExitoso, animated: true, completion: nil)
        
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        campoDescripcionPizza.text = Conocimiento.MiPizza.miPizza.imprimirPizza()
        
    }
}
