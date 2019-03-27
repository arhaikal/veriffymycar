# Project Title

Car rental service using veriff for user verification
(project does not include payment system)
App uses travis ci for continues integration

### Prerequisites

```
ruby '2.6.2'
docker installed on your machine

Environmental variables needed: 
VERIFF_API_URL = "https://api.veriff.me/v1/"
VERIFF_API_KEY = API Key
VERIFF_API_SECRET = API secret
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

## Running the tests localy
```
docker-compose run web bundle exec rspec
```
