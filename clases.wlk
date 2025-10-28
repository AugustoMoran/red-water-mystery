import direcciones.*
import hechizos.*

class Jugador {
     var imageBase
     var imageAlt
     var image 
     var magia
     var vida 
     var fuerza
     var mana
     var property position = new Position(x=0, y=0)
     var direccionActual = norte

     method alternarImagen() {
          if (image == imageBase) {
               image = imageAlt
          } else {
               image = imageBase
          }
     }

     method moverseHacia(direccion) {
          self.alternarImagen()
          direccion.mover(self)
          direccionActual = direccion
     }

     method direccionActual() = direccionActual

     method vidaMaxima()     // marcador de abstracción
     method manaMaxima()     // marcador de abstracción
     method hechizos()       // marcador de abstracción

     method darVida(cantidad) = (vida + cantidad).min(self.vidaMaxima())
     method sacarVida(cantidad) = (vida - cantidad).max(0)

     method darMana(cantidad) = (mana + cantidad).min(self.manaMaxima())
     method sacarMana(cantidad) = (mana - cantidad).max(0)

     method lanzarHechizo() {
          print("Este jugador no tiene hechizos definidos.")
     }

     method recibirAtaque(hechizo) {
          self.sacarVida(hechizo.danio())
     }

     method estaVivo() = vida > 0
     method puedeLanzar(hechizo) = mana >= hechizo.costo()
}

class Guerrero inherits Jugador {
     override method vidaMaxima() = 80
     override method manaMaxima() = 10
     override method hechizos() = curacion
}

class Arquero inherits Jugador {
     var cantidadDeFlechas = 30
     override method vidaMaxima() = 60
     override method manaMaxima() = 20
     override method hechizos() = teletransportacion
}

class Barbaro inherits Jugador {
     override method vidaMaxima() = 150
     override method manaMaxima() = 0
     override method hechizos() = ninguno
}

class Mago inherits Jugador {
     override method vidaMaxima() = 60
     override method manaMaxima() = 50
     override method hechizos() = #{curacion, fuego, agua, teletransportacion}
     // Podés redefinir hechizos si querés:
     // method hechizos() = #{curacion, fuego, agua, teletransporte, dash, fortaleza}
}
     
