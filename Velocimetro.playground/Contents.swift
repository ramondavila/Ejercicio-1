//: Velocímetro: ejercicio semana 4 Curso Swift

import UIKit

enum Velocidades : Int{
    case Apagado = 0
    case VelocidadBaja = 20
    case VelocidadMedia = 50
    case VelocidadAlta = 120
    
    init (velocidadInicial : Velocidades){
        self = velocidadInicial
    }
}

class Auto {
    var velocidad : Velocidades
    
    init(){
        self.velocidad = Velocidades(velocidadInicial: Velocidades.Apagado)
    }
    
    func cambioDeVelocidad() -> (actual: Int, velocidadEnCadena : String){
        
        if self.velocidad == .Apagado {
            self.velocidad = .VelocidadBaja
        } else if self.velocidad == .VelocidadBaja {
            self.velocidad = .VelocidadMedia
        } else if self.velocidad == .VelocidadMedia {
            self.velocidad = .VelocidadAlta
        } else if self.velocidad == .VelocidadAlta {
            self.velocidad = .VelocidadMedia
        }
        
        return (self.velocidad.rawValue, "")
    }
    
    func etiqueta() -> String {
    
        var etiqueta : String
    
        switch(self.velocidad.rawValue){
        case 0:
            etiqueta = "Apagado"
        case 20:
            etiqueta = "Velocidad Baja"
        case 50:
            etiqueta = "Velocidad Media"
        case 120:
            etiqueta = "Velocidad Alta"
        default:
            etiqueta = "Apagado"
        }
        
        return("\(self.velocidad.rawValue), \(etiqueta)")
    }
}

var automovil = Auto()

for _ in 1...20 {
    print(automovil.etiqueta())
    automovil.cambioDeVelocidad()
}
