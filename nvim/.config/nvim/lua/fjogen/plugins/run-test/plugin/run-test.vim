" Title:        Run Test Plugin
" Description:  A plugin to run python unittests running inside a docker
" container via docker compose
" Last Change:  3 May 2024
" Maintainer:   Fjoggs <https://github.com/Fjoggs>

" Prevents the plugin from being loaded multiple times. If the loaded
" variable exists, do nothing more. Otherwise, assign the loaded
" variable and continue running this instance of the plugin.
" if exists("g:run_test_plugin")
"     finish
" endif
"
" " command to run our plugin
" command! Runtest lua require'run-test'.runtest()
"
" let &cpo = s:save_cpo " and restore after
" unlet s:save_cpo
"
" let g:run_test_plugin = 1
"
