# Note Management

This web application gives the user the functionality to create, edit, view, and delete notes. 

### Table of Contents
  - [How to Install Application](#how-to-install-application)
  - [How to Use Application Hosted on Heroku](#how-to-use-application)
  - [Testing](#testing)
  - [Licenses](#licenses)
  - [Contact](#contact)

## How to Install Application

For usage on your local machine, in your terminal navigate to a directory to store this application and run the instructions listed below:

```
git clone git@github.com:Yesi-MC/note_management.git
cd note_management
bundle install
rake db:{create,migrate,seed}
rails s
Open localhost:3000 in your web browser
```

## How to Use Application Hosted on Heroku

You can use [the Note Management App here](https://note-management-system.herokuapp.com/).

To log into the app please use the login information from the seeds file:
```
Username: joeuser@gmail.com
Pass: !pass123!
```

Once this application is open in your web browser, click on `Login`.
You will be directed to your user dashboard where you can see all your notes and you can add a new note. 

The note title is a link to the note show page.
On the note show page you have the ability to edit and/or delete the note.


## Testing

* For testing I used RSpec
> RSpec is a tool for unit testing that will ensure we have the intended functionality at each level of our code.

* For continous intergration I used Travis CI

* In order to run the tests, run `bundle exec rspec` in the command line and you should have all passing tests.
  
## Licenses

  * Ruby 2.5.3
  * Rails 5.2.4.4

## Contact

#### Yesi Meza: [LinkedIn](https://www.linkedin.com/in/yesimeza), [Email](mailto:yesi.meza10@gmail.com), [GitHub](https://github.com/Yesi-MC)

<!-- Shields -->
![](https://img.shields.io/badge/Rails-5.2.4-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a)
![](https://img.shields.io/badge/Ruby-2.5.3-orange)