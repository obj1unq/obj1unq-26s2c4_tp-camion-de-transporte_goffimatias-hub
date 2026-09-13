object knightRider {
	// Consultas
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method estaCargadaEn(unCamion) {
		return unCamion.cosas().contains(self)
	}
}

object bumblebee {
	var transformadoEnAuto = true
	
	// Acciones	
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	
	// Consultas
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method estaCargadaEn(unCamion) {
		return unCamion.cosas().contains(self)
	}
}

object paqueteDeLadrillos {
	var property cantidadDeLadrillos = 0

	// Consultas
	method peso() { 
		return self.calcularPesoTotal() 
	}

	method nivelPeligrosidad() { 
		return 0.max(50 - self.refuerzos())
	}

	method estaCargadaEn(unCamion) {
		return unCamion.cosas().contains(self)
	}

	method refuerzos() {
		if (self.cantidadDeLadrillos() > 1000) {
			return (self.cantidadDeLadrillos() / 50).roundUp(0)
		} else {
			return (self.cantidadDeLadrillos() / 100).roundUp(0)
		}
	}

	method calcularPesoTotal() {
		return self.calcularPesoLadrillos() + self.calcularPesoRefuerzos()
	}

	method calcularPesoLadrillos() {
		return self.cantidadDeLadrillos() * 2
	}

	method calcularPesoRefuerzos() {
		return self.refuerzos() * 10
	}

}
object arenaAGranel {
	var property peso = 0

	method nivelPeligrosidad() { return 1 }
	method estaCargadaEn(unCamion) {
		return unCamion.cosas().contains(self)
	}
}

object bacteriaAntiaerea {
	var tieneMisiles = false

	// Acciones
	method ponerMisiles() {
		tieneMisiles = true
	}	
	
	method quitarMisiles() {
		tieneMisiles = false
	}

	// Consultas
	method peso() {
		return if (self.estaConMisiles()) { 300 } else { 200 } 
	}

	method nivelPeligrosidad() {
		return	if (self.estaConMisiles()) { 100 } else { 0 }
	}

	method estaConMisiles() {
		return tieneMisiles
	}

	method estaCargadaEn(unCamion) {
		return unCamion.cosas().contains(self)
	}
}

object contenedorPortuario {
	const property cosas = []

	// Consultas
	method peso() {
		return 100 + self.pesoTotalDeLasCosas()
	}

	method pesoTotalDeLasCosas() {
		return self.cosas().sum({unaCosa => unaCosa.peso()})
	}

	method nivelPeligrosidad() {
    	return self.cosas().map({unaCosa => unaCosa.nivelPeligrosidad()}).max()
	}

	method estaCargadaEn(unCamion) {
		return unCamion.cosas().contains(self)
	}
}

object radioactivos {
	var property peso = 0

	method nivelPeligrosidad() { return 200 }
	method estaCargadaEn(unCamion) {
		return unCamion.cosas().contains(self)
	}
}

object embalajeDeSeguridad {
    var property cosaEnvuelta = null

    method peso() {
        return cosaEnvuelta.peso()
    }

    method nivelPeligrosidad() {
        return cosaEnvuelta.nivelPeligrosidad() / 2
    }

	method estaCargadaEn(unCamion) {
		return unCamion.cosas().contains(self)
	}
}