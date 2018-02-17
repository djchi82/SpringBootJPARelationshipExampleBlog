--// Base tables creation
-- Migration SQL that makes the change goes here.

CREATE SCHEMA jpaexample;

CREATE TABLE jpaexample.artist(
  artist_id bigserial NOT NULL,
  name VARCHAR(50) UNIQUE NOT NULL,
  CONSTRAINT pk_artist PRIMARY KEY (artist_id)
);

CREATE TABLE jpaexample.recording(
  recording_id BIGSERIAL NOT NULL,
  title VARCHAR (256) NOT NULL ,
  artist_id BIGINT NOT NULL,
  CONSTRAINT pk_recording PRIMARY KEY (recording_id)
);

CREATE TABLE jpaexample.release(
  release_id bigserial NOT NULL,
  title VARCHAR (256) NOT NULL ,
  CONSTRAINT pk_release PRIMARY KEY (release_id)
);

CREATE TABLE jpaexample.track(
  track_id bigserial NOT NULL,
  recording_id BIGINT NOT NULL,
  release_id BIGINT NOT NULL,
  CONSTRAINT pk_track PRIMARY KEY (track_id)
);

CREATE TABLE jpaexample.ranking(
  ranking_id bigserial NOT NULL,
  artist_id BIGINT NOT NULL,
  user_ratings INT,
  overall_rating INT,
  CONSTRAINT pk_ranking PRIMARY KEY (ranking_id)
);

ALTER TABLE jpaexample.recording ADD CONSTRAINT fk_recording_artistid FOREIGN KEY (artist_id)
REFERENCES jpaexample.artist (artist_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE NOT DEFERRABLE;

ALTER TABLE jpaexample.track ADD CONSTRAINT fk_track_recordingid FOREIGN KEY (recording_id)
REFERENCES jpaexample.recording (recording_id)  MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE NOT DEFERRABLE;

ALTER TABLE jpaexample.track ADD CONSTRAINT fk_track_releaseid FOREIGN KEY (release_id)
REFERENCES jpaexample.release (release_id)  MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE NOT DEFERRABLE;

ALTER TABLE jpaexample.ranking ADD CONSTRAINT fk_ranking_artistid FOREIGN KEY (artist_id)
REFERENCES jpaexample.artist (artist_id)  MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE NOT DEFERRABLE;

--//@UNDO
-- SQL to undo the change goes here.
DROP SCHEMA IF EXISTS jpaexample CASCADE;
