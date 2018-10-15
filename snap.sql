ALTER DATABASE jjain2 CHARACTER SET utf8 COLLATE utf8_unicode_ci;

DROP TABLE IF EXISTS articleTag;
DROP TABLE IF EXISTS article;
DROP TABLE IF EXISTS tag;
DROP TABLE IF EXISTS author;

CREATE TABLE author (
	authorId BINARY(16) NOT NULL,
	authorAvatarUrl VARCHAR(250),
	authorActivationToken CHAR(32),
	authorEmail VARCHAR(128) NOT NULL,
	authorHash CHAR(97) NOT NULL,
	authorUsername VARCHAR(32) NOT NULL,
	UNIQUE(authorEmail),
	UNIQUE(authorUsername),
	INDEX (authorEmail),
	PRIMARY KEY(authorId)
);

CREATE TABLE tag (
	tagId BINARY(16) NOT NULL,
	tagName VARCHAR(32) NOT NULL,
	PRIMARY KEY (tagId, tagName)
);

CREATE TABLE article (
	articleId BINARY(16) NOT NULL,
	articleAuthorId BINARY(16) NOT NULL,
	articleContent VARCHAR(40000) NOT NULL,
	articleDate DATETIME(8) NOT NULL,
	articleImage VARCHAR(128),
	INDEX(articleAuthorId),
	FOREIGN KEY(articleAuthorId) REFERENCES author(authorId),
	PRIMARY KEY (articleId)
);

CREATE TABLE articleTag(
	articleTagArticleId BINARY(16),
	articleTagTagId BINARY(16),
	INDEX (articleTagArticleId),
	INDEX (articleTagTagId),
	FOREIGN KEY (articleTagTagId) REFERENCES tag(tagId),
	FOREIGN KEY(articleTagArticleId) REFERENCES article(articleId),
	PRIMARY KEY (articleTagArticleId, articleTagTagId)
)