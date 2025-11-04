import hechizos.*
import juego.*
import wollok.game.*
import direcciones.*

class Enemigo {
  var property position = self.posicionAleatoria()
  var property vida = 30
  var property image = "arania.png"

  method image() = image

  method moverAleatoriamente() {
    const direcciones = [norte, oeste, sur, este]
    const direccionAleatoria = direcciones.randomized().first()
    direccionAleatoria.mover(self)
  }

  method posicionAleatoria() {
        const x = 0.randomUpTo(game.width())
        const y = 0.randomUpTo(game.height())
        return game.at(x, y)
    }

  method recibirAtaque(hechizo) {
    vida -= hechizo.danio().max(0)
    if (vida <= 0) {
      game.removeVisual(self)
    }
  }
  /* para segundo nivel habria que cambiar este de arriba por este 
  method recibirAtaque(hechizo) {
    vida -= hechizo.danio().max(0)
    if (vida <= 0) {
        game.removeVisual(self)
        juego.verificarPasoDeNivel()
    }
}*/
}

