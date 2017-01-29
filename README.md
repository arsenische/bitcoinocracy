README
======

[Bitcoinocracy](http://bitcoinocracy.com) is a project that aims to determine the truth backed by real monetary value and to facilitate decentralized decision making in the Bitcoin eco-system.

It is absolutely transparent, free and doesn't require user registration.

Just sign the statements with non-empty bitcoin addresses to express your opinion.


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

Docker-compose instructions
-------

Build:

`docker-compose build`

Before you run it, please copy the file `.env.sample` to `.env` and edit it to configure the environment.

Run:

`docker-compose up`


You might also need to run the database migrations in your docker container in order to update the database schema:

`rake db:migrate`

or (if you run it for the first time):

`admin_email='your@email.address' admin_password='your-admin-password'; rake db:migrate`
