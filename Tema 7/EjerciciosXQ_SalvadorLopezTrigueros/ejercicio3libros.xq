'Ejercicio 3a',
for $a in doc('/home/salva/Escritorio/Lenguaje de marcas/Tema 7/ejercicio_3/ejercicio_3_libros.xml')//bib/libro/titulo
return $a/text(),

'Ejercicio 3b',
for $b in doc('/home/salva/Escritorio/Lenguaje de marcas/Tema 7/ejercicio_3/ejercicio_3_libros.xml')//bib/libro
where $b/@year = '2000'
return $b/titulo,

'Ejercicio 3c',
for $c in doc('/home/salva/Escritorio/Lenguaje de marcas/Tema 7/ejercicio_3/ejercicio_3_libros.xml')//bib/libro
where $c/@year >= '1995' and $c/@year <= '2000'
return $c,

'Ejercicio 3d',
for $d in doc('/home/salva/Escritorio/Lenguaje de marcas/Tema 7/ejercicio_3/ejercicio_3_libros.xml')//bib/libro
where $d/autor/apellido='Stevens'
return $d/titulo/text(),

'Ejercicio 3e',
for $e in doc('/home/salva/Escritorio/Lenguaje de marcas/Tema 7/ejercicio_3/ejercicio_3_libros.xml')//bib/libro
let $Addison := $e/editorial = 'Addison-Wesley'
where $Addison
return $e
,

'Ejercicio 3f',
for $f in doc('/home/salva/Escritorio/Lenguaje de marcas/Tema 7/ejercicio_3/ejercicio_3_libros.xml')//bib/libro[count(autor) = 1]
order by number($f/precio)
return $f/titulo,

'Ejercicio 3g',
for $g in doc('/home/salva/Escritorio/Lenguaje de marcas/Tema 7/ejercicio_3/ejercicio_3_libros.xml')//bib/libro[count(autor) >= 2]
order by $g/titulo
return $g/titulo,

'Ejercicio 3h',
for $libro in doc('/home/salva/Escritorio/Lenguaje de marcas/Tema 7/ejercicio_3/ejercicio_3_libros.xml')//bib/libro
return
    <libro>
        <titulo>{$libro/titulo/text()}</titulo>
        <anio>{$libro/@year}</anio>
        <numero_autores>{count($libro/autor)}</numero_autores>
    </libro>
    ,
'Ejercicio 3j',
<resumen_bib>
{
    for $libro in doc('/home/salva/Escritorio/Lenguaje de marcas/Tema 7/ejercicio_3/ejercicio_3_libros.xml')//bib/libro
    return
        <libro>
            <titulo>{$libro/titulo/text()}</titulo>
            <autores>
                {
                    let $autores := $libro/autor
                    return
                        if (count($autores) = 1) then
                            <apellido>{$autores/apellido/text()}</apellido>
                        else if (count($autores) = 2) then
                            (
                                <apellido>{$autores[1]/apellido/text()}</apellido>,
                                <apellido>{$autores[2]/apellido/text()}</apellido>
                            )
                        else
                            (
                                <apellido>{$autores[1]/apellido/text()}</apellido>,
                                <apellido>{$autores[2]/apellido/text()}</apellido>,
                                <apellido>et al.</apellido>
                            )
                }
            </autores>
        </libro>
}
</resumen_bib>,

'Ejercicio 3k',
<resumen_bib_com>
{
    for $libro in doc('/home/salva/Escritorio/Lenguaje de marcas/Tema 7/ejercicio_3/ejercicio_3_libros.xml')//bib/libro
    return
        <libro>
            <titulo>{$libro/titulo/text()}</titulo>
            <editorial>{$libro/editorial/text()}</editorial>
            {
                let $c := doc('/home/salva/Escritorio/Lenguaje de marcas/Tema 7/ejercicio_3/ejercicio_3_libros_comentarios.xml')//entrada[$libro/titulo = titulo]
                return
                if(count($c) > 0) then
               
                  for $comentario in $c
                  return
                      <comentario>{$comentario/comentario/text()}</comentario>
                else
                    <sin_comentario/>
            }
        </libro>
}
</resumen_bib_com>,

'Ejercicio 3l',
for $libro in doc('/home/salva/Escritorio/Lenguaje de marcas/Tema 7/ejercicio_3/ejercicio_3_libros.xml')//bib/libro
where some $autor in $libro/autor satisfies $autor/apellido = 'Stevens'
return
    <libro>
        <titulo>{$libro/titulo/text()}</titulo>
    </libro>
,    

'Ejercicio 3m',
for $m in doc('/home/salva/Escritorio/Lenguaje de marcas/Tema 7/ejercicio_3/ejercicio_3_libros.xml')//bib/libro
where every $autor in $m/autor satisfies $autor/apellido = 'Stevens'
return
  <libro>
      <titulo>{$m/titulo/text()}</titulo>
  </libro>
,

'Ejercicio 3n',
for $n in doc('/home/salva/Escritorio/Lenguaje de marcas/Tema 7/ejercicio_3/ejercicio_3_libros.xml')//bib/libro
let $distintos := distinct-values($n/autor/apellido)
return $distintos
,

'Ejercicios 3oEmpty',
for $o in doc('/home/salva/Escritorio/Lenguaje de marcas/Tema 7/ejercicio_3/ejercicio_3_libros.xml')//bib/libro
let $noautor := empty($o[autor])
return $noautor
,

'Ejercicios 3oExist',
for $o in doc('/home/salva/Escritorio/Lenguaje de marcas/Tema 7/ejercicio_3/ejercicio_3_libros.xml')//bib/libro
let $siautor := exists($o[autor])
return $siautor

  
