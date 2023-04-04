# Booksie - Ruby on Rails

![Booksie Ruby On Rails App](https://res.cloudinary.com/dd7pbokmj/image/upload/v1680132693/Screen_Shot_2023-03-29_at_20.28.34_zp97yk.png)

This is a  project created to integrate my portfolio as a web developer.

In Le Wagon's Web Development Bootcamp we are asked to code a comparable AirBnb app, where we can choose what we want to rent.

This projects uses: **MVC pattern**, **Ruby On Rails**, **HTML**, **CSS,** **Tailwind**, **Javascript**, **Stimulus**, **PostgreSQL**.

## Description

This project enables the following features:

1. Authentication
2. Authorization
3. Image Upload
4. Geocoding
5. Send e-mails programmatically using background jobs
6. Admin dashboard
7. Create and manage a blog feature
8. Use AJAX to perform search on keystroke
9. Chatroom with websocket
10. Notification
11. Consumes a RESTFUL API (Google Books)

### Ruby version

	ruby  3.1.2

### Rails version

    Rails 7.0.4.2

### Node version

    v14.15.0

### Deploy

To use and test Booksie:

 1. [You can download a zip file from Github.](https://github.com/cvaldivia83/rails-booksie/archive/refs/heads/main.zip)
 2. Or you can click on the 'Code' green button and clone the directory directly into your computer using  CLI.

After unzipping and saving the files into your computer, you will need to navigate to the app directory and run those commands in your terminal:

 1. `bundle install`
 2. `yarn install`
 3. `rails db:create db:migrate db:seed`
 4. `rails tailwindcss:build`

To run the app in your local server:


 1. Navigate to the app directory and type the following command in your terminal:

	    rails s

   2. Open your browser and in the address bar type:

		   localhost:3000

	  There you go, you are all set to start using Booksie.
