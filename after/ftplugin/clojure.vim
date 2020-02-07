setlocal wildignore+=out/*,target/*
setlocal makeprg=clj-kondo\ --lint\ %
