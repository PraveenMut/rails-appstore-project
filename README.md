# README

# Links

Website: https://appstore-coderacademy.herokuapp.com/
Git Repository link: https://github.com/PraveenMut/rails-appstore-project/

# Abstract of the Program and what it is trying to solve:

AppSpace aims to be the premier marketplace for independent developers to list their apps for sale and for buyers, being app consumers (a B2C structure) to seamlessly purchase applications.  Built an amazing application? List it on AppSpace.

AppSpace connects buyers with developers (sellers) through an effortless and dynamic progress to ensure your work is fairly renumerated.

Although the application marketplace paradigm is efficient for select ecosystems, due to their wall-gardened/siloed nature, AppSpace aims to allievate that difficulty by breaking down barriers and allowing any application to be listed (within guidelines).

AppSpace aims takes inspiration of sources such as the Envato, Flippa Shopify App Store, the Google Play Store and the Apple App Store. 

We hope that you enjoy the experience of AppStore and we strive to ensure that enriching your productivity to entertainment through our brilliant network of developers is always our main goal.

# The Tech Stack Used:

- Ruby on Rails 5.2.3 (to build the application itself)
- Heroku PaaS (for rapid deployment to a live production environment)
- Relational Database (to store data)
- PostgresSQL (as an efficient RDBMS)
- Git SCM & GitHub (for effective distributed version control)
- Stripe Gem (for payment handling)
- Devise (for authorisation and authentication handling)
- CanCanCan (for inner auth needs)
- Byebug (for debugging needs)
- Visual Studio Code (as the team's preferred text editor)
- Figma (for designing)
- HTML/CSS/JS/CoffeeScript (for rendering views, in built to Rails)

# Describe the network infrastructure:

The AppSpace web application is deployed on Heroku's PaaS infrastructure through the heroku cli tools. through the Rails builder in Heroku build tools (due to the low traffic nature of the application, no explicit procfiles were declared and thus the default WEBRick web server is used). We ensured that all database issues and configuration intricacies have been staged, committed and tested throughly. 

In regards to user uploaded images, AppSpace uses AWS's S3 service. Such images are stored through API calls to AWS through the AWS-S3-SDK gem made available to Rails developers. The reason for selecting AWS S3's vast infrastructure is mainly due to their impressive cost efficiency and brilliance in managing in such infrastructure. The developer merely only has to worry about provisioning of servers without any burden of managing them. Although Azure and GCP are viable competitors, due to the nature of our application, AWS's was our preferred choice. 

# Description of production of database used

The web application employs a traditional relational SQL database using the postgresql (aka postgres) RDBMS (Relational Database Management System). The reason this was used was to comply with Heroku's build systems which require postgres to be used for Rails type applications. Postgres is a battle tested RDBMS and thus makes it a great choice for robust web applications requiring many CRUD IOs.

# An abstract of the different high level components used

The web application is built on Ruby on Rails 5.2.3 which is utilises a MVC/Model-View-Controller type of architecture that allows complex applications to be built efficiently. The MVC architectural pattern is one of the most popular architectural patterns when building dynamic applications that require persistent CRUD operations. It separates the concerns of each function that CRUD applications are based, that is the Views (the contents that is displayed to the user through ActionView), the model (the physical database relations that have been abstracted to models which can be queried by Rails' ORM called ActiveRecord and any logic relating to the model) and the controller (which acts a intermediary between the View, the Model and the client's browser) allowing what to be called, any logic with routing, models to be called and what to pushed to the view.

# Describe the Project's Models

The following associations were created through a canonical model methodology (where a 1 model is a superset, and others are a subset).

```ruby
class User < ApplicationRecord
   has_many :orders
   has_one :store
   has_one :user_profile, :user_profile => 'UserProfile' # to ensure access to record
end

class UserProfile < ApplicationRecord
  belongs_to :user
end

class Store < ApplicationRecord
   belongs_to :user
   has_many :apps
end

class Orders < ApplicationRecord
   belongs_to :user
end
````

# Describe the data structure of similar marketplace apps:

AppSpace aims to premier destination to allow developers to list their independent work and buyers (consumers of the application) to purchase such applications. Therefore, our application aims takes inspiration of sources such as the Shopify App Store, the Google Play Store and the Apple App Store. 

Generally speaking, the data structure involves retrieving items from stores of apps, and retrieving all applications and then allowing buyers to purchase such apps. However, to ensure a clean User Experience, when a user registers at App Store they are automatically defaulted to a Buyer and then consequently have the option to become a seller. 

Therefore, in essence, the data structure involves retrieving objects from an array of objects in ApplicationRecords. 

# Describe the database relationships:

As AppSpace aims to connect buyers and sellers together with a clean User Experience by treating new registration as a buyer by default, multiple models are needed to discriminate a buyer, a seller (who is a in essence is a store), apps for sale, standard user profiles and indeed the order process flow. 

Therefore to efficiently connect buyers with sellers and then provide a seamless ("one-click") buy experience, the following ERD (Entity Relationship Diagram) was designed.

In essence, similar to other application marketplaces:

Buyers who are consumers (B2C) of applications, register for an account, fill out a mandatory user profile for compliance which provides them access to view individual listings. If the user is a developer, a warm and inviting button gracefully brings them to become a seller, which then allows them to create a store profile. The developer then is able to list their applications. 

### The ERD:

image

# Overview of Version Control procedures:

To build App Space, the team (Ruth and Praveen) employed Git SCM and GitHub. Both team members used branches named after themselves and changes to code were committed to their respective branches. After a conclusion of a day, the team discusses the changes and the respective team member creates a pull request to merge into the master branch which is then integrated by Praveen. To ensure that little confusion occurs with merges, only 1 pull request is merged into master at a time in a clear, chronological order. 

## This is the visual representation the management of the use of Git SCM
image

# Testing Processes

We used a combination of manual testing and inbuilt tools along with Ruby gems for our testing and debugging procedures.

## Testing Views:
To test views, we used multiple browsers (Firefox and Chrome) to ensure the design, flow and functionality met our expectations before developing the next feature. This aligns with the core principles of the agile development process.

## Testing Controllers:
To test the controller, a basic barebones views was created coupled with the in-built method named "raise" in Rails 5.3.1. Raise halts the further execution of the webpage in question and then allows us to test for input and find bugs that are present in the codebase. 

Byebug, a popular Ruby Gem, was additionally employed to obtain a view of the execution flow of the application from the cli (command line interface). Byebug is very similar to rails with the functionality of exposing all parameters passed in and outputted from all sources (including 3rd party API calls). 

## Testing Models:
To test models, we used the traditional manual method of using rails console to test and debug model associations, field presences, if method calls succeded or fails and creating dummy entries to test for validity of the entry (e.g. can such a model be accessed by indirectly accessing :id elsewhere?)

We aim to introduce the TDD (Test Driven Development) with automated testing using Guard and Factories at a later, more sophisticated stage of the project. 

# Discuss methods you will use to protect information and data

AppSpace takes data confidentiality extremely seriously. We do not sell or monetize data to 3rd parties whatsoever. In addition, due to the MVC architecture of Rails, confidential data is abstracted away from the client side and moved to server side for full SSR. This ensures that sensitive user profile information is absent from the client side which substantially reduces vulnerabilities. 

Of course, this reduces the attack vector to the server itself. In order to defend against such attacks, all passwords and sensitive billing details (such as credit card details) are fully encrpted by salted bcrypt and SSL/TLS when communicating with Stripe. Therefore, if information were to be leaked through an attack on the server, all information is fully encrypted and requires the private keys that are only accessible through cracking Heroku's security (an improbable case).
