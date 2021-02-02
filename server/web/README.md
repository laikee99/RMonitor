You need to do these:

+ Set web path to public

+ Set rewrite to index.php

```
if (!-e $request_filename){
		rewrite  ^(.*)$  /index.php?s=$1  last;   break;
	}	
 ```
