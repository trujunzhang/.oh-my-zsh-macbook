#!/bin/bash

CURRENT=`pwd`

FOLDPATH="$CURRENT/getHttp"

if [ ! -d "$FOLDPATH" ]; then
    mkdir "$FOLDPATH" 

    httpFile="$FOLDPATH/request.http"

    cat > "$httpFile" <<EOF

#
# Response:  GenresResponse<Genre>
# Model:     Genre
# ApiClient: getGenres()
# 
#
GET https://api.themoviedb.org/3/genre/movie/list?api_key=d7ff494718186ed94ee75cf73c1a3214&language=en-US

EOF

    touch "$FOLDPATH/response.json"
    touch "$FOLDPATH/model.json"

fi




