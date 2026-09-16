import cosas.*

object camion {
	const property cosas = []
	const pesoMaximo = 2500
	const tara = 1000

	// Validaciones
	method validarPesoLimite(unaCosa) {
		return self.capacidadDisponible() < unaCosa.peso()
	}

	// Acciones
	method cargar(unaCosa) {
		if (self.validarPesoLimite(unaCosa)) {
        	self.error("El objeto supera el peso máximo permitido por el camión")
    	}
		cosas.add(unaCosa)
		unaCosa.transformar()
	}

	method descargar(unaCosa){
		if (not unaCosa.estaCargadaEn(self)) {
			self.error("El objeto no está cargado en el camión")
		}
		cosas.remove(unaCosa)
	}

	// Consultas
	method pesoTotal(){
		return tara + self.pesoDeCargaActual()
	}

	method pesoDeCargaActual() {
		return cosas.sum({ unaCosa => unaCosa.peso() })
	}

	method excedidoDePeso() {
		return self.pesoTotal() > pesoMaximo
	}

	method objetosPeligrosos(nivel) {
		return cosas.filter({ unaCosa => unaCosa.nivelPeligrosidad() > nivel })
	}

	method objetosMasPeligrososQue(cosa) {
		return cosas.filter({ unaCosa => unaCosa.nivelPeligrosidad() > cosa.nivelPeligrosidad() })
	}

	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return self.objetosPeligrosos(nivelMaximoPeligrosidad).isEmpty()
	}

	method capacidadDisponible() {
		return pesoMaximo - self.pesoTotal()
	}

	// Agregados 
	method tieneAlgoQuePesaEntre(min, max) {
		return self.cosas().any({ unaCosa => unaCosa.peso().between(min, max) })
	}

	method cosaMasPesada() {
		return self.cosas().max({cosa => cosa.peso()})
	}

	method totalBultos() {
		return self.cosas().sum({ unaCosa => unaCosa.bultos() })
	}

	method pesos() {
		return cosas.map({cosa => cosa.peso()})
	}
}
