//
//  ViewController.swift
//  Calculadora
//
//  Created by Jonathan Varela on 4/14/18.
//  Copyright © 2018 Jonathan Varela. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var operacionValor: String = ""
    @IBOutlet weak var Operacion: UILabel!
    @IBOutlet weak var Resultado: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func concatenar(digito: String){
        self.operacionValor = self.Operacion.text!
        self.Operacion.text = self.operacionValor + digito
    }
    
    @IBAction func BorrarTodo(_ sender: UIButton) {
        self.Operacion.text = ""
        self.Resultado.text = "0"
    }
    
    @IBAction func AccionarNumero(_ sender: UIButton) {
        self.concatenar(digito:String(sender.tag))
    }
    
    @IBAction func AccionarOperacion(_ sender: UIButton) {
    }
    
    @IBAction func Calcular(_ sender: UIButton) {
    }
    
}

