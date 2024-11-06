'Ejercicio 4a',
let $a := count(/clase/alumnos/alumno)
return $a
,

'Ejercicio 4b',
let $b := count(/clase/asignaturas/asignatura)
return $b
,

'Ejercicio 4d',
let $d := /clase/alumnos/alumno[@cod="n43483437"]
return
<alumno cod="{data($d/@cod)}">
    {
        for $nota in /clase/notas/nota[@alum=$d/@cod]
        let $pepperoni := /clase/asignaturas/asignatura[@cod=$nota/@asig]
        return
        <modulo>
            <nombre_modulo>{data($pepperoni/@nombre)}</nombre_modulo>
            <nota>{data($nota/@calificacion)}</nota>
        </modulo>
    }
</alumno>