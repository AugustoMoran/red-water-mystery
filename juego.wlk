import wollok.game.*
import pantallas.*
import clases.*

object juego {
    var jugador = null

    method jugador() = jugador

    method cambiarJugador(nuevoJugador) {
        jugador = nuevoJugador
    }

    method crearGuerrero() {
        jugador = new Guerrero(
            imageBase = "guerreroRPC.png",
            imageAlt = "guerreroRPA.png",
            image = "guerreroRPC.png",
            vida = 80,
            fuerza = 20,
            mana = 10,
            magia = 5,
            position = game.center()
        )
    }

    method crearArquero() {
        jugador = new Arquero(
            imageBase = "arqueroRPC.png",
            imageAlt = "arqueroRPA.png",
            image = "arqueroRPC.png",
            vida = 60,
            fuerza = 15,
            mana = 20,
            magia = 15,
            position = game.center()
        )
    }

    method crearBarbaro() {
        jugador = new Barbaro(
            imageBase = "barbaroRPC.png",
            imageAlt = "barbaroRPA.png",
            image = "barbaroRPC.png",
            vida = 150,
            fuerza = 30,
            mana = 0,
            magia = 0,
            position = game.center()
        )
    }

    method crearMago() {
        jugador = new Mago(
            imageBase = "magoRPC.png",
            imageAlt = "magoRPA.png",
            image = "magoRPC.png",
            vida = 60,
            fuerza = 5,
            mana = 50,
            magia = 30,
            position = game.center()
        )
    }

    method iniciarMenu() {
        game.title("gameGeneral")
        game.height(16)
        game.width(16)
        game.cellSize(64)

        pantallas.inicio().agregarVisual()

        keyboard.enter().onPressDo({
            pantallas.inicio().removerVisual()
            pantallas.seleccion().agregarVisual()
        })

        keyboard.u().onPressDo({
            if (pantallas.seleccion().hasVisual()) {
                self.crearArquero()
                self.iniciar()
            }
        })

        keyboard.i().onPressDo({
            if (pantallas.seleccion().hasVisual()) {
                self.crearBarbaro()
                self.iniciar()
            }
        })

        keyboard.o().onPressDo({
            if (pantallas.seleccion().hasVisual()) {
                self.crearGuerrero()
                self.iniciar()
            }
        })

        keyboard.p().onPressDo({
            if (pantallas.seleccion().hasVisual()) {
                self.crearMago()
                self.iniciar()
            }
        })
    }

    method iniciar() {
        game.ground("fondo.png")
        pantallas.seleccion().removerVisual()
        game.addVisualCharacter(jugador)
    }
}