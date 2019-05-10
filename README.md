# README

# Links

<p>Website: https://appstore-coderacademy.herokuapp.com/</p>
<p>Git Repository link: https://github.com/PraveenMut/rails-appstore-project/</p>

# Q1-4.What is the need (i.e. challenge) that you will be addressing in your project? Identify the problem you’re trying to solve by building this particular marketplace App? Why is it a problem that needs solving? Describe the project will you be conducting and how your App will address the needs.

AppSpace aims to be the premier marketplace for independent developers to list their apps for sale and for buyers, being app consumers (a B2C structure) to seamlessly purchase applications.  Built an amazing application? List it on AppSpace.

AppSpace connects buyers with developers (sellers) through an effortless and dynamic progress to ensure your work is fairly renumerated.

Although the application marketplace paradigm is efficient for select ecosystems, due to their wall-gardened/siloed nature, AppSpace aims to allievate that difficulty by breaking down barriers and allowing any application to be listed (within guidelines).

AppSpace aims takes inspiration of sources such as the Envato, Flippa Shopify App Store, the Google Play Store and the Apple App Store. 

We hope that you enjoy the experience of AppStore and we strive to ensure that enriching your productivity to entertainment through our brilliant network of developers is always our main goal.

# Q4.Describe the network infrastructure:

The AppSpace web application is deployed on Heroku's PaaS infrastructure through the heroku cli tools. through the Rails builder in Heroku build tools (due to the low traffic nature of the application, no explicit procfiles were declared and thus the default WEBRick web server is used). We ensured that all database issues and configuration intricacies have been staged, committed and tested throughly. 

In regards to user uploaded images, AppSpace uses AWS's S3 service. Such images are stored through API calls to AWS through the AWS-S3-SDK gem made available to Rails developers. The reason for selecting AWS S3's vast infrastructure is mainly due to their impressive cost efficiency and brilliance in managing in such infrastructure. The developer merely only has to worry about provisioning of servers without any burden of managing them. Although Azure and GCP are viable competitors, due to the nature of our application, AWS's was our preferred choice. 

# Q5.Identify and describe the software to be used in your App. 

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
- ImageMagik (for Image Resizing)
- Bootstrap (for rapid production quality websites through modern CSS/jQuery)


# Q6.Identify the database to be used in your App and provide a justification for your choice.

PostgreSQL is an Object-Relational Database Management System. It's possible to relate its object orientation to having implemented table inheritance. PostgreSQL can handle a lot of data. It enforces valid JSON which allows you to use the JSON operators and functions that are built in. And Heroku has a postgreSQL hosting service.

# Q7.Identify and describe the production database setup.

The web application employs a traditional relational SQL database using the postgresql (aka postgres) RDBMS (Relational Database Management System). The reason this was used was to comply with Heroku's build systems which require postgres to be used for Rails type applications. Postgres is a thoroughly battle tested RDBMS with a rich open source community and thus makes it a great choice for robust web applications requiring many CRUD IOs.

Although other DBMSes such as SQLite (Relational) and MongoDB/no-SQL are available to use in Ruby, as Heroku is not capable with SQLite and MongoDB requires extensive additional configuration, PostgreSQL was ultimately chosen to be the preferred choice for the production database. 

# Q8.Describe the architecture of your App.
The Model
Ruby on Rails 5.2.3 employs an ORM (Object Relational Mapping) to provide an abstraction between the raw Database and its relevant SQL commmands (which would otherwise require to be inputted as SQL DD instructions). This allows relations and its relevant tuples to be be treated as natural ruby based objects and relevant actions or manipulations to be called to the them. As explained above, ActiveRecord is the class method is the abstracting layer. 

An excellent depiction of the MVC architectural pattern is displayed below illustrating its clear separation of concerns and its full SSR methodology (Server Side Rendered Pages).

MVC Diagram
![MVC Diagram](/docs/diagram-for-mvc.jpeg "MVC Diagram")

# Q9.Explain the different high-level components (abstractions) in your App.

The web application is built on Ruby on Rails 5.2.3 which is utilises a MVC/Model-View-Controller type of architecture that allows complex applications to be built efficiently. The MVC architectural pattern is one of the most popular architectural patterns when building dynamic applications that require persistent CRUD operations. It separates the concerns of each function that CRUD applications are based, that is the Views (the contents that is displayed to the user through ActionView), the model (the physical database relations that have been abstracted to models which can be queried by Rails' ORM called ActiveRecord and any logic relating to the model) and the controller (which acts a intermediary between the View, the Model and the client's browser) allowing what to be called, any logic with routing, models to be called and what to pushed to the view.

# Q10.Detail any third party services that your App will use.

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
- ImageMagik (for Image Resizing)
- Bootstrap (for rapid production quality websites through modern CSS/jQuery)

# Q11.Describe (in general terms) the data structure of marketplace apps that are similar to your own (e.g. eBay, Airbnb).

AppSpace aims to premier destination to allow developers to list their independent work and buyers (consumers of the application) to purchase such applications. Therefore, our application aims takes inspiration of sources such as the Shopify App Store, the Google Play Store and the Apple App Store. 

Generally speaking, the data structure involves retrieving items from stores of apps, and retrieving all applications and then allowing buyers to purchase such apps. However, to ensure a clean User Experience, when a user registers at App Store they are automatically defaulted to a Buyer and then consequently have the option to become a seller. 

Therefore, in essence, the data structure involves retrieving objects from an array of objects in ApplicationRecords. 

