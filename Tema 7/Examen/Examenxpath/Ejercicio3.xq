"Ejercicio 3",
for $Ej3 in doc("records.xml")//records/record/country
order by $Ej3
group by $Ej3
return
<span>El pais {$Ej3} se repite {count(doc("records.xml")//records/record[country = $Ej3])} veces con los siguientes nombres
{
for $x in doc("records.xml")//records/record
where $x/country = $Ej3
return 
<b>
{$x/name/text()}
</b>
}
</span>