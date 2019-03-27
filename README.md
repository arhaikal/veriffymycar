# Project Title

Car rental service using veriff for user verification
(project does not include payment system)

### Prerequisites

```
ruby '2.6.2'
docker installed on your machine
```

### Installing

A step by step series of examples that tell you how to get a development env running
```
docker-compose build web
```
```
docker-compose run web rails db:create db:migrate db:seed
```
```
docker-compose up web
```
```
visit http://localhost:3000/
```

End with an example of getting some data out of the system or using it for a little demo

## Running the tests localy

docker-compose run web bundle exec rspec

