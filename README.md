# Back End Repository for Trip Weather

[Deployed BE Heroku Site](https://trip-weather-2022.herokuapp.com/api/v1/)

## Table of Contents

1. [Architecture and Design](#architecture-and-design)
2. [Available API End Points](#all-available-end-points)
- [Weather End Point](#weather-end-point)
- [Navigation End Point](#navigation-end-point)
- [Trips End Points](#trips-end-points)
    - [Index](#trips-index)
    - [Show](#trips-show)
    - [Create](#trips-create)
    - [Update](#trips-update)
    - [Destroy](#trips-destroy)
- [Stops End Points](#trip-stops-end-points)
    - [Index](#trips-stops-index) 
    - [Show](#trips-stops-show)
    - [Create](#trips-stops-create)
    - [Destroy](#trips-stops-destroy)
- [Address End Points](#trip-stops-addresses)
    - [Show](#trips-stops-address-show)
    - [Update](#trips-stops-address-update)
3. [Local Setup](#local-setup)
4. [Versions](#versions)
5. [Contributors](#contributors)


## Architecture and Design

<p align="center">
  <img src="https://github.com/TripWeather/.github/blob/main/profile/assets/BE_DB.png?raw=true" />
</p>

## All Available End Points:

### Weather End Point
Returns the weather forecast for a given address

`GET  /api/v1/weather + params` 
or
`https://trip-weather-2022.herokuapp.com/api/v1/weather?{address}`

example:

`https://trip-weather-2022.herokuapp.com/api/v1/weather?"200 E Colfax Ave, Denver, CO 80203"`

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
##
### Navigation End Point
Returns the step by step directions from a `start address` to an `end address`

`GET  /api/v1/nav + params`

or

`https://trip-weather-2022.herokuapp.com/api/v1/nav?start_address={address}&end_address={address}%id=1`


<b>Example:</b>

`https://trip-weather-2022.herokuapp.com/api/v1/nav?start_address=200 E Colfax Ave, Denver, CO 80203&end_address=1600 Pennsylvania Avenue NW, Washington, DC 20500&id=1` 

```json
{
    "data": {
        "id": "1",
        "type": "nav",
        "attributes": {
            "turn_by_turn_directions": [
                [
                    "Head toward Sherman St on E Colfax Ave (I-70-BL). Go for 446 ft.",
                    0.0845
                ],
                [
                    "Turn right onto N Lincoln St. Go for 0.5 mi.",
                    0.5375
                ],
                [
                    "Continue on 20th St. Go for 509 ft.",
                    0.0963
                ],
                [
                    "Turn slightly right onto N Broadway. Go for 0.3 mi.",
                    0.261
                ],
                [
                    "Continue on N Broadway. Go for 0.1 mi.",
                    0.1299
                ],
                [
                    "Turn left onto Park Ave W. Go for 1.0 mi.",
                    0.9811
                ],
                [
                    "Take ramp onto I-70 E toward Limon. Go for 177 mi.",
                    176.7086
                ],
                [
                    "Continue on I-70. Go for 421 mi.",
                    420.8982
                ],
                [
                    "Keep left onto I-670 (Jay B Dillingham Memorial Hwy). Go for 1.8 mi.",
                    1.7635
                ],
                [
                    "Continue on I-670 (Jay B Dillingham Memorial Hwy). Go for 2.3 mi.",
                    2.3009
                ],
                [
                    "Continue on I-70 (George Brett Super Hwy). Go for 229 mi.",
                    228.9647
                ],
                [
                    "Take exit 232 toward Chicago onto I-270 N. Go for 15.7 mi.",
                    15.7101
                ],
                [
                    "Continue on I-270. Go for 15.1 mi.",
                    15.118
                ],
                [
                    "Continue on I-70. Go for 82.6 mi.",
                    82.5672
                ],
                [
                    "Keep right onto I-70 E toward Indianapolis. Go for 57.8 mi.",
                    57.818
                ],
                [
                    "Continue on I-70 (W National Rd). Go for 69.0 mi.",
                    69.0138
                ],
                [
                    "Take exit 69 onto I-74 E/I-465 S. Go for 16.9 mi.",
                    16.8889
                ],
                [
                    "Continue on I-465. Go for 4.9 mi.",
                    4.9045
                ],
                [
                    "Take exit 44B toward Dayton onto I-70 E. Go for 67.2 mi.",
                    67.1783
                ],
                [
                    "Continue on I-70. Go for 101 mi.",
                    100.7348
                ],
                [
                    "Continue on I-70 E toward Wheeling. Go for 119 mi.",
                    119.3232
                ],
                [
                    "Take exit 219 toward Bellaire/Washington Pa onto I-470 E. Go for 6.8 mi.",
                    6.822
                ],
                [
                    "Continue on I-470. Go for 3.8 mi.",
                    3.7761
                ],
                [
                    "Take the exit toward Washington Pa onto I-70 E. Go for 9.5 mi.",
                    9.4772
                ],
                [
                    "Continue on I-70. Go for 20.9 mi.",
                    20.8967
                ],
                [
                    "Take exit 21 toward Waynesburg/Morgantown onto I-79 S (Raymond P Shafer Hwy). Go for 33.9 mi.",
                    33.8908
                ],
                [
                    "Continue on I-79. Go for 11.3 mi.",
                    11.304
                ],
                [
                    "Take exit 148 toward Cumberland onto I-68 E. Go for 32.2 mi.",
                    32.1777
                ],
                [
                    "Continue on I-68 (National Fwy). Go for 80.2 mi.",
                    80.1687
                ],
                [
                    "Take exit 82AB toward US-40 E/Hagerstown onto I-70 E (Dwight D Eisenhower Hwy). Go for 52.0 mi.",
                    52.0479
                ],
                [
                    "Take exit 53 toward Washington onto I-270 S (Dwight D Eisenhower Hwy). Go for 23.3 mi.",
                    23.3281
                ],
                [
                    "Keep left onto I-270 S (I-270 Express Lanes) toward Washington. Go for 6.7 mi.",
                    6.7326
                ],
                [
                    "Keep right onto I-270-SPUR toward I-495 S/Washington/Northern Virginia. Go for 2.0 mi.",
                    1.953
                ],
                [
                    "Continue on I-495 (Capital Beltway). Go for 3.6 mi.",
                    3.6226
                ],
                [
                    "Continue on I-495 (Capital Beltway). Go for 0.1 mi.",
                    0.1243
                ],
                [
                    "Take exit 43-44 toward Geo Wash Mem Pkwy/Washington onto George Washington Memorial Pkwy. Go for 9.6 mi.",
                    9.6238
                ],
                [
                    "Take the exit toward US-50 E/Roosevelt Bridge/Washington DC/Rosslyn onto I-66 E (Custis Memorial Pkwy). Go for 0.4 mi.",
                    0.3548
                ],
                [
                    "Continue on I-66 (Theodore Roosevelt Memorial Brg). Go for 0.5 mi.",
                    0.548
                ],
                [
                    "Take left ramp onto E St Expy toward E Street. Go for 0.6 mi.",
                    0.5928
                ],
                [
                    "Take ramp. Go for 509 ft.",
                    0.0963
                ],
                [
                    "Continue on E St NW. Go for 0.2 mi.",
                    0.1715
                ],
                [
                    "Turn left onto 18th St NW. Go for 220 ft.",
                    0.0416
                ],
                [
                    "Continue on 18th St NW. Go for 499 ft.",
                    0.0944
                ],
                [
                    "Turn right onto F St NW. Go for 0.1 mi.",
                    0.1199
                ],
                [
                    "Turn right onto 17th St NW. Go for 0.1 mi.",
                    0.1348
                ],
                [
                    "Turn left onto E St NW. Go for 440 ft.",
                    0.0833
                ],
                [
                    "Turn left onto W Executive Ave NW. Go for 361 ft.",
                    0.0684
                ],
                [
                    "Turn left onto State Pl NW. Go for 413 ft.",
                    0.0783
                ],
                [
                    "Make a U-Turn at New York Ave NW onto State Pl NW. Go for 515 ft.",
                    0.0976
                ],
                [
                    "Turn left. Go for 492 ft.",
                    0.0932
                ],
                [
                    "Arrive at your destination.",
                    0
                ]
            ],
            "total_trip_time": 89536,
            "total_distance": 1680.5034,
            "has_toll_road": true
        }
    }
}
```
##
### Trips End Points

#### Trips Index
Returns all the trips for a given user

`GET  /api/v1/:uid/trips` 

or

`https://trip-weather-2022.herokuapp.com/api/v1/{:uid}/trips` 


<b>Example:</b>
`https://trip-weather-2022.herokuapp.com/api/v1/1000/trips` 

```json
{
    "data": [
        {
            "id": "1",
            "type": "trip",
            "attributes": {
                "uid": "1000",
                "name": "Test_Trip_1",
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
        }
    ]
}
```


#### Trips Show
Returns individual trip details and the number of stops, along with the related links to stops

`GET  /api/v1/:uid/trips/:trip_id` 

or

`https://trip-weather-2022.herokuapp.com/api/v1/{:uid}/trips/{:trip_id}` 


<b>Example:</b>

`https://trip-weather-2022.herokuapp.com/api/v1/1000/trips/1/`

```json
{
    "data": {
        "id": "1",
        "type": "trip",
        "attributes": {
            "uid": "1000",
            "name": "Test_Trip",
            "departure_date": "2022-11-07T16:06:47.622Z",
            "arrival_date": "2022-11-09T16:06:17.623Z"
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
    }
}
```

#### Trips Create


`` 
or
``

example:

``

```json

```

#### Trips Update


`` 
or
``

example:

``

```json

```

#### Trips Destroy


`` 
or
``

example:

``

```json

```
##

### Trip Stops End Points

#### Trips Stops Index
Returns all the stops of a given trip

`GET  /api/v1/{:uid}/trips/{:trip_id}/stops`

or

`https://trip-weather-2022.herokuapp.com/api/v1/{:uid}/trips/{:trip_id}/stops`


<b>Example:</b>

`https://trip-weather-2022.herokuapp.com/api/v1/1000/trips/1/stops`

```json
{
    "data": [
        {
            "id": "1",
            "type": "stop",
            "attributes": {
                "type_of_stop": "start"
            },
            "relationships": {
                "address": {
                    "data": {
                        "id": "1",
                        "type": "address"
                    },
                    "links": {
                        "related": "https://trip-weather-2022.herokuapp.com/api/v1/1000/trips/1/stops/1/addresses/1"
                    }
                }
            },
            "links": {
                "self": "https://trip-weather-2022.herokuapp.com/api/v1/1000/trips/1/stops/1"
            }
        },
        {
            "id": "2",
            "type": "stop",
            "attributes": {
                "type_of_stop": "end"
            },
            "relationships": {
                "address": {
                    "data": {
                        "id": "2",
                        "type": "address"
                    },
                    "links": {
                        "related": "https://trip-weather-2022.herokuapp.com/api/v1/1000/trips/1/stops/2/addresses/2"
                    }
                }
            },
            "links": {
                "self": "https://trip-weather-2022.herokuapp.com/api/v1/1000/trips/1/stops/2"
            }
        }
    ]
}
```

#### Trips Stops Show
Returns Details on a specific stop

`GET  /api/v1/{:uid}/trips/{:trip_id}/stops/{:stop_id}` 

or

`https://trip-weather-2022.herokuapp.com/api/v1/{:uid}/trips/{:trip_id}/stops/{:stop_id}`


<b>Example:</b>

`https://trip-weather-2022.herokuapp.com/api/v1/1000/trips/1/stops/1`

```json
{
    "data": {
        "id": "1",
        "type": "stop",
        "attributes": {
            "type_of_stop": "start"
        },
        "relationships": {
            "address": {
                "data": {
                    "id": "1",
                    "type": "address"
                },
                "links": {
                    "related": "https://trip-weather-2022.herokuapp.com/api/v1/1000/trips/1/stops/1/addresses/1"
                }
            }
        },
        "links": {
            "self": "https://trip-weather-2022.herokuapp.com/api/v1/1000/trips/1/stops/1"
        }
    }
}
```

#### Trips Stops Create


`` 
or
``

example:

``

```json

```

#### Trips Stops Destroy


`` 
or
``

example:

``

```json

```

### Trip Stops Addresses 

#### Trips Stops Address Show
Returns Address of a specific stop

`GET  /api/v1/{:uid}/trips/{:trip_id}/stops/{:stop_id}/addresses/{:address_id}` 

or

`https://trip-weather-2022.herokuapp.com/api/v1/{:uid}/trips/{:trip_id}/stops/{:stop_id}/addresses/{:address_id}`


<b>Example:</b>

`https://trip-weather-2022.herokuapp.com/api/v1/1000/trips/1/stops/1/addresses/1`

```json
{
    "data": {
        "id": "1",
        "type": "address",
        "attributes": {
            "location": "1600 Pennsylvania Ave NW, Washington DC"
        }
    }
}
```

#### Trips Stops Address Update


`` 
or
``

example:

``

```json

```

## Local Setup

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

##

[Back To Top](#back-end-repository-for-trip-weather) 
