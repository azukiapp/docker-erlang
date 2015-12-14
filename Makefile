# `adocker` is alias to `azk docker`
all:
	adocker build -t azukiapp/erlang 18
	adocker build -t azukiapp/erlang:18 18
	adocker build -t azukiapp/erlang:18.1 18

no-cache:
	adocker build --rm --no-cache -t azukiapp/erlang 18
	adocker build --rm --no-cache -t azukiapp/erlang:18 18
	adocker build --rm --no-cache -t azukiapp/erlang:18.1 18
