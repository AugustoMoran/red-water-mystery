import direcciones.*
import wollok.game.*
import enemigos.*

class Hechizo {
  var property image = ""
  var property position = game.at(0,0)
  const property esMalvado
  var property estaVivo = true
  var pasos = 16


method lanzar(jugador) {
    if(self.esMalvado()){ image = jugador.poder()}
    else{ image = jugador.poder() + jugador.ultimaDireccion().nombre() + ".png"}
    position = jugador.position()
    game.addVisual(self)
    self.moverHechizo(jugador.ultimaDireccion())
  }

  method moverHechizo(direccion){
    game.onTick(200, self, { 
        self.moverseHacia(direccion)
        pasos -= 1
        if (pasos <= 0) {
            self.destruir() // Llama al nuevo método destruir
        }
    })
  }

  method destruir() {
    game.removeTickEvent(self) // Detiene este tick en particular
    game.removeVisual(self) // Borra la visual
    self.estaVivo() = false
  }





/*//Otra forma de lanzar los hechizos
method lanzar(jugador) {
    if(self.esMalvado()){ image = jugador.poder()}
    else{ image = jugador.poder() + jugador.ultimaDireccion().nombre() + ".png"}
    position = jugador.position()
    game.addVisual(self)
    self.moverHechizo(jugador)
}

method moverHechizo(jugador){
  const direccionALanzar = jugador.ultimaDireccion()
    if (pasos > 0) {
      game.onTick(200, "generarHechizo", { self.moverseHacia(direccionALanzar) })
      pasos -= 1
    }
    game.schedule(3200, {
        game.removeVisual(self)
    })
}*/

/*if(Enemigo.position() == Hechizo.position()) {
        game.onCollideDo(Hechizo, { objetivo => objetivo.recibirAtaque(Hechizo) })
        game.removeVisual(self)
      }*/
//Otra forma de lanzar los hechizos
/*method lanzar(jugador) {
    if (self.esMalvado()) { image = jugador.poder() }
    else { image = jugador.poder() + jugador.ultimaDireccion().nombre() + ".png" }
    position = jugador.position()
    game.addVisual(self)
    self.moverHechizo(jugador.ultimaDireccion(), pasos) 
  }

  // Mueve el hechizo paso a paso
  method moverHechizo(direccion, pasosRestantes) {
    if (pasosRestantes > 0) {
      self.moverseHacia(direccion) 
      game.schedule(200, { 
        self.moverHechizo(direccion, pasosRestantes - 1) 
      })
    } else {
      game.removeVisual(self)
    }
  }
  */
  method danio() = 1

  // ESTO DEPENDE DE 'direcciones.wlk'
  method moverseHacia(direccion) {

    direccion.mover(self)
  }

  method recibirAtaque(otroHechizo) {
    // Un hechizo no hace nada cuando choca con otro hechizo.
    // Se agrega este método vacío para evitar el error 
    // "MessageNotUnderstoodException" cuando dos hechizos colisionan.
  }

}

class BolaDeFuegoVerde inherits Hechizo {
  override method danio() = 2
}