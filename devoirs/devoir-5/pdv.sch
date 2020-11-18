<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <sch:pattern>
        <sch:rule context="pdv_liste/pdv/fermeture">
            <sch:assert test="not(text())">Un élément <sch:name/> ne doit pas contenir un text.</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern>
        <sch:rule context="pdv_liste/pdv/ouverture">
            <sch:assert test="@debut and @fin">Un élément <sch:name/> doit toujours avoir le début et le fin.</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern>
        <sch:rule context="pdv_liste/pdv">
            <sch:report test="not(ouverture/@saufjour='' and fermeture/@*)" role="warn">
                les points de vente sont ouverts tous les jours et devraient prendre des vacances</sch:report>
        </sch:rule>
        
        <sch:rule context="pdv_liste/pdv/ville">
            <sch:report test="text() != upper-case(text())" role="warn">
                les noms des villes devraient être tous en majuscule pour la consistance</sch:report>
        </sch:rule>
    </sch:pattern>
</sch:schema>