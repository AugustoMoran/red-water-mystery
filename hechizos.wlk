import direcciones.*
import wollok.game.*

object ninguno {
  method lanzar(jugador) {
    
  }
}
object curacion {
  method lanzar(jugador) {
    const mana = 5
    jugador.darVida(10) + jugador.darVida(jugador.magia())
    jugador.sacarMana(mana)
  }
  method danio(jugador) = 0
}

object fuego {
  var image = "bolaDeFuego.png"
  var property position = game.at(16,16)
  method lanzar(jugador) {
    self.position(jugador.position())
    var direccionALanzar = jugador.ultimaDireccion()
    (1..16).forEach({m => self.moverseHacia(direccionALanzar)})
      self.eliminarBolaDeFuego()  
  }

   method eliminarBolaDeFuego(){
    image = ""
   }

   method moverseHacia(direccion) {
    if (direccion == norte.direcc()) {
        self.position(self.position().up(1))
        
    } else if (direccion == oeste.direcc()) {
        self.position(self.position().left(1))
        
    } else if (direccion == este.direcc()) {
        self.position(self.position().right(1))
        
    } else {
        self.position(self.position().down(1)) 
    } 
  }

  method estaEnBorde() {
    if (self.position() == null){ return false}
    else {
      return self.position().x() <= 0 or self.position().x() >= 15 or
            self.position().y() <= 0 or self.position().y() >= 15
      }
    }
  
  method danio(jugador) = jugador.sacarVida(jugador.magia() * 3)
}


object agua {
  var property image = "" //Agregar imagen del agua
  var property position = game.center()
  
  method lanzar(jugador) {
    if (jugador.mana() >= 10) {
      jugador.sacarMana(10)
      self.position(jugador.position()) // Aparece en la posición del jugador
      game.addVisual(self)

      //Se expande y luego se elimina
      game.schedule(200, {
        self.expandir()
      })
      game.schedule(400, {
        game.removeVisual(self)
      })
    }
  }
  
  method expandir() {
    //Agregar una imagen mas grande, para dar el efecto
  }

  method danio(jugador) = jugador.sacarVida(1.5 * jugador.magia())
}


object teletransportacion {
  
}

