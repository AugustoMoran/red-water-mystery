object norte {
  method mover(jugador) {
    jugador.position(jugador.position().up(1))
  }
}

object sur {
  method mover(jugador) {
    jugador.position(jugador.position().down(1))
  }
}

object este {
  method mover(jugador) {
    jugador.position(jugador.position().right(1))
  }
}

object oeste {
  method mover(jugador) {
    jugador.position(jugador.position().left(1))
  }
}