# Q12.Discuss the database relations to be implemented.

As AppSpace aims to connect buyers and sellers together with a clean User Experience by treating new registration as a buyer by default, multiple models are needed to discriminate a buyer, a seller (who is a in essence is a store), apps for sale, standard user profiles and indeed the order process flow. 

Therefore to efficiently connect buyers with sellers and then provide a seamless ("one-click") buy experience, the following ERD (Entity Relationship Diagram) was designed.

In essence, similar to other application marketplaces:

Buyers who are consumers (B2C) of applications, register for an account, fill out a mandatory user profile for compliance which provides them access to view individual listings. If the user is a developer, a warm and inviting button gracefully brings them to become a seller, which then allows them to create a store profile. The developer then is able to list their applications. 

# Q13.Describe your project’s models in terms of the relationships (active record associations) they have with each other.

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
# Q14.Provide your database schema design.

ERD
![ERD](/docs/application-store-erd.jpeg "ERD")

# Q15.Provide User stories for your App.

The user has to signup before they have any privileges on the web app. Once they login, they can chose to buy an app. The can view the listings page, click onto an app to get more details on that app, and click Get App when they choose to buy. A stripe window will ask them for their credit card details and they will be brought to a confirmation page where they can download the app. Alternatively they can register a store (become a seller), they can create a listing where it will then display on the app listings page.

User Stories
![User Stories](/docs/Figma:User.png "User Stories")

# Q16.Provide Wireframes for your App.

Figma Wireframes
![Figma Wireframes](/docs/Figma:User.png "Figma Wireframes")

# Q17.Describe the way tasks are allocated and tracked in your project.

We’ve set up a Trello board where we manage our work and check it regularly and allocate accordingly. We use the Trello board to display our work ‘to do’, work that we’re ‘doing’ and work that has been ‘done.
Trello
![Trello Screenshot 1](/docs/Trello-1.png "Trello Screenshot 1")

![Trello Screenshot 2](/docs/Trello-2.png "Trello Screenshot 2")

![Trello Screenshot 3](/docs/Trello-3.png "Trello Screenshot 3")

# Q18.Discuss how Agile methodology is being implemented in your project.

We do daily stand ups to discuss what we did the previous day, what we’ll be doing today and any difficulties. We use a kanban board, via Trello to visualise our work ‘to do’, work that we’re ‘doing’ and work that has been ‘done'. We've also done some pair programming and showcasing our working prototype for lecturer feedback.

# Q19.Provide an overview and description of your Source control process.

To build App Space, the team (Ruth and Praveen) employed Git SCM and GitHub. Both team members used branches named after themselves and changes to code were committed to their respective branches. After a conclusion of a day, the team discusses the changes and the respective team member creates a pull request to merge into the master branch which is then integrated by Praveen. To ensure that little confusion occurs with merges, only 1 pull request is merged into master at a time in a clear, chronological order. 

Git Workflow
![Git Workflow](/docs/Git-Workflow.jpg "Git Workflow")

# Q20.Provide an overview and description of your Testing process.

We used a combination of manual testing and inbuilt tools along with Ruby gems for our testing and debugging procedures.

## Testing Views:
To test views, we used multiple browsers (Firefox and Chrome) to ensure the design, flow and functionality met our expectations before developing the next feature. This aligns with the core principles of the agile development process.

## Testing Controllers:
To test the controller, a basic barebones views was created coupled with the in-built method named "raise" in Rails 5.3.1. Raise halts the further execution of the webpage in question and then allows us to test for input and find bugs that are present in the codebase. 

Byebug, a popular Ruby Gem, was additionally employed to obtain a view of the execution flow of the application from the cli (command line interface). Byebug is very similar to rails with the functionality of exposing all parameters passed in and outputted from all sources (including 3rd party API calls). 

## Testing Models:
To test models, we used the traditional manual method of using rails console to test and debug model associations, field presences, if method calls succeded or fails and creating dummy entries to test for validity of the entry (e.g. can such a model be accessed by indirectly accessing :id elsewhere?)

We aim to introduce the TDD (Test Driven Development) with automated testing using Guard and Factories at a later, more sophisticated stage of the project. 

# Q21.Discuss and analyse requirements related to information system security.

We store email addresses, PII (personally identifiable information), so there are security standards that we need to adhere to. And we take credit card payments so we fall under PCI-DSS compliance obligations. 

# Q22.Discuss methods you will use to protect information and data.

AppSpace takes data confidentiality extremely seriously. We do not sell or monetize data to 3rd parties whatsoever. In addition, due to the MVC architecture of Rails, confidential data is abstracted away from the client side and moved to server side for full SSR. This ensures that sensitive user profile information is absent from the client side which substantially reduces vulnerabilities. 

Of course, this reduces the attack vector to the server itself. In order to defend against such attacks, all passwords and sensitive billing details (such as credit card details) are fully encrpted by salted bcrypt and SSL/TLS when communicating with Stripe. Therefore, if information were to be leaked through an attack on the server, all information is fully encrypted and requires the private keys that are only accessible through cracking Heroku's security (an improbable case).

# Q23.Research what your legal obligations are in relation to handling user data.

Privacy Act 1988 all businesses and not for profit organisations have responsibilities to manage personal information securely. It regulates the collection, use and handling of personal information about individuals. When an individual requests access to and/or deletion of PII data that we are holding, we are required to respond to that request within 30 days, otherwise we could be in breach of privacy laws and potential fines.



