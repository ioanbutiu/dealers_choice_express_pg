const express = require('express');
const client = require('../db');
const blogPost = require('../views/blogPost');

const app = express.Router();
module.exports = app;

app.get('/:id', async (req, res, next) => {
  try {
    const data = await client.query('SELECT * FROM posts WHERE posts.id = $1', [
      req.params.id,
    ]);

    const post = data.rows[0];

    res.send(blogPost(post));
  } catch (error) {
    next(error);
  }
});
