DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    team_name TEXT UNIQUE,
    league_rank INTEGER NOT NULL
);

CREATE TABLE games
(
    id SERIAL PRIMARY KEY,
    team_one INTEGER REFERENCES teams ON DELETE CASCADE,
    team_two INTEGER REFERENCES teams ON DELETE CASCADE
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT,
    jersey_number INTEGER NOT NULL,
    player_team INTEGER REFERENCES teams ON DELETE SET NULL
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    goal_time INTEGER NOT NULL,
    scoring_player INTEGER REFERENCES players ON DELETE CASCADE,
    game_scored INTEGER REFERENCES games ON DELETE CASCADE
);

CREATE TABLE referees 
(
    id SERIAL PRIMARY KEY,
    match_refereed INTEGER REFERENCES games ON DELETE SET NULL
);

CREATE TABLE seasons
(
    id SERIAL PRIMARY KEY,
    start_of_season INTEGER NOT NULL,
    end_of_season INTEGER NOT NULL
);