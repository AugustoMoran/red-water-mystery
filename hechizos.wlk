import direcciones.*

object curacion {
  method lanzar(jugador) {
    const mana = 5
    jugador.darVida(10) + jugador.darVida(jugador.magia())
    jugador.sacarMana(mana)
  }
  method danio() = 0
}
object fuego {
  const image = "bolaDeFuego.png"
  var property position = null
  method lanzar(jugador) {
    self.position(jugador.position())
    var direccionALanzar = jugador.ultimaDireccion()
    while (not self.estaEnBorde()){
        self.moverseHacia(direccionALanzar)
    }
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
    else{
    return self.position().x() <= 0 or self.position().x() >= 15 or
           self.position().y() <= 0 or self.position().y() >= 15
    }
  }
  
  method danio(jugador) = jugador.sacarVida(jugador.magia() * 3)
}