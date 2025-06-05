import elementos.*
class Plaga{
    var poblacion
    method transmiteEnfermedad()=poblacion>=10
    method efectoDeaAtacar(){
        poblacion=poblacion*1.1
    }
    method atacar(unElemento){
        unElemento.recibeAtaqueDe(self)
        self.efectoDeaAtacar()
    }
}

class Cucarachas inherits Plaga{
    var pesoPromedio

    method nivelDaño(){
        return poblacion/2
    }

    override method transmiteEnfermedad(){
        return super() && pesoPromedio>10
    }

    override method efectoDeaAtacar(){
        super()
        pesoPromedio=pesoPromedio+2
    }

}

class Mosquitos inherits Plaga{

    method nivelDaño(){
        return poblacion
    }

    override method transmiteEnfermedad(){
        return poblacion>=10 && poblacion%3==0
    }

}

class Pulgas inherits Plaga{

    method nivelDaño(){
        return poblacion*2
    }

}

class Garrapatas inherits Pulgas{

    override method efectoDeaAtacar(){
        poblacion=poblacion*1.20
    }
}