### Quick how-to / F.A.Q.

#### How to start?

First of all, install _Frast_ (see "Install Frast in a minute" section above)

#### I don't like doc, I prefer code

Checkout and take a llok at the [demo branch](https://github.com/tilap/frast/tree/demo) of the repo. It's the source code of the current page.

#### Where is my source code?

All your source code is in the "src" folder. Subfolders are explicitly named:

- **assets**: static images (mostly used as background image or with inline tag <img>). All of them will be optimised/copy in **/dist/assets/**
- **fonts**: for fonts
    - **fonts/fontello** folder automatically import from fontello with the _make font*_ command lines
- **html** for all your html/ejs/markdown files. All the first level pages will be output in **/dist/**. See below for all the file processing and the available helpers/tools.
- **js** for the Javascripts that are browserified, compressed and copy in the **/dist/js/** folder
- **sprites**: the place where you put png/jpg that will be aggregate in a sprite - see below for more information.
- **stylesheet**: where you put your less files. Each top level less file will be output as a compiled/compressed css file with the same basename in **dist/stylesheet**
    - **sprites**: contains the automatically generated file _sprites.less_ when using sprites.
- **tools**: templates files for sprites and other tools

#### HTML helpers

##### Insert variable from config (EJS)

Set your configuration values in the config.js 'contentdata' property. Then use ejs standard markers. Example :

In config.js

    module.exports = {
        contentdata: {
            app: {
                name: 'Frast'
            },
            author: 'Tilap'
        },
        server: {
        ...


In a html top level page:

    <%- app.name %>
    <%- author %>

##### Include html files in your main html

To include a basic html:

    @@include('./includes/my-file.html')

To include a html, setting some content vars:

    @@include('./includes/my-file.html', {
        var1: 'my var 1 value is wonderfull',
        var2: 'my var 2 value is awesome'
    })

In your **./includes/my-file.html** file, you'll be able to display the vars values anywhere in the dom with:

    @@var1
    @@var2


##### Include markdown files in your main html

To include a markdown file that will be compiled in html:

    @@include(markdown('./includes/my-markdown.md'))

##### Include a random image

Thanks to [Lorem Pixel](http://lorempixel.com) service, you can set random image for your mockup anywhere in your top level html page. For a 400px x 250px random image, use that for example:

    <%- randomImg(400, 250, 'nightlife') %>

You can set the following categories: abstract, animals, business, cats, city, food, nightlife, fashion, people, nature, sports, technics, transport.

##### Include css/javascript

The compliation task use _usemin_ plugin. SO in your html, you can merge many external css/js files with it. For example:

    <!-- build:js js/bundle.js -->
    <script src="../../vendor/jquery/dist/jquery.js"></script>
    <script src="js/app.js"></script>
    <!-- endbuild -->

Will merge _../../vendor/jquery/dist/jquery.js_ and _js/app.js_ files, compress them, rename the whole result in js/bundle.js file. Moreover, it will add a unique suffix (ie somthing like js/bundle-01234.js) automatically and replace the whole closure with a beautifull 

    <script src="js/bundle-01234.js"></script>

The suffix is a hash based on file content, so it avoid browser script/css file caching.

You can do the same with css:

    <!-- build:css stylesheet/style.css -->
    <link rel="stylesheet" href="../../tmp/stylesheet/stylesheet.css" />
    <!-- endbuild -->

(here only one file, but will still be renamed with a hash suffix so no brwoser cache problem).


#### How to use external libs (bootstrap, jquery, and so on...)

**Frast** is built over [bower](http://bower.io/search/). If you don't know _bower_, here a really basic usage (try learning the few thing to know by asking Google...). To install bootstrap for example:

    bower install --save bootstrap

##### How to use less files ?

Less is compiled by default with bower directory as additional path. So just put something like :

    @import 'bootstrap/less/mixins/vendor-prefixes.less';

or if you want the whole bootstrap css file:

    @import (inline) 'bootstrap/dist/css/bootstrap.css';

##### How to add external javascript files ?

You have 2 main ways do to it. Some external libraries can be browserified, so just use require.

If not, use the html helper describes above.

#### How to change the linter options, disable a feature, ....?

Just read and edit the config.js file after installing.