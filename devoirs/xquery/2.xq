for $juicer in doc('../../04-XPath/xml/juicers.xml')/juicers/juicer
    where contains($juicer/name, "Juicer")
    order by xs:float($juicer/cost)
return string($juicer/@id)