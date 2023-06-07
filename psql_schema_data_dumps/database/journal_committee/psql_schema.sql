create table if not exists journal (
     journal_id int,
     date text,
     theme text,
     sales int,
     primary key (journal_id)
     );
     create table if not exists editor (
     editor_id int,
     name text,
     age real,
     primary key (editor_id)
     );
     create table if not exists journal_committee (
     editor_id int,
     journal_id int,
     work_type text,
     primary key (editor_id,journal_id),
     foreign key (editor_id) references editor(editor_id),
     foreign key (journal_id) references journal(journal_id)
     );
     
