import wollok.game.*
import direcciones.*
import hechizos.*
import personajes.*
import pantallas.*

class Jugador {
    const nombre
    var property image
    var property position = game.center()
    var vida = 5
    var direccionActual = este
    method alternarImagen(unaDireccion) {
        image = nombre + unaDireccion.nombre() + ".png"
    }

    // VERIFICAR EL MOVIMIENTO QUE NO SALGA DE PANTALLA

    method moverseHacia(direccion) {
        self.alternarImagen(direccion)
        direccion.mover(self)
        direccionActual = direccion
    }

    method ultimaDireccion() = direccionActual

    method vida() = vida

    method vidaMaxima() = 5  

    method darVida() = (vida + 1).min(self.vidaMaxima())

    method sacarVida(cantidad) {
        vida = (vida - cantidad).max(0)
        pantallas.barraDeVida().actualizarse(self)
    } 

    method recibirAtaque(hechizo) {
        if(self.estaVivo() && hechizo.esMalvado()) {
            self.sacarVida(hechizo.danio())
        } else if (vida == 0) {
            self.morir()
        }
    }

    method morir() {
        image = "charcoSangre.jpg"
    }

    method estaVivo() = vida > 0
    
    method poder()  
}

class Guerrero inherits Jugador { 
    override method poder() = "hacha.png"
}

class Arquero inherits Jugador {
    override method poder() = "flecha.png"
}


class Barbaro inherits Jugador {
     override method poder() = "arania.png"
}

class Mago inherits Jugador {
    override method poder() = "bolaDeFuego.png"

}


