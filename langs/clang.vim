" https://jonasdevlieghere.com/a-better-youcompleteme-config/
function! s:ccjson()
    !cmake -H. -BDebug -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=YES && mv ./Debug/compile_commands.json . && rm -rf ./Debug
endfunction

command! CCJSON call s:ccjson()
