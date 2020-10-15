from codecs import open
from csv import DictReader
from lxml import etree as et

with open("sanisettesparis.csv", encoding="utf8")as inp:
    data = DictReader(inp, delimiter=";")
    wcs = et.Element("toilettes")
    for item in data:
        wc = et.SubElement(wcs, "toilette", type=item["TYPE"], statut=item["STATUT"])
        ad = et.SubElement(wc, "adresse")
        libelle = et.SubElement(ad, "libelle")
        libelle.text = item["ADRESSE"]
        district = et.SubElement(ad, "arrondissement")
        district.text = item["ARRONDISSEMENT"]
        openh = et.SubElement(wc, "horaire")
        openh.text = item["HORAIRE"]
        serv = et.SubElement(wc, "services")
        access = et.SubElement(serv, "acces-pmr")
        access.text = item["ACCES_PMR"]
        bebe = et.SubElement(serv, "relais-bebe")
        bebe.text = item["RELAIS_BEBE"]
        equipement = et.SubElement(wc, "equipement")
        equipement.text = item["URL_FICHE_EQUIPEMENT"]
with open("toilettes-paris.xml", "w", encoding="utf8") as outp:
    outp.write(et.tostring(wcs, pretty_print=True, xml_declaration=True, encoding='UTF-8').decode("utf8"))