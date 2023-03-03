![Stream](https://user-images.githubusercontent.com/111480866/221071732-a158eadf-22ac-4b41-9418-171ef6b6c654.png)

# StreamLined Frontend Service
The goal of this project is to create a successful web application from a student-led project idea. Our team has created an app to solve a real world problem, allows users to authenticate with a third-party service, and consume at least two other apis. This project has been developed using Service Oriented Architecture. The backend repo is available [here](https://github.com/Streamlined-Turing/streamlined_be).

## About StreamLined
StreamLined is your new go-to media tracking tool that enables users to organize their movie and TV show watching activity. Upon signing up for the application, users access a user-friendly dashboard with three default lists to categorize their media: 'Currently Watching,' 'Want to Watch,' and 'Watched.' The intuitive interface allows users to search for their desired media titles, view essential details, and save them to the appropriate list effortlessly. 

StreamLined is the perfect tool for busy individuals who want to keep track of their favorite movies and TV shows with ease. Its simple interface and practical features make it an essential addition to any media lover's toolkit.

## Learning Goals
* Authenticate users via OAuth
* Further front end development utilizing Bootstrap.
* Build app using Service Oriented Architecture
* Utilize Webmock and VCR for front end testing

## Setup
This project requires Ruby 2.7.4 

1. Fork and clone this repository.
2. `cd` into the root directory.
3. `bundle install`
4. To run this server, enter `rails s`
5. Open a browser window and go to http://localhost:3000 to start viewing and adding media to your user lists!

Pull down the [Backend repo](https://github.com/Streamlined-Turing/streamlined_be). Set up instructions are in that repository's README.

## Deployment

This project is hosted [here](https://evening-spire-52687.herokuapp.com/).

## Built With
```
Ruby on Rails
Bootstrap
Webmock
VCR
RSpec
Heroku
Circle CI
```

## Json Contract for a User
```
{
  data: {
      id: '1',
      type: 'user',
      attributes: {
            sub: '348734083740874',
            username: 'jjones',
            email: 'jjones@example.com',
            name: 'June Jones',
            picture: 'url'
      }
   }
}   
```

## Moving Forward
Additional features we would like to implement: 
* Ability to create a friend's list and view other user's lists.
* Allow user to create and add to customized lists.
* Give users ability to set their streaming services and search for media by streaming criteria.
* User can search by genre.
* Users can set goals and receive badges/awards as they meet those goals.
* User can set alerts for a new season or sequel.

## Contributors 

* Nigel Aung-Myint: [Github](https://github.com/Pocketzs) | [LinkedIn](https://www.linkedin.com/in/nigel-aung-myint-719254254/)
* Thomas Casady: [Github](https://github.com/Tscasady) | [LinkedIn](https://www.linkedin.com/in/thomas-casady-00b71a255/)
* Kerynn Davis: [Github](https://github.com/Kerynn) | [LinkedIn](https://www.linkedin.com/in/kerynn-davis/)
* Joe King: [Github](https://github.com/this-is-joeking) | [LinkedIn](https://www.linkedin.com/in/king-joseph/)
* Alex Pitzel: [Github](https://github.com/pitzelalex) | [LinkedIn](https://www.linkedin.com/in/alex-pitzel-231619235/)
* Kelsie Porter: [Github](https://github.com/KelsiePorter) | [LinkedIn](https://www.linkedin.com/in/kelsie-porter/)

## API Credits 
* [Watchmode](https://api.watchmode.com/)
* [The Movie Database](https://developers.themoviedb.org/3/getting-started/introduction)
