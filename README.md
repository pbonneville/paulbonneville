## paulbonneville.com Source Code

Figured I'd open-source my site, just because. It's not pretty and there is a lot of learning going on in here (specifically with routing custom admin screens), but I wanted
share what I've been doing. This is my first "from scratch" Rails site in a few years.

The is currently a Heroku hosted site that uses:

 - My mac for local development
 - Bootstrap for the HTML and CSS side of things
 - jQuery drizzled in here in there for some smoother UX effects
 - RedCarpet so that I can use Markdown for my contnet
 - Pagedown-boostrap-rails so that I could have a basic markdown editor in my admin
 - Devise for authentication
 - Paperclip with Amazom S3 for file uploads
 - Figaro to keep some of my private passwords and keys private
 - Will_Paginate for pagination
 - My personal gmail account to send out Devise and custom contact e-mails
 - TypeKit for custom fonts, since it comes with my Adobe CC account
 - Postgres, since that is what Heroku uses and it minimizes conflicts that WILL come up if you
   use MySQL for development. I am using the Postgres.app* locally, which is the simplest way to
   get up and running on your local machine in my opinion.

[Postgres.app](http://postgresapp.com)

I built a customized admin, as opposed to using something like ActiveAdmin, partially for the learning experience, but also for the
flexibility of doing everything and anything the way I wanted as opposed to having to bend an existing codebase to my will.

There are a lot of parts and peices that would need to be seeded and configured to get the site to run. I plan on adding some details in the future but already have to move on
to my next project.

### Some Details

 * Ruby and Rails versions
  * Ruby 2.1.1
  * Rails 4.1.0

### Installation

Once you run "bundle install", some of the gems that are used need to be "installed". I'll add those in here in the future...

### Deployment

When you install Figaro, the application.yml file is purposely excluded from the repository since that is where you store your "secrets". Technically, if you add
the following keys to that file, with your own values, the site would run:

 - DEVELOPMENT_DB_USER: root
 - DEVELOPMENT_DB_PASS: your_password
 - GMAIL_USER: 'your@email.com'
 - GMAIL_PASSWORD: 'gmailpassword'
 - S3_BUCKET_NAME: 'bucket_name'
 - AWS_ACCESS_KEY_ID: 'ABCDEFG....'
 - AWS_SECRET_ACCESS_KEY: 'secretaccess'
 - ADMIN_EMAIL: 'your@email.com'

