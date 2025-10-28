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

<<<<<<< HEAD
class Guerrero inherits Jugador {
     override method manaMaxima() = 10
     override method vidaMaxima() = 80
     override method hechizos() = curacion
}
class Arquero inherits Jugador {
=======
class Guerrero inherits jugador {
     var property imageBase = "guerreroRPC.png"
     var property imageAlt = "guerreroRPA.png"
     var property image = imageBase

     var property position = new Position(x=4, y=7)

     var vida = 80
     method vidaMaxima() = 80

     var fuerza = 20

     var mana = 10
     method manaMaxima() = 10

     var magia = 5
     method magia() = magia

     method hechizos() = curacion
}

class Arquero inherits jugador {
     var property imageBase = "arqueroRPC.png"
     var property imageAlt = "arqueroRPA.png"
     var property image = imageBase

     var property position = new Position(x=5, y=7)

     var vida = 60
     method vidaMaxima() = 60

     var fuerza = 15

     var mana = 20
     method manaMaxima() = 20

     var magia = 5
     method magia() = magia

>>>>>>> ed4d89b27b794ebdfe599d4b26a3b2b808b7cc2a
     var cantidadDeFlechas = 30
   override method vidaMaxima() = 60
   override method manaMaxima() = 20
     override method hechizos() = teletransportacion
}

<<<<<<< HEAD
class Barbaro inherits Jugador {
    override method vidaMaxima() = 150
     override method manaMaxima() = 0
=======
class Barbaro inherits jugador {
     var property imageBase = "barbaroRPC.png"
     var property imageAlt = "barbaroRPA.png"
     var property image = imageBase
>>>>>>> ed4d89b27b794ebdfe599d4b26a3b2b808b7cc2a

   override  method hechizos() = ninguno
}

<<<<<<< HEAD
class Mago inherits Jugador {
=======
class Mago inherits jugador {
     var property imageBase = "magoRPC.png"
     var property imageAlt = "magoRPA.png"
     var property image = imageBase
>>>>>>> ed4d89b27b794ebdfe599d4b26a3b2b808b7cc2a

     override method vidaMaxima() = 60

   override  method manaMaxima() = 50


   override  method hechizos() = #{curacion, fuego, agua, teletransportacion}

     // puede redefinir hechizos si se desea, por ejemplo:
     // method hechizos() = #{curacion, fuego, agua, teletransporte, dash, fortaleza}
}
