fe:
	cd 3botlogin_frontend && npm run serve
be:
	cd 3botlogin_backend && python3 .
dependencies:
	cd 3botlogin_frontend && npm install 
submodules:
	git submodule update --init --recursive
	git submodule foreach --recursive git checkout master

