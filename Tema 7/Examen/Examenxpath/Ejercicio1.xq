"Ejercicio 1",
for $Ej1 in doc("books.xml")//catalog/book
where $Ej1/genre!="Computer" and $Ej1/price< 5
return $Ej1/title/text()
,
let $Ej1 := doc("books.xml")//catalog/book[genre!="Computer"]
return count($Ej1[price<5])