-- DROP DATABASE IF EXISTS blog;

-- CREATE DATABASE blog;

-- \c blog;
DROP TABLE IF EXISTS upvotes;
DROP TABLE IF EXISTS users, posts;

CREATE TABLE IF NOT EXISTS users (
  id  SERIAL PRIMARY KEY,
  name VARCHAR(255) DEFAULT NULL,
  email VARCHAR(255) DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS posts (
  id SERIAL PRIMARY KEY,
  userId INTEGER REFERENCES users(id) NOT NULL,
  title VARCHAR(255) DEFAULT NULL,
  content TEXT,
  image VARCHAR(255) DEFAULT NULL,
  date VARCHAR(255) DEFAULT CURRENT_DATE
);

INSERT INTO users (name) VALUES ('Aaron');
INSERT INTO users (name) VALUES ('Boris');
INSERT INTO users (name) VALUES ('Caitlyn');
INSERT INTO users (name) VALUES ('David');

INSERT INTO posts (userId, title, content, image, date) VALUES ((SELECT id from users where name='Aaron'), 'Use the digital PCI sensor', 'Quasi itaque consequatur nihil quis possimus. Cupiditate ea voluptas quod inventore nobis necessitatibus labore enim. Quia laudantium repellendus necessitatibus vel. Esse perspiciatis quibusdam optio.', 'http://placeimg.com/640/480/tech', 'Wed May 18, 2022');
INSERT INTO posts (userId, title, content, image, date) VALUES ((SELECT id from users where name='Boris'), 'I will quantify the cross-platform XSS microchip', 'Quasi itaque consequatur nihil quis possimus. Cupiditate ea voluptas quod inventore nobis necessitatibus labore enim. Quia laudantium repellendus necessitatibus vel. Esse perspiciatis quibusdam optio.', 'http://placeimg.com/640/480/tech', 'Tue May 17, 2022');
INSERT INTO posts (userId, title, content, image, date) VALUES ((SELECT id from users where name='Caitlyn'), 'You can not reboot the monitor without copying the digital SAS pixel!', 'Quasi itaque consequatur nihil quis possimus. Cupiditate ea voluptas quod inventore nobis necessitatibus labore enim. Quia laudantium repellendus necessitatibus vel. Esse perspiciatis quibusdam optio.', 'http://placeimg.com/640/480/tech', 'Mon May 16, 2022');
INSERT INTO posts (userId, title, content, image, date) VALUES ((SELECT id from users where name='David'), 'The THX driver is down', 'Quasi itaque consequatur nihil quis possimus. Cupiditate ea voluptas quod inventore nobis necessitatibus labore enim. Quia laudantium repellendus necessitatibus vel. Esse perspiciatis quibusdam optio.', 'http://placeimg.com/640/480/tech','Fri May 13, 2022');
INSERT INTO posts (userId, title, content, image, date) VALUES ((SELECT id from users where name='Aaron'), 'If we bypass the bandwidth', 'Quasi itaque consequatur nihil quis possimus. Cupiditate ea voluptas quod inventore nobis necessitatibus labore enim. Quia laudantium repellendus necessitatibus vel. Esse perspiciatis quibusdam optio.', 'http://placeimg.com/640/480/tech', 'Thurs May 12, 2022');
INSERT INTO posts (userId, title, content, image, date) VALUES ((SELECT id from users where name='Boris'), 'Use the optical SMTP system', 'Quasi itaque consequatur nihil quis possimus. Cupiditate ea voluptas quod inventore nobis necessitatibus labore enim. Quia laudantium repellendus necessitatibus vel. Esse perspiciatis quibusdam optio.', 'http://placeimg.com/640/480/tech', 'Wed May 11, 2022');
INSERT INTO posts (userId, title, content, image, date) VALUES ((SELECT id from users where name='Caitlyn'), 'Try to back up the USB sensor', 'Quasi itaque consequatur nihil quis possimus. Cupiditate ea voluptas quod inventore nobis necessitatibus labore enim. Quia laudantium repellendus necessitatibus vel. Esse perspiciatis quibusdam optio.', 'http://placeimg.com/640/480/tech', 'Tue May 10, 2022');
INSERT INTO posts (userId, title, content, image, date) VALUES ((SELECT id from users where name='David'), 'We need to synthesize the open-source XML driver!', 'Quasi itaque consequatur nihil quis possimus. Cupiditate ea voluptas quod inventore nobis necessitatibus labore enim. Quia laudantium repellendus necessitatibus vel. Esse perspiciatis quibusdam optio.', 'http://placeimg.com/640/480/tech', 'Mon May 09, 2022');

