declare namespace local = "docs-structs";



declare function local:remove_punct($phrase as xs:string) as xs:string {replace($phrase, "[\.,\?!\(\):\\@#~¬`£€\$%\^\*=\+«»]+", "")};


declare function local:norm($text as xs:string*) as xs:string*

{for $line in $text
return local:remove_punct($line) => lower-case()};


declare function local:get_words($text as xs:string*) as xs:string*

{for $line in local:norm($text)
for $mot in tokenize($line)
order by $mot
return $mot};


declare function local:build_vocab($text as xs:string*)

{element dictionnaire
{ let $mots := local:get_words($text)
for $mot in distinct-values($mots)
let $freq := count($mots[. eq $mot])
return element mot
{attribute frequence {$freq}, $mot}}
};


local:build_vocab(("Some phrase.", "and AnOtHeR one pHrase?!."))