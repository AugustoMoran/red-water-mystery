import hechizos.*
import juego.*
import wollok.game.*
import direcciones.*

class Enemigo {
  var property position = self.posicionAleatoria()
  var property vida = 3
  var property image
  const poder // debe retornar una imagen 
  var ultimaDireccion = sur

  method image() = image

  method poder() = poder 

  method ultimaDireccion() = ultimaDireccion

  method moverAleatoriamente() {
    const direcciones = [norte, oeste, sur, este]
    const direccionAleatoria = direcciones.randomized().first()
    direccionAleatoria.mover(self)
    ultimaDireccion = direccionAleatoria
    self.lanzarAtaque()
  }

  method posicionAleatoria() {
        const x = 0.randomUpTo(game.width())
        const y = 0.randomUpTo(game.height())
        return game.at(x, y)
    }

  method sacarVida() { 
    vida = (vida - 1).max(0) 
    
    if (vida == 0) {
      // Cuando muere, delegamos en el objeto juego para que lo remueva de la lista y la pantalla
      juego.removerEnemigo(self)
      game.schedule(4000, {
      game.addVisual("charcoSangre.jpg")
      game.removeVisual("charcoSangre.jpg")       
        })
    }}

    method recibirAtaque(hechizo) {
      if (vida > 0 && !hechizo.esMalvado()) {
        self.sacarVida()
      }
    }
/*
  method morir() {
    game.removeVisual(self)
    //no aparece el charco
    game.schedule(4000, {
      game.addVisual("charcoSangre.jpg")
      game.removeVisual("charcoSangre.jpg")       
        })
    
  }*/
  method vida() = vida
  method estaVivo() = vida > 0

  method lanzarAtaque() {
    
  }
  

  /* para segundo nivel habria que cambiar este de arriba por este 
  method recibirDanio() {
    vida -= hechizo.danio().max(0)
    if (vida <= 0) {
        game.removeVisual(self)
        juego.verificarPasoDeNivel()
    }
}*/
}

class Arania inherits Enemigo {
  override method poder() = "telaarania.png"
  
  override method sacarVida() {
    super()
    game.schedule(200, { self.image("araniadanio.png") })
    game.schedule(400, { self.image("arania.png") })
    if (vida == 0) {
      juego.removerEnemigo(self)
    }
  }
  
}

class Orco inherits Enemigo {
  override method poder() = "bolaOscura.png"

override method sacarVida() {
    super()
    game.schedule(200, { self.image("orcoDanio.png") })
    game.schedule(400, { self.image("orco.png") })
    if (vida == 0) {
      // Cuando muere, delegamos en el objeto juego para que lo remueva de la lista y la pantalla
      juego.removerEnemigo(self)
    }
  }
}

