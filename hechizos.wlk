import direcciones.*
import wollok.game.*

class Hechizo {
  var property image = ""
  var property position = game.at(0,0)
  const property esMalvado
  const pasos = 16

method lanzar(jugador) {
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
      game.schedule(100, { 
        self.moverHechizo(direccion, pasosRestantes - 1) 
      })
    } else {
      game.removeVisual(self)
    }
  }

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