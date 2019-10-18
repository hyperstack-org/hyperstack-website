# Hyperstack Website

[![Build Status](https://travis-ci.org/hyperstack-org/website.svg?branch=edge)](https://travis-ci.org/hyperstack-org/website)

## Goals

+ Firstly, it is the main documentation site for Hyperstack.org https://hyperstack.org
+ Secondly, it stands as showcase for Hyperstack. Please clone this repo, learn from how it works, and if you can improve anything we would love to see a PR!

## Website functionality

+ Runnable code samples, using a JS build of Opal Compiler to compile Ruby to JS on each keypress
+ All pages are dynamically loaded from Github
+ Conversion from Markdown to HTML is done on the fly on the client (using a JS component called Marked.js)
+ The table of contents (TOC) is dynamically created from the markdown an all of the site navigation is dynamically created
+ Full text search is also dynamic, with the indexes created in the client as the pages are loaded
+ Each page has an 'Improve this Page' button which will result in a PR against the correct page, in the correct repo on the correct branch (edge)

## Technology

+ Multiple JS libraries used (for markdown conversion and full text indexing)
+ All JS libraries added via `Yarn`
+ Reactivity from React, ReactRouter
+ Semantic UI React as the main stylesheet
+ Latest version of Rails
+ Hosted on Heroku

## Help and support

### Slack chat
+ First, join our Slack group here: https://join.slack.com/t/hyperstack-org/shared_invite/enQtNTg4NTI5NzQyNTYyLWQ4YTZlMGU0OGIxMDQzZGIxMjNlOGY5MjRhOTdlMWUzZWYyMTMzYWJkNTZmZDRhMDEzODA0NWRkMDM4MjdmNDE

+ Once you have joined, you can access Slack through the multi-platform app (you can add Hyperstack-org if you already use Slack for work) or if you prefer not to use the app, you can use your browser with a shortcut here: https://hyperstack.org/slack

### StackOverflow

+ We are using SO for all technical Q&A now. Please feel free to also ask and discuss in the Slack chat, but we are trying to get as many good Q&A in SO as we can, so we might ask you to re-ask in SO as well. Our tag is hyperstack but we like to add the ruby-on-rails, ruby and react-js tags as well to bring the project to wider attention (please mention you are using Hyperstack and even add a link to the project if you can).
+ To ask a question use: https://hyperstack.org/question
+ To see all hyperstack questions use https://hyperstack.org/questions

## Setup

+ `bundle`
+ `yarn`

## Run

+ `foreman start`
+ `http://localhost:5000/`

## Deploy

Deployment is done directly to Heroku. There are two heroku instances running:

+ https://hyperstack.org - production instance
+ https://staging.hyperstack.org - staging instance

### Deploying to staging or production

**You need to be a member of the Hyperstack Heroku account to be able to deploy, so if you are not then these instructions will not work for you. If you would like to participate please reach out in Slack**

#### Setup the staging instance
+ clone the repo
+ `heroku git:remote -a hyperstack-website-staging` - this will add the remote
+ `git remote rename heroku heroku-staging` - this will rename the heroku remote heroku-staging

#### Setup the production instance
+ clone the repo, checkout master
+ `heroku git:remote -a hyperstack-website` - this will add the remote
+ `git remote rename heroku heroku-production` - this will rename the heroku remote heroku-production
+ Note if you are on your own branch then you will need to use `git push heroku-staging my_branch_name:master`

### Deploying to staging.hyperstack.org
+ `git push heroku-staging master` - the master is confusing, but basically its saying to deploy to the Heroku master (not the local master branch)

### Deploying to hyperstack.org (production)
+ `git push heroku-production master`
+ Remember - if you break it, you fix it!

## Contributing

We would really love help in evolving this project. Please see the issue list for a great place to start.

## How the code works

### Routing

All Rails routes go to a Hyperstack created Controller and View `match '*all', to: 'hyperloop#AppRouter', via: [:get]` which loads and renders the AppRouter Component, which happens to be a router (actually ReactRouter under the covers).

The router then simply looks at the path and renders the correct Component, passing in parameters from the path.

```ruby
# /app/hyperloop/router/app_router.rb
class AppRouter < Hyperloop::Router
  history :browser

  route do
    Switch do
      Route('/', exact: true, mounts: HomePage)
      Route('/docs', exact: true, mounts: DocsPage)
      Route('/docs/:section_name', exact: true, mounts: DocsPage)
      Route('/docs/:section_name/:page_name', exact: true, mounts: DocsPage)
      Route('/searchresult', exact: false, mounts: SearchResultPage)
    end
  end
end
```

### The HomePage Component

Our root route `/` renders a Component called `HomePage`. If you are brand new to HYperstack, this is a good first component to look at as it is dead simple - it renders a static HTML page. You will find it at `/app/hyperloop/components/home/home_page.rb`

Note the Component structure and then have a look at the `render` macro.

```ruby
# /app/hyperloop/components/home/home_page.rb
render do
  DIV(id: 'example', class: 'index') do
    DIV(class: 'page_wrap full height') do
      AppMenu(section: 'home')
      mast_head
      stack_overview
      three_columns_of_text
    end
    AppFooter()
  end
end
```

In the code above, note the following:

+ Our HTML tags `DIV`, `INPUT`, `A`, etc are always in capitals. This is purely a convention which we believe makes the code more readable, after-all, this code is rendering a HTML page. If this hurts your eyes (as a Ruby purist), you can use the lower case form which works just the same.
+ Every Component must implement a `render` block which must return just one DOM node. In this case it is returning a `DIV`. You will see `render(DIV)` elsewhere in the code which is shorthand.
+ Components render child Components and data is passed in one direction, from parent to child. React constantly re-renders the page based on the current state of the data. This is the simple, beautiful secret to React. Once you fully grasp this one simple point. all of React design and thinking will make sense. We will speak about Stores, which are a way of passing data between components, a little later.
+ In the render block above, we render a combination of Components and methods in the class. As a general rule of thumb, its best to keep the render block as readable as possible (for example the `mast_head` method renders all the messy mast head HTML) and move code that is likely to be shared into its own Component. A perfect example is the `AppMenu` Component which is obviously needed on all pages on this site.

### AppStore behind the scenes

Stores hold data and components watch for changes (we call them mutations) of that data and re-render when state data held in a Store changes.

When this application starts, the Hyperstack Stores get initialised and start their work. The `AppStore` singleton goes about loading and converting all the pages from Github. Basic data structure: `AppStore` has_many `SectionStores` has_many `pages`.

+ `AppStore` which is a singleton `AppStore` store
+ `.section_stores` which is a hash of SectionStores {'docs' => SectionStore}
+ `.pages` which is an array of hashes

So to get the friendly_doc_name of the first page in the 'dsl' section:

+ `AppStore.section_stores['dsl'].pages.first['friendly_doc_name']`

Once the stores are loaded (and the pages converted) the rest of the site is ready to render.

### Semantic-UI

The website uses Semantic-UI CSS and Rect-Semantic-UI. The CSS is built from the `vendor\semantic` folder using gulp. We modify the Semantic less variables instead of overriding CSS elements.

+ Change any of the global site variables (see docs) https://semantic-ui.com/usage/theming.html

+ Change site variables here `/vendor/semantic/src/themes/hyperstack/globals/site.variables`
+ Navigate to `vendor\semantic`
+ `gulp build`
+ Webpack will import the output CSS as a part of the build process
