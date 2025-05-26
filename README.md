# pg-importer
Imports PostgreSQL dumps and makes them available for viewing.


Make sure you have a file called `data.dump` in the top directory.

Then run `make up`.

Go to `localhost:80` and log in with username `admin@admin.com` and password `admin`.

Under `Servers`, open the dropdown and enter the password `admin` for the `Postgres` server, check `Save Password` if desired.

If the connection fails, run `make dblogsf` and wait for the a log that says `database system is ready to accept connections`, try again.

Enjoy viewing your data.
