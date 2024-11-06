for $Ej2 in doc("beatles.xml")//beatles/beatle
return
<span>El beatle {$Ej2/name/firstname/text()} {$Ej2/name/lastname/text()} tiene una web llamada {$Ej2/@link/string()}</span>