<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron"  queryBinding="xslt2" xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:pattern>
        <sch:rule context="TEI">
            <sch:assert test="teiHeader and text">le document doit contenir des éléments teiHeader et text</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern>
        <sch:rule abstract="true" id="p">
            <sch:assert test="./p">L'élément <sch:name/> doit avoir un enfant paragraphe.</sch:assert>
        </sch:rule>
        <sch:rule context="sp">
            <sch:extends rule="p"/>
        </sch:rule>
        <sch:rule context="projetDesc">
            <sch:extends rule="p"/>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern abstract="true" id="div-act">
        <sch:rule context="$div">
            <sch:assert test="./head">un élémént <sch:name/> doit avoir un enfant head</sch:assert>
            <sch:assert test="count(./div/@type='scene') > 1">un élément <sch:name/> doit contenir plusieurs scenes</sch:assert>
        </sch:rule>       
    </sch:pattern>
    
    <sch:pattern is-a="div-act" id="act"><sch:param name="$div" value="div[@type='act']"/></sch:pattern>
</sch:schema>