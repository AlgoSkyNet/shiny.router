
<link href="http://fonts.googleapis.com/css?family=Lato:300,700,300italic|Inconsolata" rel="stylesheet" type="text/css"> <link href='docs/style.css' rel='stylesheet' type='text/css'>

<img src="man/figures/shiny.router.png" align="right" alt="" width="150" />

shiny.router
============

A minimalistic router for your [Shiny](https://shiny.rstudio.com/) apps. <br>

[![Travis build status](https://travis-ci.org/Appsilon/shiny.router.svg?branch=master)](https://travis-ci.org/Appsilon/shiny.router) [![codecov](https://codecov.io/gh/Appsilon/shiny.router/branch/master/graph/badge.svg)](https://codecov.io/gh/Appsilon/shiny.router)

Now it's possible to recreate a state of your app, by providing a specific URL, like:

    make_router(
      route("<your_app_url>/main",  mainPageShinyUI),
      route("<your_app_url>/other", otherPageShinyUI)
    )

<!--
TODO We would like to have a nice graphic explaning routing mechanism
-->
Basic tutorial article is available on [Appsilon Data Science blog](http://blog.appsilon.com/rstats/2016/12/08/shiny.router.html).

<p style="text-align: center; font-size: x-large;">
<a href="https://demo.appsilon.ai/apps/router/">Live demo</a>
</p>

Source code
-----------

This library source code can be found on [Appsilon Data Science's](http://appsilon.com) Github: <br> <https://github.com/Appsilon/shiny.router>

How to install?
---------------

It's possible to install this library through CRAN

    install.packages("shiny.router")

The most recent version you can get from this repo using [devtools](https://github.com/hadley/devtools).

    devtools::install_github("Appsilon/shiny.router")

To install [previous version](https://github.com/Appsilon/shiny.router/blob/master/CHANGELOG.md) you can run:

    devtools::install_github("Appsilon/shiny.router", ref = "0.1.0")

Example
-------

Visit [examples](https://github.com/Appsilon/shiny.router/tree/master/examples) directory for some complete samples. Here's the basic usage:

    router <- make_router(
      route("/", root_page),
      route("/other", other_page)
    )

    ui <- shinyUI(semanticPage(
      title = "Router demo",
      router_ui()
    ))

    server <- shinyServer(function(input, output) {
      router(input, output)
    })

    shinyApp(ui, server)

How to contribute?
------------------

If you want to contribute to this project please submit a regular PR, once you're done with new feature or bug fix.<br>

**Changes in documentation**

Both repository **README.md** file and an official documentation page are generated with Rmarkdown, so if there is a need to update them, please modify accordingly a **README.Rmd** file and use [readmebuilder](https://github.com/Appsilon/readmebuilder) package to render the new README.

In most cases a simple call of:

``` r
readmebuilder::build_readme()
```

Troubleshooting
---------------

We used the latest versions of dependencies for this library, so please update your R environment before installation.

However, if you encounter any problems, try the following:

1.  Up-to-date R language environment
2.  Installing specific dependent libraries versions
    -   magrittr

            install.packages("magrittr", version='1.5') 

    -   shiny

            install.packages("shiny", version='0.14.2.9001')

3.  Missing semanticui dependency - one of our examples uses one of our others libraries, so please install it as well, when running that example. Repository: [semanticui](https://github.com/Appsilon/semanticui)

Future enhacements
------------------

-   URL params handling
-   CRAN release
-   consider utilising <https://shiny.rstudio.com/articles/client-data.html> instead of Page.js

Appsilon Data Science
=====================

Get in touch [dev@appsilon.com](dev@appsilon.com)
