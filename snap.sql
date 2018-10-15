ALTER DATABASE jjain2 CHARACTER SET utf8 COLLATE utf8_unicode_ci;
DROP TABLE IF EXISTS author;
DROP TABLE IF EXISTS tag;
DROP TABLE IF EXISTS article;
DROP TABLE IF EXISTS articleTag;

CREATE TABLE author (
	authorId BINARY(16) NOT NULL,
	authorAvatarUrl VARCHAR(250) NOT NULL,
	authorActivationToken CHAR(32),
	authorEmail VARCHAR(32) NOT NULL,
	authorHash CHAR(97)  NOT NULL,
	authorUsername VARCHAR(16) NOT NULL,
	UNIQUE(authorEmail),
	UNIQUE(authorUsername),
	PRIMARY KEY(authorId)
);

CREATE TABLE tag (
	tagId BINARY(16) NOT NULL,
	tagName VARCHAR(32) NOT NULL,
	UNIQUE(tagId),
	PRIMARY KEY (tagId, tagName)
);

CREATE TABLE article (
	articleId BINARY(16) NOT NULL,
	articleAuthorId BINARY(16) NOT NULL,
	articleContent VARCHAR(8000) NOT NULL,
	articleDate CHAR(8) NOT NULL,
	articleImage VARCHAR(128),
	UNIQUE(articleId),
	INDEX(articleAuthorId),
	FOREIGN KEY(articleAuthorId) REFERENCES author(authorId)
);

CREATE TABLE articleTag(
	articleTagArticleId BINARY(16),
	articleTagTagId BINARY(16),
	UNIQUE(articleTagTagId),
	UNIQUE(articleTagArticleId),
	INDEX (articleTagArticleId),
	INDEX (articleTagTagId),
	FOREIGN KEY (articleTagTagId) REFERENCES tag(tagId),
	FOREIGN KEY(articleTagArticleId) REFERENCES article(articleId),
	PRIMARY KEY (articleTagArticleId, articleTagTagId)
)