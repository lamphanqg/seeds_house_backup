# How to run the test suite

* With headless Chrome inside web container:
```
docker-compose exec web rspec
```
* With GUI Chrome browser inside chrome container:
```
open vnc://localhost:5900 // To open screen sharing window. Input "secret" if asked for password.
docker-compose exec -e LAUNCH_BROWSER=true web rspec
```


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
