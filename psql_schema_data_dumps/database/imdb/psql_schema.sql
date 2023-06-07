create table if not exists actor (
    aid int,
    gender text,
    name text,
    nationality text,
    birth_city text,
    birth_year int,
    primary key(aid)
    );
    
    
    create table if not exists copyright (
    id int,
    msid int,
    cid int,
    primary key(id)
    );
    create table if not exists cast_of_actors (
    id int,
    msid int,
    aid int,
    role int,
    primary key(id),
    foreign key(aid) references actor(aid),
    foreign key(msid) references copyright(msid)
    );
    
    create table if not exists genre (
    gid int,
    genre text,
    primary key(gid)
    );
    
    create table if not exists classification (
    id int,
    msid int,
    gid int,
    primary key(id),
    foreign key(gid) references genre(gid),
    foreign key(msid) references copyright(msid)
    );
    
    create table if not exists company (
    id int,
    name text,
    country_code text,
    primary key(id)
    );
    
    
    create table if not exists director (
    did int,
    gender text,
    name text,
    nationality text,
    birth_city text,
    birth_year int,
    primary key(did)
    );
    
    create table if not exists producer (
    pid int,
    gender text,
    name text,
    nationality text,
    birth_city text,
    birth_year int,
    primary key(pid)
    );
    
    create table if not exists directed_by (
    id int,
    msid int,
    did int,
    primary key(id),
    foreign key(msid) references copyright(msid),
    foreign key(did) references director(did)
    );
    
    create table if not exists keyword (
    id int,
    keyword text,
    primary key(id)
    );
    
    create table if not exists made_by (
    id int,
    msid int,
    pid int,
    primary key(id),
    foreign key(msid) references copyright(msid),
    foreign key(pid) references producer(pid)
    );
    
    create table if not exists movie (
    mid int,
    title text,
    release_year int,
    title_aka text,
    budget text,
    primary key(mid)
    );
    create table if not exists tags (
    id int,
    msid int,
    kid int,
    primary key(id),
    foreign key(msid) references copyright(msid),
    foreign key(kid) references keyword(kid)
    );
    create table if not exists tv_series (
    sid int,
    title text,
    release_year int,
    num_of_seasons int,
    num_of_episodes int,
    title_aka text,
    budget text,
    primary key(sid)
    );
    create table if not exists writer (
    wid int,
    gender text,
    name int,
    nationality int,
    num_of_episodes int,
    birth_city text,
    birth_year int,
    primary key(wid)
    );
    create table if not exists written_by (
    id int,
    msid int,
    wid int,
    foreign key(msid) references copyright(msid),
    foreign key(wid) references writer(wid)
    );
