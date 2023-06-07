create table if not exists artist (
                                         artistid integer not null
       ,  name varchar(120) default null
       ,  primary key (artistid)
       );
   
   create table if not exists album (
      albumid integer not null
    ,  title varchar(160) not null
    ,  artistid integer not null
    ,  primary key (albumid)
    ,  constraint fk_albumartistid foreign key (artistid) references artist (artistid) on delete no action on update no action
    );
   create table if not exists genre (
                                        genreid integer not null
       ,  name varchar(120) default null
       ,  primary key (genreid)
       );
   
   create table if not exists mediatype (
                                            mediatypeid integer not null
       ,  name varchar(120) default null
       ,  primary key (mediatypeid)
       );
   create table if not exists playlist (
                                           playlistid integer not null
       ,  name varchar(120) default null
       ,  primary key (playlistid)
       );
   
   
   create table if not exists employee (
                                           employeeid integer not null
       ,  lastname varchar(20) not null
       ,  firstname varchar(20) not null
       ,  title varchar(30) default null
       ,  reportsto integer default null
       ,  birthdate timestamp default null
       ,  hiredate timestamp default null
       ,  address varchar(70) default null
       ,  city varchar(40) default null
       ,  state varchar(40) default null
       ,  country varchar(40) default null
       ,  postalcode varchar(10) default null
       ,  phone varchar(24) default null
       ,  fax varchar(24) default null
       ,  email varchar(60) default null
       ,  primary key (employeeid)
       ,  constraint fk_employeereportsto foreign key (reportsto) references employee (employeeid) on delete no action on update no action
       );
    create table if not exists customer (
      customerid integer not null
    ,  firstname varchar(40) not null
    ,  lastname varchar(20) not null
    ,  company varchar(80) default null
    ,  address varchar(70) default null
    ,  city varchar(40) default null
    ,  state varchar(40) default null
    ,  country varchar(40) default null
    ,  postalcode varchar(10) default null
    ,  phone varchar(24) default null
    ,  fax varchar(24) default null
    ,  email varchar(60) not null
    ,  supportrepid integer default null
    ,  primary key (customerid)
    ,  constraint fk_customersupportrepid foreign key (supportrepid) references employee (employeeid) on delete no action on update no action
    );
   
   
    create table if not exists invoice (
      invoiceid integer not null
    ,  customerid integer not null
    ,  invoicedate timestamp not null
    ,  billingaddress varchar(70) default null
    ,  billingcity varchar(40) default null
    ,  billingstate varchar(40) default null
    ,  billingcountry varchar(40) default null
    ,  billingpostalcode varchar(10) default null
    ,  total decimal(10,2) not null
    ,  primary key (invoiceid)
    ,  constraint fk_invoicecustomerid foreign key (customerid) references customer (customerid) on delete no action on update no action
    );
   
   
   
   create table if not exists track (
                                        trackid integer not null
       ,  name varchar(200) not null
       ,  albumid integer default null
       ,  mediatypeid integer not null
       ,  genreid integer default null
       ,  composer varchar(220) default null
       ,  milliseconds integer not null
       ,  bytes integer default null
       ,  unitprice decimal(10,2) not null
       ,  primary key (trackid)
       ,  constraint fk_trackalbumid foreign key (albumid) references album (albumid) on delete no action on update no action
       ,  constraint fk_trackgenreid foreign key (genreid) references genre (genreid) on delete no action on update no action
       ,  constraint fk_trackmediatypeid foreign key (mediatypeid) references mediatype (mediatypeid) on delete no action on update no action
       );
    create table if not exists invoiceline (
      invoicelineid integer not null
    ,  invoiceid integer not null
    ,  trackid integer not null
    ,  unitprice decimal(10,2) not null
    ,  quantity integer not null
    ,  primary key (invoicelineid)
    ,  constraint fk_invoicelineinvoiceid foreign key (invoiceid) references invoice (invoiceid) on delete no action on update no action
    ,  constraint fk_invoicelinetrackid foreign key (trackid) references track (trackid) on delete no action on update no action
    );
   
   
   
   
   
   create table if not exists playlisttrack (
                                                playlistid integer not null
       ,  trackid integer not null
       ,  primary key (playlistid,trackid)
       ,  constraint fk_playlisttrackplaylistid foreign key (playlistid) references playlist (playlistid) on delete no action on update no action
       ,  constraint fk_playlisttracktrackid foreign key (trackid) references track (trackid) on delete no action on update no action
       );
    create index if not exists idx_invoiceline_ifk_invoicelineinvoiceid on invoiceline (invoiceid);
    create index if not exists idx_invoiceline_ifk_invoicelinetrackid on invoiceline (trackid);
    create index if not exists idx_album_ifk_albumartistid on album (artistid);
    create index if not exists idx_employee_ifk_employeereportsto on employee (reportsto);
    create index if not exists idx_playlisttrack_ifk_playlisttracktrackid on playlisttrack (trackid);
    create index if not exists idx_customer_ifk_customersupportrepid on customer (supportrepid);
    create index if not exists idx_track_ifk_trackalbumid on track (albumid);
    create index if not exists idx_track_ifk_trackgenreid on track (genreid);
    create index if not exists dx_track_ifk_trackmediatypeid on track (mediatypeid);
    create index if not exists idx_invoice_ifk_invoicecustomerid on invoice (customerid);
