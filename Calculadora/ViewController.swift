//  ViewController.swift
//  Calculadora
//  Created by Jonathan Varela on 4/14/18.
//  Copyright © 2018 Jonathan Varela. All rights reserved.

import UIKit

class ViewController: UIViewController {

    var operacionValor: String = ""
    var ultimoDigitoNumero: Bool = false
    @IBOutlet weak var Operacion: UILabel!
    @IBOutlet weak var Resultado: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Operacion.minimumScaleFactor = 0.5
        self.Resultado.minimumScaleFactor = 0.5
        self.Operacion.adjustsFontSizeToFitWidth = true
        self.Resultado.adjustsFontSizeToFitWidth = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func concatenar(digito: String, numero: Bool){
        self.operacionValor = self.Operacion.text!
        if !(self.operacionValor == "" && numero == false) {
            if self.ultimoDigitoNumero == false && numero == false {
                self.operacionValor = String(self.operacionValor.prefix(self.operacionValor.count - 1))
            }
            self.Operacion.text = self.operacionValor + digito
        }
        self.ultimoDigitoNumero = numero
    }
    
    @IBAction func BorrarTodo(_ sender: UIButton) {
        self.Operacion.text = ""
        self.Resultado.text = "0"
    }
    
    @IBAction func AccionarNumero(_ sender: UIButton) {
        self.concatenar(digito:String(sender.tag), numero: true)
    }
    
    @IBAction func AccionarOperacion(_ sender: UIButton) {
        var signoOperacion: String
        switch sender.tag {
        case 10:
            signoOperacion = "÷"
        case 11:
            signoOperacion = "x"
        case 12:
            signoOperacion = "-"
        case 13:
            signoOperacion = "+"
        default:
            signoOperacion = ""
        }
        self.concatenar(digito:signoOperacion, numero: false)
    }
    
    @IBAction func Calcular(_ sender: UIButton) {
        var resultadoFinal: String = self.Operacion.text!
        if resultadoFinal != "" {
            resultadoFinal = resultadoFinal.replacingOccurrences(of: "x", with: "*").replacingOccurrences(of: "÷", with: "/")
            let exp: NSExpression = NSExpression(format: resultadoFinal)
            let result: Double = exp.expressionValue(with: nil, context: nil) as! Double
            self.Resultado.text = String(result)
        }
    }
    
}

