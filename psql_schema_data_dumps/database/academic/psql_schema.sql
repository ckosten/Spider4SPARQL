create table if not exists author (
    aid int,
    homepage text,
    name text,
    oid int,
    primary key(aid)
    );
    create table if not exists conference (
    cid int,
    homepage text,
    name text,
    primary key (cid)
    );
    create table if not exists domain (
    did int,
    name text,
    primary key (did)
    );
    create table if not exists domain_author (
    aid int, 
    did int,
    primary key (did, aid),
    foreign key(aid) references author(aid),
    foreign key(did) references domain(did)
    );
    
    create table if not exists domain_conference (
    cid int,
    did int,
    primary key (did, cid),
    foreign key(cid) references conference(cid),
    foreign key(did) references domain(did)
    );
    create table if not exists journal (
    homepage text,
    jid int,
    name text,
    primary key(jid)
    );
    create table if not exists domain_journal (
    did int,
    jid int,
    primary key (did, jid),
    foreign key(jid) references journal(jid),
    foreign key(did) references domain(did)
    );
    create table if not exists keyword (
    keyword text,
    kid int,
    primary key(kid)
    );
    create table if not exists domain_keyword (
    did int,
    kid int,
    primary key (did, kid),
    foreign key(kid) references keyword(kid),
    foreign key(did) references domain(did)
    );
    create table if not exists publication (
    abstract text,
    cid int,
    citation_num int,
    jid int,
    pid int,
    reference_num int,
    title text,
    year int,
    primary key(pid),
    foreign key(jid) references journal(jid),
    foreign key(cid) references conference(cid)
    );
    create table if not exists domain_publication (
    did int,
    pid int,
    primary key (did, pid),
    foreign key(pid) references publication(pid),
    foreign key(did) references domain(did)
    );
    
    create table if not exists organization (
    continent text,
    homepage text,
    name text,
    oid int,
    primary key(oid)
    );
    
    create table if not exists publication_keyword (
    pid int,
    kid int,
    primary key (kid, pid),
    foreign key(pid) references publication(pid),
    foreign key(kid) references keyword(kid)
    );
    create table if not exists writes (
    aid int,
    pid int,
    primary key (aid, pid),
    foreign key(pid) references publication(pid),
    foreign key(aid) references author(aid)
    );
    create table if not exists cite (
    cited int,
    citing  int,
    foreign key(cited) references publication(pid),
    foreign key(citing) references publication(pid)
    );
