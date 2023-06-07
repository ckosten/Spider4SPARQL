BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "actor" (
"aid" int,
"gender" text,
"name" text,
"nationality" text,
"birth_city" text,
"birth_year" int,
primary key("aid")
);
CREATE TABLE IF NOT EXISTS "cast" (
"id" int,
"msid" int,
"aid" int,
"role" int,
primary key("id"),
foreign key("aid") references actor("aid"),
foreign key("msid") references copyright("msid")
);
CREATE TABLE IF NOT EXISTS "classification" (
"id" int,
"msid" int,
"gid" int,
primary key("id"),
foreign key("gid") references genre("gid"),
foreign key("msid") references copyright("msid")
);
CREATE TABLE IF NOT EXISTS "company" (
"id" int,
"name" text,
"country_code" text,
primary key("id")
);
CREATE TABLE IF NOT EXISTS "copyright" (
"id" int,
"msid" int,
"cid" int,
primary key("id")
);
CREATE TABLE IF NOT EXISTS "directed_by" (
"id" int,
"msid" int,
"did" int,
primary key("id"),
foreign key("msid") references copyright("msid"),
foreign key("did") references director("did")
);
CREATE TABLE IF NOT EXISTS "director" (
"did" int,
"gender" text,
"name" text,
"nationality" text,
"birth_city" text,
"birth_year" int,
primary key("did")
);
CREATE TABLE IF NOT EXISTS "genre" (
"gid" int,
"genre" text,
primary key("gid")
);
CREATE TABLE IF NOT EXISTS "keyword" (
"id" int,
"keyword" text,
primary key("id")
);
CREATE TABLE IF NOT EXISTS "made_by" (
"id" int,
"msid" int,
"pid" int,
primary key("id"),
foreign key("msid") references copyright("msid"),
foreign key("pid") references producer("pid")
);
CREATE TABLE IF NOT EXISTS "movie" (
"mid" int,
"title" text,
"release_year" int,
"title_aka" text,
"budget" text,
primary key("mid")
);
CREATE TABLE IF NOT EXISTS "producer" (
"pid" int,
"gender" text,
"name" text,
"nationality" text,
"birth_city" text,
"birth_year" int,
primary key("pid")
);
CREATE TABLE IF NOT EXISTS "tags" (
"id" int,
"msid" int,
"kid" int,
primary key("id"),
foreign key("msid") references copyright("msid"),
foreign key("kid") references keyword("kid")
);
CREATE TABLE IF NOT EXISTS "tv_series" (
"sid" int,
"title" text,
"release_year" int,
"num_of_seasons" int,
"num_of_episodes" int,
"title_aka" text,
"budget" text,
primary key("sid")
);
CREATE TABLE IF NOT EXISTS "writer" (
"wid" int,
"gender" text,
"name" int,
"nationality" int,
"num_of_episodes" int,
"birth_city" text,
"birth_year" int,
primary key("wid")
);
CREATE TABLE IF NOT EXISTS "written_by" (
"id" int,
"msid" int,
"wid" int,
foreign key("msid") references copyright("msid"),
foreign key("wid") references writer("wid")
);
COMMIT;
