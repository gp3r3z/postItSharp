CREATE TABLE IF NOT EXISTS accounts(
  id VARCHAR(255) NOT NULL primary key COMMENT 'primary key',
  createdAt DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Time Created',
  updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update',
  name varchar(255) COMMENT 'User Name',
  email varchar(255) COMMENT 'User Email',
  picture varchar(255) COMMENT 'User Picture'
) default charset utf8 COMMENT '';


CREATE TABLE
    IF NOT EXISTS albums(
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        title VARCHAR(50) NOT NULL,
        coverImg VARCHAR(255) NOT NULL DEFAULT 'https://images.unsplash.com/photo-1575485670541-824ff288aaf8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80',
        category VARCHAR(25) NOT NULL DEFAULT 'misc',
        archived BOOLEAN NOT NULL DEFAULT false,
        creatorId VARCHAR(255) NOT NULL,
        FOREIGN KEY (creatorId) REFERENCES accounts (id) ON DELETE CASCADE
) default charset utf8 COMMENT '';

INSERT INTO
    albums (
        title,
        category,
        `coverImg`,
        `creatorId`
    )
VALUES (
        'Dogs',
        'Corgi',
        'https: / / upload.wikimedia.org / wikipedia / commons / thumb / f / fb / Welchcorgipembroke.JPG / 1200 px - Welchcorgipembroke.JPG',
        '63c86ef6fe8ca7407d9687b3'
    );
