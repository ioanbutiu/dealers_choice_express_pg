module.exports = (post) => `<!DOCTYPE html>
  <html>
    <head>
      <title>Tech Blog</title>
      <link rel="stylesheet" href="/style.css" />
    </head>
    <body>
        <header>
          <a href="/"><h1>Tech Blog</h1></a>
        </header>
        <div class="blog-post">
          <img src="${post.image}">
          <h1>${post.title}</h1>
          <br>
          <p>${post.userId} | ${post.date}</p>
          <br>
          <p>${post.content}</p>
        </div>
    </body>
  </html>`;
