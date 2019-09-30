---

title: Building a simple static website with webpack
date: 2019-08-25 04:02 UTC
tags: webpack, static, site, javascript, multiple pages
published: false

---

I am used to building static websites with middleman. Infact the blog that you are reading right now is build using Middleman. It is an awesome tool, that gets the job done correctly but that won't stop me from exploring different options.

[Webpack](https://webpack.js.org/) is a static module bundler for modern JavaScript applications. In simple terms it takes a bunch of JavaScript (but not only) files and transpiles them. It is generally used for more complex Javascript applications. It is probably an overkill to use it for a simple static website, but my motivation behind learning it is that I can then apply that knowledge to build more complex things. Rails 6 moved from the asset pipeline to webpack. I am also using webpack for my senior project.

Webpack is documented very well, read about it [here](https://webpack.js.org/concepts/).

# Requirements
* [nodejs](https://nodejs.org/en/)
* [yarn](https://yarnpkg.com/lang/en/docs/install/#debian-stable)

# Lets get started
Initialize a git repository. Version controll will save your ass.
`git init .`
`echo /node_modules/ >> .gitignore` # not everything needs to be in the repo.

Initialize a js project with `yarn init`, follow the prompts. Make sure you select yes on the `private` prompt.
Next install `webpack` by running `yarn add webpack --dev`. # the --dev part makes it so that the package is a development dependency only.
`yarn add webpack-cli --dev`
`yarn add html-webpack-plugin --dev` # we also need this to load html files
`yarn add webpack-dev-server --dev` # we need a dev server for easier development
Delete the `"main": "index.js",` line from the project.json file

Make a dist and src folder:
`mkdir dist src` # the dist folder will contain our transpiled JS and HTML, and the src folder is where our code goes.
`touch src/index.js src/index.html` # to get us started we will do something simple

Here is some code that you can use to verify that things work properly:
This goes into `src/index.html`:
```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="description" content="">
  <meta name="author" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title></title>
</head>
<body>

  <script src="main.js"></script>
</body>
</html>
```
*Notice the script. We include `main.js`, in a little bit we will configure webpack to bundle everything into main.js.*

This goes into `src/index.js`:
```js
function helloWorld() {
  const el = document.createElement('div');
  el.innerHTML = 'Hello World';
  return el;
}

document.body.appendChild(helloWorld());
```

Next we set up the webpack config file.
`touch webpack.config.js` # creates the file

Here is a good start for the `webpack.config.js` file:
```js
const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
  entry: './src/index.js',
  devServer: {
    port: 8080
  },
  output: {
    filename: 'main.js',
    path: path.resolve(__dirname, 'dist')
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: './src/index.html',
      inject: 'body',
      chunks: ['index'],
      filename: 'index.html'
    })
  ]
};
```

Finally lets add a script in package.json so we can easily run our web-dev server:
```json
...
  "scripts": {
    "dev": "webpack-dev-server"
  },
...
```

Lets test if everything works so far, by running `yarn run dev`.
Open up your browser, go to `localhost:8080` and confirm that you can see `Hello World` rendering.

Next we will make this basic setup actually production ready. What are we missing?
We need to be able to load sass, fonts, images and have multiple pages. We also need to minify all the css, and be able to deploy to GitHub pages easily.

# Multiple page website

To achieve that all we have to do is define multiple entry points. Webpack documentation about it is [here](https://webpack.js.org/concepts/entry-points/#multi-page-application).
We will change our entry attribute of `webpack.config.js` like:
```js
...
  entry: {
    index: '.src/index.js',
    about: '.src/about.js'
  }
...
```

Then we need to tell the HtmlWebpackPlugin how to load the extra html pages. We do that by adding extra entries to the plugins sections of `webpack.config.js`:
```js
...
  plugins: [
    new HtmlWebpackPlugin({
      template: './src/index.html',
      inject: true,
      chunks: ['index'],
      filename: 'index.html'
    }),
    new HtmlWebpackPlugin({
      template: './src/about.html',
      inject: true,
      chunks: ['about'],
      filename: 'about.html'
    })
  ]
...
```

# More loaders

Now lets handle the loading of other assets like images, fonts and css.

## Latest JS features
Taking advantage of the latest ES6 JS features can help development. In order to do that we need a JS transpiler.
I like to use Babel. Here is how I set that up.
We are going to add our first loaders to `webpack.config.js`. Read about loaders [here](https://webpack.js.org/concepts/loaders/).
```js
...
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'babel-loader',
        options: {
          presets: ['@babel/preset-env']
        }
      }
    ]
  }
...
```
## CSS and SCSS
First we need to get some more JS packages that will help webpack load sass.
`yarn add node-sass sass-loader style-loader css-loader --dev`

Then we add more rules under the module attribute in `webpack.config.js`.

```js
...
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'babel-loader',
        options: {
          presets: ['@babel/preset-env']
        }
      },
      // add this
      {
        test: /\.s[ac]ss$/i,
        use: [
          'style-loader',
          'css-loader',
          'sass-loader',
        ],
      }
    ]
...
```
In order to get css working you need to import it in your js file. For example if we want to add `about.scss` to our about html page, all that has to be done is add `import src/<your_path>/about.scss`
to the top of `about.js`.

Last thing left is to minify all the css, this should only happen in production. Read about it [here](https://github.com/webpack-contrib/mini-css-extract-plugin).
To install it use `yarn add mini-css-extract-plugin --dev`

# Image loaders
This one will let us bundle images with everything else. To set it up we need to isntall the file loader plugin and tell webpack how to use it.
`yarn add file-loader -dev`
and then add the code below under rules in `webpack.config.js`
```js
...
      {
        test: /\.s[ac]ss$/i,
        use: [
          'style-loader',
          'css-loader',
          'sass-loader',
        ],
      },
      // add this
      {
        test: /\.(png|svg|jpeg)$/i,
        use: [
          'file-loader'
        ],
      }
    ]
...
```

