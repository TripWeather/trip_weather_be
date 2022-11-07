# Back End Repository for Trip Weather

[Deployed BE Heroku Site](https://trip-weather-2022.herokuapp.com/api/v1/)

## Schema / Database

<p align="center">
  <img src="https://github.com/TripWeather/.github/blob/main/profile/assets/BE_DB.png?raw=true" />
</p>

## Available API End Points

### Weather End Point
Returns the weather forecast for a given address

`GET  /api/v1/weather + params` 
or
`https://trip-weather-2022.herokuapp.com/api/v1/weather?{address}`

example:

`http://localhost:3000/api/v1/weather?"200 E Colfax Ave, Denver, CO 80203"`

```json
{
    "data": {
        "id": "1",
        "type": "weather",
        "attributes": {
            "name": "Today",
            "temperature": 61,
            "short_forecast": "Sunny",
            "detailed_forecast": "Sunny. High near 61, with temperatures falling to around 51 in the afternoon. Northwest wind 7 to 10 mph."
        }
    }
}
```
### Navigation End Point

`GET  /api/v1/nav`
or


### Trips End Points

#### Trips Index

Returns all the trips for a given user
```json
{
    "data": [
        {
            "id": "1",
            "type": "trip",
            "attributes": {
                "uid": "1000",
                "name": "Test_Trip",
                "departure_date": "2022-11-07T18:41:30.233Z",
                "arrival_date": "2022-11-09T18:41:00.235Z"
            },
            "relationships": {
                "stops": {
                    "data": [
                        {
                            "id": "1",
                            "type": "stop"
                        },
                        {
                            "id": "2",
                            "type": "stop"
                        }
                    ],
                    "links": {
                        "related": "https://trip-weather-2022.herokuapp.com/api/v1/1000/trips/1/stops/"
                    }
                }
            },
            "links": {
                "self": "https://trip-weather-2022.herokuapp.com/api/v1/1000/trips/1"
            }
        },
        {
            "id": "2",
            "type": "trip",
            "attributes": {
                "uid": "1000",
                "name": "Test_Trip_2",
                "departure_date": "2022-11-07T18:41:30.274Z",
                "arrival_date": "2022-11-12T18:41:00.274Z"
            },
            "relationships": {
                "stops": {
                    "data": [
                        {
                            "id": "3",
                            "type": "stop"
                        },
                        {
                            "id": "4",
                            "type": "stop"
                        }
                    ],
                    "links": {
                        "related": "https://trip-weather-2022.herokuapp.com/api/v1/1000/trips/2/stops/"
                    }
                }
            },
            "links": {
                "self": "https://trip-weather-2022.herokuapp.com/api/v1/1000/trips/2"
            }
        },
        {
            "id": "3",
            "type": "trip",
            "attributes": {
                "uid": "1000",
                "name": "Test_Trip_3",
                "departure_date": "2022-11-07T18:41:30.279Z",
                "arrival_date": "2022-11-17T18:41:00.279Z"
            },
            "relationships": {
                "stops": {
                    "data": [
                        {
                            "id": "5",
                            "type": "stop"
                        },
                        {
                            "id": "6",
                            "type": "stop"
                        }
                    ],
                    "links": {
                        "related": "https://trip-weather-2022.herokuapp.com/api/v1/1000/trips/3/stops/"
                    }
                }
            },
            "links": {
                "self": "https://trip-weather-2022.herokuapp.com/api/v1/1000/trips/3"
            }
        }
    ]
}
```
## Local Setup

This project requires Ruby 2.7.x

* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
    * `bundle`
    * `rails db:create`
* Run the test suite with `bundle exec rspec`.
* Run your development server with `rails s` to see the app in action.

## Versions

- Ruby 2.7.4

- Rails 5.2.8

## Contributors



<img src="https://avatars.githubusercontent.com/u/106836658?s=120&v=4" />
 
Erik Riggs | [Github](https://github.com/eriggs0207) | [LinkedIn](https://www.linkedin.com/in/erik-riggs/) |


<img src="https://avatars.githubusercontent.com/u/100653933?s=120&v=4" />

Candace Eckels | [Github](https://github.com/cece-132) | [LinkedIn](https://www.linkedin.com/in/candace-eckels-b66089201/) |


<img src="https://avatars.githubusercontent.com/u/93290186?s=120&v=4" />

Dominic O'Donnell | [Github](https://github.com/Dominicod) | [LinkedIn](https://www.linkedin.com/in/dominic-odonnell/) |


<img src="https://avatars.githubusercontent.com/u/80183557?s=120&v=4" />

Stephen Fabian | [Github](https://github.com/stephenfabian) | [LinkedIn](https://www.linkedin.com/in/stephen-fabian-5498658a/) |


<img src="https://avatars.githubusercontent.com/u/59062958?s=120&v=4" />

Sandy M Griffin | [Github](https://github.com/SandyyMarie) | [LinkedIn](https://www.linkedin.com/in/sandy-marie/) |
