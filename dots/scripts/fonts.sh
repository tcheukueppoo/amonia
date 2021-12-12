#!/usr/bin/env sh
cooper='https://www.fontsquirrel.com/fonts/download/cooper-hewitt'
nerdfantasque='https://github-releases.githubusercontent.com/27574418/3c441e80-4532-11ea-95eb-9509124fad6a?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20211024%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20211024T223957Z&X-Amz-Expires=300&X-Amz-Signature=a349f56c2755bc207a0cc3a62484421664a4f8f2db31eb599342b06cf80c39b2&X-Amz-SignedHeaders=host&actor_id=90014847&key_id=0&repo_id=27574418&response-content-disposition=attachment%3B%20filename%3DFantasqueSansMono.zip&response-content-type=application%2Foctet-stream'

command -V wget && {
	cd /tmp
	#wget "$cooper"
	wget "$nerdfantasque"
}
