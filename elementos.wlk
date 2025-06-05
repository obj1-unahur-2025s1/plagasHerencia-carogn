import plagas.*
class Hogar{
  var nivelMugre
  const confort
  method esBueno(){
    return nivelMugre <= confort/2
  }
  method recibeAtaqueDe(unaPlaga){
    nivelMugre = nivelMugre+unaPlaga.nivelDaño()
  }
}

class Huerta{
  var capacidad
  method esBueno(){
    return capacidad> nivelProduccion.nivel
  }
  method recibeAtaqueDe(unaPlaga){
    if(unaPlaga.transmiteEnfermedad()){
      capacidad= capacidad-10-unaPlaga.nivelDaño()*0.10
    }
    else{
      capacidad= capacidad - unaPlaga.nivelDaño()*0.10
    }
    
  }
}  

object nivelProduccion{
  var property nivel=100
}

class Mascota{
  var nivelSalud

  method esBueno(){
    return nivelSalud>250
  }

  method recibeAtaqueDe(unaPlaga){
    if(unaPlaga.transmiteEnfermedad()){
      nivelSalud=nivelSalud-unaPlaga.nivelDaño()
    }
  }
}

class Barrio{
  const elementos=[]
  method agregarElementos(listaElementos){
    elementos.addAll(listaElementos)
  }
  method eliminarElemento(elemento){
    elementos.remove(elemento)
  }
  method elementosBuenos(){
   return elementos.count({e => e.esBueno()}) 
  }
  method elementosMalos(){
     return elementos.count({e => !e.esBueno()}) 
  }
  method esCopado(){
    return (self.elementosBuenos())>(self.elementosMalos())
  }
}