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
