import wollok.game.*
import pantallas.*
import clases.*
import direcciones.*
import hechizos.*
import enemigos.*
import personajes.*

object juego {
    var jugador = arquero
    const enemigos = []
    var enemigosPorGenerar = aranias + orco // genera la cantidad de enemigos que le pases
    var aranias = 2
    var orco = 2

    method jugador() = jugador

    method cambiarJugador(nuevoJugador) {
        jugador = nuevoJugador
    }

    method generarArania() {
        const enemigo = new Arania(
                image = "arania.png",   
                poder = "telarania.png"
            )
            enemigos.add(enemigo)
            game.addVisualCharacter(enemigo)
    }

    method generarOrco() {
        const enemigo = new Orco (
            image = "orco.png",
            poder = "bolaOscura.png"
            )
            enemigos.add(enemigo)
            game.addVisualCharacter(enemigo)
    }
    method generarEnemigo() {
        if (enemigosPorGenerar > 0) { 
            self.generarArania()
            enemigosPorGenerar = (enemigosPorGenerar - 1).max(0)
            self.generarOrco()
            enemigosPorGenerar = (enemigosPorGenerar - 1).max(0)
        } 
    }

    method moverEnemigos() {
        enemigos.copy().forEach({ enemigo => enemigo.moverAleatoriamente() })   // O se puede hacer que persiga al jugador
    }

    method atacarEnemigos() {
    // Hacemos que cada enemigo en la lista lance su ataque
    enemigos.forEach({ enemigo => enemigo.lanzarAtaque() })
}

    method removerEnemigo(enemigo) {
        game.removeVisual(enemigo) // Lo saca de la pantalla
        enemigos.remove(enemigo)   // Lo saca de la lista de enemigos
        //self.verificarPasoDeNivel()
    }

    /*method verificarPasoDeNivel() {
        // Consideramos enemigos "vivos" aquellos que existen en la lista y su método estaVivo() devuelve true
        const enemigosVivos = enemigos.filter({ e => e.estaVivo() })
        if (enemigosVivos.size() == 0) {
            self.pasarDeNivel()
        }
    }

    method pasarDeNivel() {
        // Cambia el fondo actual por el fondo del nivel 2 (jefe)
        game.removeVisual(jugador)
        pantallas.juego().removerVisual()
        pantallas.nivel2().agregarVisual()
        game.schedule(4000, {
            pantallas.nivel2().removerVisual()
            pantallas.juego().agregarVisual()
            game.addVisual(jugador)
        })
    }*/


//Creacion de los personajes


    const guerrero = new Guerrero(
        nombre = "guerrero",
        image = "guerreroeste.png"
    )

    const arquero = new Arquero(
        nombre = "arquero",
        image = "arqueroeste.png"
    )

    const barbaro = new Barbaro(
        nombre = "barbaro",
        image = "barbaroeste.png"
    )

    const mago = new Mago(
        nombre = "mago",
        image = "magoeste.png"
    )

    method iniciarMenu() {
        game.title("gameGeneral")
        game.height(16)
        game.width(16)
        game.cellSize(64)
        pantallas.inicio().agregarVisual()

        keyboard.enter().onPressDo({
            if (pantallas.inicio().hasVisual()){
                pantallas.inicio().removerVisual()
                pantallas.seleccion().agregarVisual()
            }
        })

        keyboard.u().onPressDo({
            if (pantallas.seleccion().hasVisual()) {
                self.cambiarJugador(arquero)
                self.iniciar()
            }
        })

        keyboard.i().onPressDo({
            if (pantallas.seleccion().hasVisual()) {
                self.cambiarJugador(barbaro)
                self.iniciar()
            }
        })

        keyboard.o().onPressDo({
            if (pantallas.seleccion().hasVisual()) {
                self.cambiarJugador(guerrero)
                self.iniciar()
            }
        })

        keyboard.p().onPressDo({
            if (pantallas.seleccion().hasVisual()) {
                self.cambiarJugador(mago)
                self.iniciar()
            }
        })

        keyboard.q().onPressDo({
            if(!pantallas.inicio().hasVisual()){
               game.removeVisual(jugador)
               pantallas.inicio().agregarVisual() 
            }
        })
        /*
        keyboard.x().onPressDo({
            self.pasarDeNivel()
        })
*/    
        
        }

    method iniciar() {
        pantallas.seleccion().removerVisual()
        pantallas.juego().agregarVisual()
        game.addVisualCharacter(jugador)

        keyboard.w().onPressDo({
            jugador.moverseHacia(norte)
        })

        keyboard.s().onPressDo({
            jugador.moverseHacia(sur)
        })

        keyboard.a().onPressDo({
            jugador.moverseHacia(oeste)
        })

        keyboard.d().onPressDo({
            jugador.moverseHacia(este)
        })

        keyboard.j().onPressDo({
            const fuego = new Fuego()
            fuego.lanzar(jugador)  
            
            game.onCollideDo(fuego, { enemigo =>
                enemigo.recibirAtaque(fuego)
            })
        })

        // Generar enemigos cada cierto tiempo
        game.onTick(5000, "generarEnemigo", { self.generarEnemigo() })

        // Mover enemigos
        game.onTick(2000, "moverEnemigos", { self.moverEnemigos() })
        
        // que lancen su poder
        game.onTick(5000, "atacarEnemigos", { self.atacarEnemigos() })
//        game.onTick(6000, "verificarPasoDeNivel", { self.verificarPasoDeNivel() })

        

    }
}