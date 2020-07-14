--Progression 1
CREATE TABLE city
(
id int,
name varchar(50) NOT NULL,
CONSTRAINT pk_city PRIMARY KEY(id)
);

CREATE TABLE REFREE
(
ID int,
NAME varchar(50) not null,
CONSTRAINT pk_ref PRIMARY KEY(ID)
);

Create table innings
(
id int,
innings_number int not null,
constraint pk_inning primary key(id)
);

create table extra_type
(
id int,
name varchar(50) not null,
constraint pk_extra primary key(id)
);

create table skill
(
id int,
name varchar(50) not null,
constraint pk_skills primary key(id)
);

create table team
(
id int,
name varchar(50) not null,
coach varchar(50) not null,
home_city int not null,
captain int not null,
constraint fk_teams FOREIGN KEY (home_city)
    REFERENCES city (id)
);   

create table player
(
id int,
name varchar(50) not null,
country varchar(50) not null,
skill_id int not null,
team_id int not null,
constraint pk_player primary key(id),
constraint fk_playskill foreign key(skill_id)REFERENCES skill (id),
constraint fk_playteam foreign key(team_id)REFERENCES team(id)
);

create table venue
(
id int,
stadium_name varchar(50),
city_id int not null,
constraint pk_venues primary key(id),
constraint fk_venuecity foreign key(city_id)REFERENCES city(id)
);

create table event
(
id int,
innings_id int not null,
event_no int not null,
raider_id int not null,
raid_points int not null,
defending_points int not null,
clock_in_seconds int not null,
team_one_score int not null,
team_two_score int not null,
constraint pk_events primary key(id),
constraint fk_eventinnings foreign key(innings_id)REFERENCES innings(id),
constraint fk_eventraider foreign key(raider_id) REFERENCES raider(id)
);

create table extra_event
(
id int,
event_id int not null,
extra_type_id int not null,
points int not null,
scoring_team_id int not null,
constraint pk_extra primary key(id),
constraint fk_eventid foreign key(event_id) REFERENCES event(id),
constraint fk_extype foreign key(extra_type_id) REFERENCES extra_type(id)
);

create table outcome
(
id int,
status varchar(100) not null,
winner_team_id int,
score int,
player_of_match int,
constraint pk_out primary key(id),
constraint fk_win foreign key(winner_team_id) REFERENCES winner_team(id),
constraint fk_playmatch foreign key(player_of_match) REFERENCES player_of_match(id)
);

create table game
(
id int,
game_date date not null,
team_id_1 int not null,
team_id_2 int not null,
venue_id int not null,
outcome_id int not null,
refree_id_1 int not null,
refree_id_2 int not null,
first_innings_id int not null,
second_innings_id int not null,
constraint pk_games primary key(id),
constraint fk_id1 foreign key(team_id_1) REFERENCES team(id),
constraint fk_id2 foreign key(team_id_2) REFERENCES team(id),
constraint fk_venue foreign key(venue_id) REFERENCES venue(id),
constraint fk_outcome foreign key(outcome_id) REFERENCES outcome(id),
constraint fk_ref1 foreign key(refree_id_1) REFERENCES refree(id),
constraint fk_ref2 foreign key(refree_id_2) REFERENCES refree(id),
constraint fk_inn1 foreign key(first_innings_id) REFERENCES innings(id),
constraint fk_inn2 foreign key(second_innings_id) REFERENCES innings(id)
);
--Progression 2
Drop table city;

Drop table innings;

Drop table skill;

Drop table extra_type;
