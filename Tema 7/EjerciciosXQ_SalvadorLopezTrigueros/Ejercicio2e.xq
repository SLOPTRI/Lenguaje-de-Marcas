for $baile1 at $i in doc('ejercicio_2_bailes.xml')/bailes/baile
where $baile1/profesor='Jesús Lozano' 
return
<bailes_lozano profesor= '{$baile1/profesor/text()}'>
  <baile num='{$i}'>
    <nombre>'{$baile1/nombre/text()}'</nombre>
    <plazas>'{$baile1/plazas/text()}'</plazas>
    <duracion>De '{$baile1/comienzo/text()}' A '{$baile1/fin/text()}'</duracion>
  </baile>
</bailes_lozano>,

for $baile2 at $i in doc('ejercicio_2_bailes.xml')/bailes/baile
where $baile2/precio/@cuota='trimestral'
order by $baile2/plazas
return 
<html>
  <body>
    <table>
      <tr>
        <td>'{$baile2/nombre/text()}'</td>
        <td>'{$baile2/profesor/text()}'</td>
        <td>'{$baile2/plazas/text()}'</td>
      </tr>
     </table>
  </body>
</html>
