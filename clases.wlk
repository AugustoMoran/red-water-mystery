import direcciones.*
import hechizos.*
class Jugador {
     var  imageBase
     var  imageAlt
     var  image 
     var  magia
     var  vida 
     var  fuerza
     var  mana
     var property position = new Position(x=0, y=0)
     var ultimaDireccion = norte
     method alternarImagen() {
          if (image == imageBase) {
               image = imageAlt
          } else {
               image = imageBase
          }
     }


     method ultimaDireccion() = ultimaDireccion

     method moverseHacia(direccion) {
          self.alternarImagen()
          if (direccion == norte.direcc()) {
               self.position(self.position().up(1))
               ultimaDireccion = norte
          } else if (direccion == oeste.direcc()) {
               self.position(self.position().left(1))
               ultimaDireccion = oeste
          } else if (direccion == este.direcc()) {
               self.position(self.position().right(1))
               ultimaDireccion = este
          } else {
               self.position(self.position().down(1))
               ultimaDireccion = sur
          }
     }

     
     method vidaMaxima()
     method darVida(cantidad) = (vida + cantidad).min(self.vidaMaxima())
     method sacarVida(cantidad) = (vida - cantidad).max(0)

      method manaMaxima()
     method darMana(cantidad) = (mana + cantidad).min(self.manaMaxima())
     method sacarMana(cantidad) = (mana - cantidad).max(0)

     method hechizos() 

     method lanzarHechizo() {
          // comportamiento por defecto (puede sobreescribirse)
     }

     method recibirAtaque(hechizo) {
          self.sacarVida(hechizo.danio())
     }
}

class Guerrero inherits Jugador {
     override method manaMaxima() = 10
     override method vidaMaxima() = 80
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

   override  method hechizos() = ninguno
}

class Mago inherits Jugador {

     override method vidaMaxima() = 60

   override  method manaMaxima() = 50


   override  method hechizos() = #{curacion, fuego, agua, teletransportacion}

     // puede redefinir hechizos si se desea, por ejemplo:
     // method hechizos() = #{curacion, fuego, agua, teletransporte, dash, fortaleza}
}
