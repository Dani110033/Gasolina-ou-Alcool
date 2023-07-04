//
//  ViewController.swift
//  Alcool ou gasolina
//
//  Created by Enzo on 04/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultadosLegendas: UILabel!
    @IBOutlet weak var precoAlcoolCampo: UITextField!
    @IBOutlet weak var precoGasolinaCampo: UITextField!
    
    @IBAction func calcularCombustivel(_ sender: Any) {
        
        if let precoAlcool = precoAlcoolCampo.text {
            if let precoGasolina = precoGasolinaCampo.text {
                
            //validar valores digitados
            let validaCampos = self.validarCampos(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
            
            if validaCampos {
                
                // calcular melhor combustivel
                self .calcularMelhorPreco(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
            } else {
                resultadosLegendas.text = "Digite os preços para calcular!"
                
            }
                
            }
            
        }
        
    }
    
    func calcularMelhorPreco(precoAlcool: String, precoGasolina: String) {
        
        //converter texto valores para numeros
        if let valorAlcool = Double(precoAlcool){
            if let valorGasolina = Double(precoGasolina){
                
                
                /* Faz calculo (precoAlcool / precoGasolina )
                * se resultado >= 0.7 melhor utilizar precoGasolina
                * senão melhor ultilizar precoAlcool
                * */
                let resultadoPreco = valorAlcool / valorGasolina
                if resultadoPreco >= 0.7  {
                    
                    self.resultadosLegendas.text = "Melhor utilizar Gasolina"
                }else {
                    self.resultadosLegendas.text = "Melhor utilizar Alcool"
                }
            }
        }
        
    }
                 
                 func validarCampos (precoAlcool:String , precoGasolina : String) -> Bool{
            
            var camposValidados =  true
            
            
            if precoAlcool.isEmpty{
                camposValidados = false
               
                
            }else if precoGasolina.isEmpty {
                camposValidados = false
                
            }
            
            return camposValidados
        }
        
    
    }
    
    

