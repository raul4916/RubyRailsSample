# ReactJS UI and Instructions for Ruby on Rails

## Instructions for Running ReactJS.  (Assuming on a Linux box using bash)

### You’ll need to have Node >= 6 on your machine.
	```
	cd ui-sample-project/
	npm install -g create-react-app
	npm install axios
	npm start
	```

The web page should open automatically.

Now the UI is ready to be used, make sure that you successfully started the backend with the Instructions for Running Ruby on Rails above.

If having difficulties you may access a live demo on sample.rgms.photography  


## Instructions for Running Ruby on Rails. (Assuming on a Linux box using bash)

1. Install Ruby to version 2.5.0 or change version listed inside of Gemfile to the version you installed. Also install Rails as root on the most up-to-date version
   Commands on Ubuntu:
	```
	sudo apt-get install ruby
	sudo apt-get install rails
	sudo gem update
	```
2. Install all the following dependencies using bundle
	```
	cd ./RubyRailsSample
	bundle install
	```
3. Update configuration on the following file : ```./RubyRailsSample/config/database.yml```
	a. Change the username and password in accordance with your mysql
	b. (optional) Change the databases from development to the name that you like.
4. On mysql, login to it and type the following command:
	```	CREATE DATABASE <db_name>```

	Note: <db_name> is the name that you placed in the 3rd step.
5. Once finished setting up the Database, at the terminal on the same directory as the previous and type the following:
	rails db:migrate
6. Once complete, type the following at the terminal on the same directory as the previous to connect the server:
	rails s
7. Now the server is up and ready to receive requests

## API Documentation

### Request: 
		cards/<id>.json::GET

### Response:
```
[
  0 => {
    "id": 1,
    "title": "Some new title here",
    "description": "some description here",
    "category_id": 2,
    "created_at": "2018-04-27T13:00:00.000Z",
    "updated_at": "2018-04-27T13:00:00.000Z"
  }
]
```
### Request: cards.json::GET
Get all cards

### Response: 
```
[
  0 => {
    "id": 1,
    "title": "Some new title here",
    "description": "some description here",
    "category_id": 2,
    "created_at": "2018-04-27T13:00:00.000Z",
    "updated_at": "2018-04-27T13:00:00.000Z"
  },
  ...
]
```

### Request: cards.json::POST
Create cards.
Required params:
	id: integer
	title: string between 1 - 255 characters, unique
	description: text between 1 - 5000 characters
	
### Response: 
#### On success
```
[
  0 => {
    "id": 1,
    "title": "Some new title here",
    "description": "some description here",
    "category_id": 2,
    "created_at": "2018-04-27T13:00:00.000Z",
    "updated_at": "2018-04-27T13:00:00.000Z"
  }
]
```
#### On failure:
```
{
	status:"error", 
	message:<Error description>
}
```

### Request: cards/<id>.json::PATCH
update specified card

### Response: 
#### On success
```
[
  0 => {
    "id": 1,
    "title": "Some new title here",
    "description": "some description here",
    "category_id": 2,
    "created_at": "2018-04-27T13:00:00.000Z",
    "updated_at": "2018-04-27T13:00:00.000Z"
  }
 ]
```
#### On failure:
```
{
	status:"error", 
	message:<Error description>
}
```

### Request: cards/::DELETE
Delete all cards
### Response: 
	No response
