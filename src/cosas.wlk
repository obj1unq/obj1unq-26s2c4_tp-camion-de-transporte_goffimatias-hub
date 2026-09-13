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