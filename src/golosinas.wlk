class Golosina {
	var property peso
	
	method precio() {return 12}
	method peso() {return peso}
	method mordisco() {peso = peso * 0.8}
	method sabor() {return frutilla}
	method libreGluten() {return true}
}



/*
 * Los sabores
 */
object frutilla { }
object chocolate { }
object vainilla { }
object naranja { }
object limon { }


/*
 * Golosinas
 */
class Bombon inherits Golosina{
	
	override method precio() { return 5 }
	override method mordisco() {peso = peso * 0.8 - 1}
}


class Alfajor inherits Golosina{
	
	override method sabor() { return chocolate }
	override method libreGluten() { return false }
}

class Caramelo inherits Golosina{

	override method mordisco() { peso = peso - 1 }
}


class Chupetin inherits Golosina {
	
	override method precio() {return 2}
	override method mordisco() { 
		if (peso >= 2) {
			peso = peso * 0.9
		}
	}
	override method sabor() { return naranja }
}

class Oblea inherits Golosina{
	
	override method precio() { return 5 }
	override method mordisco() {
		if (peso >= 70) {
			// el peso pasa a ser la mitad
			peso = peso * 0.5
		} else { 
			// pierde el 25% del peso
			peso = peso - (peso * 0.25)
		}
	}	
	override method sabor() { return vainilla }
	override method libreGluten() { return false }
}

class Chocolatin inherits Golosina{
	// hay que acordarse de *dos* cosas, el peso inicial y el peso actual
	// el precio se calcula a partir del precio inicial
	// el mordisco afecta al peso actual
	var property pesoInicial
	var comido = 0
	
	override method precio() { return pesoInicial * 0.50 }
	override method peso() { return (pesoInicial - comido).max(0) }
	override method mordisco() { comido = comido + 2 }
	override method sabor() { return chocolate }
	override method libreGluten() { return false }

}

class GolosinaBaniada inherits Golosina{
	var property golosinaInterior
	var pesoBanio = 4
	
	override method precio() { return golosinaInterior.precio() + 2 }
	override method peso() { return golosinaInterior.peso() + pesoBanio }
	override method mordisco() {
		golosinaInterior.mordisco()
		pesoBanio = (pesoBanio - 2).max(0) 
	}	
	override method sabor() { return golosinaInterior.sabor() }
	override method libreGluten() { return golosinaInterior.libreGluten() }	
}


class Tuttifrutti inherits Golosina{
	var property libreDeGluten
	const sabores = [frutilla, chocolate, naranja]
	var saborActual = 0
	
	override method mordisco() { saborActual += 1 }	
	override method sabor() { return sabores.get(saborActual % 3) }	

	override method precio() { return (if(self.libreGluten()) 7 else 10) }
	override method peso() { return 5 }
	override method libreGluten() { return libreDeGluten }	
}
