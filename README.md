README
======

[Bitcoinocracy](http://bitcoinocracy.com) is a project that aims to determine the truth backed by real monetary value and to facilitate decentralized decision making in the Bitcoin eco-system.

It is absolutely transparent, free and doesn't require user registration.

Just sign the statements with non-empty bitcoin addresses to express your opinion.

[![tip for next commit](https://tip4commit.com/projects/43130.svg)](https://tip4commit.com/github/arsenische/bitcoinocracy)


Data structure
--------------

```
Argument
	statement
	validity

Signature
	argument_id
	bitcoin_address_id
	is_negation?
	signature

BitcoinAddress
	bitcoin_address
	balance
```

Algorithm
---------

For each argument calculate validity: `validity = sum(pro bitcoin balances) - sum(con bitcoin balances)`

Todo
----
* https://github.com/arsenische/bitcoinocracy/issues
* Search, compare arguments (A vs B), etc...
* Chat or comments on the argument's page?
* Optional user accounts? Compound arguments? Logical inference?

Docker instructions
-------

Build the image:

`docker build -t arsenische/bitcoinocracy .`

Run the container (please change the SECRET_KEY_BASE and DATABASE_URL before running):

~~~~
docker run \
	-p 80:3000 \
	-e "SECRET_KEY_BASE=4c047431559b10dfd6fc5c27d586fec43f749c9d47b3041adb0daf26e27dc440fc3808d571b923610580426aecd1bcfe4ae704348a7a1c876223643265f65f25" \
	-e "DATABASE_URL=postgres://username:password@example.com:5432/database" \
	--name="bitcoinocracy" \
	arsenische/bitcoinocracy
~~~~