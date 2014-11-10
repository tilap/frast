### Command line

```make install```

Will install all the dependancies for the first time (node and bower packages) and copy a samble config file.


```make update```

Update the dependancies (npm and bower) after prune to keep installed packages cleaned.

```make watch```

Start the local webserver and watch all the sources files, triggering live reload on usefull file changes.

```make githubio```

Initialize the local and remote gh-pages branch. Delete the existing ones if any.

```make publish```

Publish the static webpages built on the gh-pages branch of your repositoriy.


```make clean```

Clean all the useless stuff. Usefull when you need to tar you code.


```make fontopenmac```

Open the project fonticon library on your browser (for Mac users)

```make fontopenlinux```

Open the project fonticon library on your browser (for Linux users)

```make fontsave```

Once you have edited your font on fontello, use it to import your fonticon in your project.