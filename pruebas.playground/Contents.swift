//: Mini Reto 2: UnVelocímetro
// Dávila Navarro
import UIKit

// 1.- Enumeración de las "velocidades posibles"; corresponden a enteros.
enum Velocidades : Int {
    
    case Apagado = 0
    case VelocidadBaja = 20
    case VelocidadMedia = 50
    case VelocidadAlta = 120
    
    init(velocidadInicial : Velocidades) {
        self = velocidadInicial
        
    }
    
    // A continuación: código para dar retorno e imprimir el valor de la velocidad que se esta presentando en determinado instante.
    var ReporteDeVelocidad : String {
        switch self {
        case .Apagado :
            return "Vehículo apagado"
        case .VelocidadBaja :
            return "Velocidad baja"
        case .VelocidadMedia :
            return "Velocidad media"
        case .VelocidadAlta :
            return "Velocidad alta"
            
        }
    }
}

// Creación de clase "auto".
class Auto {
    
    var velocidad : Velocidades
    var incremento : Bool = true
    
    init() {
        self.velocidad = .Apagado
    }
    
    func cambioDeVelocidad() -> ( actual : Int, velocidadEnCadena : String ) {
        
        let currentSpeed = self.velocidad
        
        // Recordar que "==" es operador condicional "igual" pero = solo es par asignar valores
        
        if incremento {
            if self.velocidad == .Apagado {
                self.velocidad = .VelocidadBaja
            } else if self.velocidad == .VelocidadBaja {
                self.velocidad = .VelocidadMedia
            } else if self.velocidad == .VelocidadMedia {
                self.velocidad = .VelocidadAlta
            } else {
                self.incremento = false
                self.velocidad = .VelocidadMedia
                
            }
        }
        else { if self.velocidad == .VelocidadAlta {
            self.velocidad = .VelocidadMedia
        } else if self.velocidad == .VelocidadMedia {
            self.velocidad = .VelocidadAlta
        } else {
            self.incremento = true
            self.velocidad = .VelocidadBaja
            }
        }
        
        return (currentSpeed.rawValue, currentSpeed.ReporteDeVelocidad)
        
    }
}

// Invocamos a la clase en una constante
let auto: Auto = Auto ()

for i in 1...20 {
    let resultado = auto.cambioDeVelocidad()
    print( " Velocidad: ", resultado.actual, "\t", resultado.velocidadEnCadena   )
}

