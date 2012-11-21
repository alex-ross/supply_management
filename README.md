Supply Management
===

Live version
---

You can try out the live version here (link below).

[enigmatic-lake-3636.herokuapp.com](http://enigmatic-lake-3636.herokuapp.com)

Username: **demo@example.com**

Password: **foobar**

Get it up and running.
---

The app will user "sqlite3" in development environment and "pg" in production. So if you want to use it with "sqlite3" you have to run it under development environment or edit the gemfile.

This instructions works great on Ubuntu and shood work on other *nix systems to.

Open your terminal and navigate to the directory where you want to store the app.

1. Download the application and navigate to its directory
```
git clone https://github.com/izepax/supply_management.git
cd supply_management/
```

2. Run ```bundle install``` to install gems.

3. Create database and populate it.
```
rake db:create
rake db:populate
```
4. Start server and login using same Username and Password as in the live version.
```
rails s
```

Run tests.
---
To run all test use: ```rake```

Time
---

When I recived the work I thougt it shood take like 10 hours.

So how long time did it take?

* 8h Writing app, tests and design. May also include some minor googling.
* 1,5h Reading documentations and watched railscasts about minitest, slim and Google Maps api.
* 2h Planning

This app did take me about 11,5 hours to complete.


