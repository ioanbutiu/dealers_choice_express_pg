const fs = require('fs');
const faker = require('faker');
const argv = require('yargs').argv;

const lines = argv.lines || 10000;
const filename = argv.output || 'posts.csv';
const writeStream = fs.createWriteStream(filename);

const createPost = () => {
  const userId = faker.random.number(10);
  const title = faker.hacker.phrase();
  const content = faker.lorem.paragraph();
  const image = faker.image.image();
  const date = faker.date.recent();

  return `${userId},${title},${content},${image},${date}\n`;
};

const startWriting = (writeStream, encoding, done) => {
  let i = lines;
  function writing() {
    let canWrite = true;
    do {
      i--;
      let post = createPost();
      if (i === 0) {
        writeStream.write(post, encoding, done);
      } else {
        writeStream.write(post, encoding);
      }
    } while (i > 0 && canWrite);
  }
  writing();
};

writeStream.write(`userId,title,content,image,date\n`, 'utf-8');
startWriting(writeStream, 'utf-8', () => {
  writeStream.end();
});
