const express = require('express');
const morgan = require('morgan');
const client = require('./db');
const blogPost = require('./views/blogPost');

const app = express();

app.use(morgan('dev'));
app.use(express.urlencoded());
app.use(express.static(__dirname + '/assets'));
// app.use(require('method-override')('_method'));

app.use('/posts', require('./routes/posts'));

app.use('/assets', express.static('assets'));

app.get('/', async (req, res, next) => {
  try {
    // const posts = (await client.query('SELECT * FROM posts')).rows;
    const posts = (
      await client.query(
        'SELECT posts.*, users.name FROM posts INNER JOIN users ON users.id = posts.userId'
      )
    ).rows;

    const html = `
      <html>
        <head>
          <title>Tech Blog</title>
          <link rel="stylesheet" href="/style.css" />
        </head>
        <body>
          <header>
            <h1>Tech Blog</h1>
          </header>
          <div class="blog-items-container">
          ${posts
            .map(
              (post) => ` <a href="/posts/${post.id}" class="blog-item">
              <img src="${post.image}">
              <div class="item-text">
                <h2>${post.title}</h2>
                <br>
                <p>by ${post.name} | ${post.date}</p>
                </div>
            </a>`
            )
            .join(' ')}
          </div>
        </body>
      </html>
    `;

    res.send(html);
  } catch (error) {
    next(error);
  }
});

const PORT = process.env.PORT || 1337;

require('fs').readFile('seed.sql', async (err, result) => {
  if (err) {
    throw err;
  }
  await client.query(result.toString());
  console.log('data seeded');

  app.listen(PORT, () => {
    console.log(`App listening in port ${PORT}`);
  });
});
