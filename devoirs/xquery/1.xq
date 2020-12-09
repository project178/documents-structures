declare namespace local = "docs-structs";

declare function local:remove_punct($phrase as xs:string) as xs:string {replace($phrase, "[\.,\?!\(\):\\@#~¬`£€\$%\^\*=\+«»]+", "")};
declare function local:mot_louchebem($mot as xs:string) as xs:string {if (substring(lower-case($mot), 1, 1) = ("e", "y", "u", "i", "o", "a")) then  "l" || lower-case($mot) || "bem" else "l" || substring(lower-case($mot), 2) || substring(lower-case($mot), 1, 1) || "em"};
declare function local:louchebem($phrase as xs:string*) as xs:string* {for $mot in tokenize(local:remove_punct($phrase), ' ')
return local:mot_louchebem($mot)};

local:louchebem('Louchebem est un argot des bouchers.')