# `adocker` is alias to `azk docker`
all:
	adocker build -t azukiapp/erlang .

no-cache:
	adocker build --rm --no-cache -t azukiapp/erlang .
