Bootstrapper CLI
================

Help and Synopsis: ./ontop help bootstrap

```
$ ./ontop help bootstrap
NAME
        ontop bootstrap - Bootstrap ontology and mapping from the database

SYNOPSIS
        ontop bootstrap [ {-a | --advanced} ] [ {-b | --base-iri} <base IRI> ]
                [ {-c | --constraint} <constraint file> ]
                [ {-d | --dictionary} <Bootstrapper Dictionary File> ]
                {-m | --mapping} <mapping file>
                {-p | --properties} <properties file>
                [ {-t | --ontology} <ontology file> ]
                [ {-w | --workload} <Workload JSON file> ]

OPTIONS
        -a, --advanced
            Enable patterns-based generation (MPBoot)

        -b <base IRI>, --base-iri <base IRI>
            base uri of the generated mapping

        -c <constraint file>, --constraint <constraint file>
            user supplied DB constraint file

        -d <Bootstrapper Dictionary File>, --dictionary <Bootstrapper Dictionary File>
            Path to the bootstrapper configuration json file [with -a only]

        -m <mapping file>, --mapping <mapping file>
            Mapping file in R2RML (.ttl) or in Ontop native format (.obda)

        -p <properties file>, --properties <properties file>
            Properties file

        -t <ontology file>, --ontology <ontology file>
            OWL ontology file

        -w <Workload JSON file>, --workload <Workload JSON file>
            Query workload [with -a only]
```

Vanilla Generation
---

To generate your ontology and mappings through the *Ontop Direct Mapping* technique, please use the following command:

```
./ontop bootstrap -p onto.properties -b 'http://baseuri.org' -m onto.obda -t onto.owl
```

The `onto.obda` and `onto.owl` file will be empty (mappings and ontology) files. The -b option specifies the *base uri* to be used for your ontology.

Domain and Range Axioms
---

The `-a` option enables the "advanced mode" (that is, the bootstrapped ontology will contain domain and range declarations for object and data properties).

```
./ontop bootstrap -a -p onto.properties -b 'http://baseuri.org' -m onto.obda -t onto.owl
```

Structure of the Dictionary File
--------

In Direct Mapping (and in Ontop Direct Mapping), the names for classes and properties are based on table and attribute names used in the DB. If this default behavior must be changed, one can provide the bootstrapper with a JSON *dictionary*: 

```
{
  "dictionary" :
  [
    {
      "tableName" : "name",
      "tableAlias" : "alias",
      "tableLabels" : ["label1", "label2"],
      "tableSchema" : "schemaName",
      "attAliases" : [
        {
          "attName" : "name",
          "attAlias" : "alias1",
          "attLabels" : ["label1", "label2"]
        },
        {
          "attName" : "name",
          "attAlias" : "alias1",
          "attLabels" : ["label1", "label2"]
        }
      ],
      "references" : [
        {"fromAtts" : ["att1", "att2"], "toTable" : "table", "toAtts" : ["att1", "att2"], "joinAlias" : "alias", "joinLabels" : ["label1", "label2"] },
        {"fromAtts" : ["att1", "att2"], "toTable" : "table", "toAtts" : ["att1", "att2"], "joinAlias" : "alias" }
      ]
    },
    {
      "tableName" : "name",
      "tableAlias" : "alias",
      "tableLabels" : ["label1", "label2"],
      "tableSchema" : "schemaName",
      "attAliases" : [
        { "attName" : "name",
          "attAlias" : "alias1",
          "attLabels" : ["label1", "label2"]
        },
        { "attName" : "name",
          "attAlias" : "alias1",
          "attLabels" : ["label1", "label2"]
        }
      ],
      "references" : [
        {"fromAtts" : ["att1", "att2"], "toTable" : "table", "toAtts" : ["att1", "att2"], "joinAlias" : "alias", "joinLabels" : ["label1", "label2"] },
        {"fromAtts" : ["att1", "att2"], "toTable" : "table", "toAtts" : ["att1", "att2"], "joinAlias" : "alias" }
      ]
    }
  ]
}
```

The dictionary specifies, for each table, aliases to be used in the ontology (the aliases can be specified for the table names, attribute names, and foreign kehy relationships). Additionally, one can also specify annotations through the various "labels" properties.

Example of usage with dictionary:
---

Consider the following postgres DB:

```
CREATE TABLE public.a (
    id integer NOT NULL primary key
);


CREATE TABLE public.b (
    id integer NOT NULL primary key
);

ALTER TABLE ONLY public.a
    ADD CONSTRAINT a_1 FOREIGN KEY (id) REFERENCES public.b(id);

insert into b values (1);
insert into b values (2);
insert into a values (1);
```

Suppose we want to bootstrap ontology and mappings for the DB above, however we want to use different names from those used in the DB. We can provide the following *dictionary file*:

```
{
  "dictionary" : [
    {
      "tableName" : "a",
      "tableAlias" : "a_alias",
      "tableLabels" : ["a_lab1", "a_lab2"],
      "tableSchema" : "public",
      "attAliases" : [
        {
          "attName" : "id",
          "attAlias" : "id_alias",
          "attLabels" : ["id_lab1", "id_lab2"]
        }
      ],
      "references" : [
        {"fromAtts" : ["id"], "toTable" : "b", "toAtts" : ["id"], "joinAlias" : "join-alias", "joinLabels" : ["label1", "label2"] }
      ]
    },
    {
      "tableName" : "b",
      "tableAlias" : "b_alias",
      "tableLabels" : ["b_lab1", "b_lab2"],
      "tableSchema" : "public",
      "attAliases" : [
        {
          "attName" : "id",
          "attAlias" : "id_alias",
          "attLabels" : ["id_lab1", "id_lab2"]
        }
      ]
    }
  ]
}
```

To bootstrap the ontology and mappings, we run the following command:

```
./ontop bootstrap -a -p  labels.properties -b 'http://purl.org/labels/' -m labels.obda -t labels.owl -d labels-dictionary.json
```

where the `labels.properties` file contains the connection parameters to our DB, for instance

```
#Tue Sep 29 10:47:21 CEST 2020
jdbc.url=jdbc\:postgresql\://obdalin.inf.unibz.it\:5433/bootstrapper-labels
jdbc.driver=org.postgresql.Driver
jdbc.user=postgres
jdbc.name=c0a82a6a-9901-49bc-b336-d27487f5cdce
jdbc.password=postgres
```

the `labels.obda` and `labels.owl` are two empty files (which at the end of the bootstrapping process will contain our bootstrapped mappings and ontology, respectively), and `labels-dictionary.json` contains the dictionary json file specified above.

The generated ontology and mappings will be as follows:

# Ontology

```
<?xml version="1.0"?>
<rdf:RDF xmlns="http://purl.org/labels/"
     xml:base="http://purl.org/labels/"
     xmlns:owl="http://www.w3.org/2002/07/owl#"
     xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
     xmlns:xml="http://www.w3.org/XML/1998/namespace"
     xmlns:xsd="http://www.w3.org/2001/XMLSchema#"
     xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#">
    <owl:Ontology rdf:about="http://purl.org/labels/"/>
    


    <!-- 
    ///////////////////////////////////////////////////////////////////////////////////////
    //
    // Object Properties
    //
    ///////////////////////////////////////////////////////////////////////////////////////
     -->

    


    <!-- http://purl.org/labels/a_alias#join-alias -->

    <owl:ObjectProperty rdf:about="http://purl.org/labels/a_alias#join-alias">
        <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string">label1</rdfs:label>
        <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string">label2</rdfs:label>
    </owl:ObjectProperty>
    


    <!-- 
    ///////////////////////////////////////////////////////////////////////////////////////
    //
    // Data properties
    //
    ///////////////////////////////////////////////////////////////////////////////////////
     -->

    


    <!-- http://purl.org/labels/a_alias#id_alias -->

    <owl:DatatypeProperty rdf:about="http://purl.org/labels/a_alias#id_alias">
        <rdfs:domain rdf:resource="http://purl.org/labels/a_alias"/>
        <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#integer"/>
        <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string">id_lab1</rdfs:label>
        <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string">id_lab2</rdfs:label>
    </owl:DatatypeProperty>
    


    <!-- http://purl.org/labels/b_alias#id_alias -->

    <owl:DatatypeProperty rdf:about="http://purl.org/labels/b_alias#id_alias">
        <rdfs:domain rdf:resource="http://purl.org/labels/b_alias"/>
        <rdfs:range rdf:resource="http://www.w3.org/2001/XMLSchema#integer"/>
        <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string">id_lab1</rdfs:label>
        <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string">id_lab2</rdfs:label>
    </owl:DatatypeProperty>
    


    <!-- 
    ///////////////////////////////////////////////////////////////////////////////////////
    //
    // Classes
    //
    ///////////////////////////////////////////////////////////////////////////////////////
     -->

    


    <!-- http://purl.org/labels/a_alias -->

    <owl:Class rdf:about="http://purl.org/labels/a_alias">
        <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string">a_lab1</rdfs:label>
        <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string">a_lab2</rdfs:label>
    </owl:Class>
    


    <!-- http://purl.org/labels/b_alias -->

    <owl:Class rdf:about="http://purl.org/labels/b_alias">
        <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string">b_lab1</rdfs:label>
        <rdfs:label rdf:datatype="http://www.w3.org/2001/XMLSchema#string">b_lab2</rdfs:label>
    </owl:Class>
</rdf:RDF>



<!-- Generated by the OWL API (version 4.5.9) https://github.com/owlcs/owlapi -->


```

and the mappings will be

```
[PrefixDeclaration]
obda:		https://w3id.org/obda/vocabulary#
xsd:		http://www.w3.org/2001/XMLSchema#
owl:		http://www.w3.org/2002/07/owl#
rdf:		http://www.w3.org/1999/02/22-rdf-syntax-ns#
rdfs:		http://www.w3.org/2000/01/rdf-schema#

[MappingDeclaration] @collection [[
mappingId	BOOTSTRAPPED-MAPPING-ID1
target		<http://purl.org/labels/a_alias/id_alias={id}> a <http://purl.org/labels/a_alias> ; <http://purl.org/labels/a_alias#id_alias> {id}^^xsd:integer . 
source		SELECT * FROM "a"

mappingId	BOOTSTRAPPED-MAPPING-ID2
target		<http://purl.org/labels/a_alias/id_alias={a_id}> <http://purl.org/labels/a_alias#join-alias> <http://purl.org/labels/b_alias/id_alias={b_id}> . 
source		SELECT "a"."id" AS a_id, "b"."id" AS b_id FROM "a", "b" WHERE "a"."id" = "b"."id"

mappingId	BOOTSTRAPPED-MAPPING-ID3
target		<http://purl.org/labels/b_alias/id_alias={id}> a <http://purl.org/labels/b_alias> ; <http://purl.org/labels/b_alias#id_alias> {id}^^xsd:integer . 
source		SELECT * FROM "b"
]]

```

If we materialize the triples, through *ontop materialize*:

```
./ontop materialize -f turtle -p onto/labels/labels.properties -m onto/labels/labels.obda -t onto/labels/labels.owl -o labels.ttl
```

the result will be the following rdf triples:

```
<http://purl.org/labels/a_alias/id_alias=1> <http://purl.org/labels/a_alias#join-alias> <http://purl.org/labels/b_alias/id_alias=1> .
<http://purl.org/labels/b_alias/id_alias=1> a <http://purl.org/labels/b_alias> .
<http://purl.org/labels/b_alias/id_alias=2> a <http://purl.org/labels/b_alias> .
<http://purl.org/labels/a_alias/id_alias=1> a <http://purl.org/labels/b_alias> .
<http://purl.org/labels/b_alias/id_alias=1> <http://purl.org/labels/b_alias#id_alias> "1"^^<http://www.w3.org/2001/XMLSchema#integer> .
<http://purl.org/labels/b_alias/id_alias=2> <http://purl.org/labels/b_alias#id_alias> "2"^^<http://www.w3.org/2001/XMLSchema#integer> .
<http://purl.org/labels/a_alias/id_alias=1> a <http://purl.org/labels/a_alias> .
<http://purl.org/labels/b_alias> <http://www.w3.org/2000/01/rdf-schema#label> "b_lab2" .
<http://purl.org/labels/a_alias#join-alias> <http://www.w3.org/2000/01/rdf-schema#label> "label1" .
<http://purl.org/labels/a_alias> <http://www.w3.org/2000/01/rdf-schema#label> "a_lab1" .
<http://purl.org/labels/a_alias#join-alias> <http://www.w3.org/2000/01/rdf-schema#label> "label2" .
<http://purl.org/labels/a_alias> <http://www.w3.org/2000/01/rdf-schema#label> "a_lab2" .
<http://purl.org/labels/a_alias#id_alias> <http://www.w3.org/2000/01/rdf-schema#label> "id_lab2","id_lab1" .
<http://purl.org/labels/b_alias#id_alias> <http://www.w3.org/2000/01/rdf-schema#label> "id_lab1" .
<http://purl.org/labels/b_alias> <http://www.w3.org/2000/01/rdf-schema#label> "b_lab1" .
<http://purl.org/labels/b_alias#id_alias> <http://www.w3.org/2000/01/rdf-schema#label> "id_lab2" .
<http://purl.org/labels/a_alias/id_alias=1> <http://purl.org/labels/a_alias#id_alias> "1"^^<http://www.w3.org/2001/XMLSchema#integer> .
```

Advanced Dictionary Options
---

In the dictionary file, one can specify two additional properties:

```
"enableSH" : false
```

Such option, which can be assigned either `true` or `false` value, specifies whether the generation process should also generate *subclasses* according to the SH pattern (for details, see refer to the SH pattern in https://arxiv.org/abs/2012.01917).

The next option is useful in those contexts containing tables without primary keys:

```
"nullValue" : {"string" :  "NULL", "numeric" :  0}
```

and allows the user to specify a default "NULL" value. Such value will be used to construct object identifiers for tables without primary keys which contain `NULLABLE` attributes.

Workload-based Bootstrapping
---

If the DB schema is under-specified, that is, if there are foreign-key constraints that hold in the data but are not explicitly declared in the DB schema, the user can provide a JSON *workload file* so that MPBoot can discover such "hidden" foreign-key dependencies. These dependencies are used by the system to generate additional object properties, and achieve a better structured generated KG. A workload file looks as follows:

```
[
  {"query": "SELECT count(*) FROM players"},
  {"query": "SELECT count(*) FROM matches"},
  {"query": "SELECT first_name ,  birth_date FROM players WHERE country_code  =  'USA'"},
  {"query": "SELECT T1.country_code ,  T1.first_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id  =  T2.winner_id WHERE T2.tourney_name  =  'WTA Championships' INTERSECT SELECT T1.country_code ,  T1.first_name FROM players AS T1 JOIN matches AS T2 ON T1.player_id  =  T2.winner_id WHERE T2.tourney_name  =  'Australian Open'"}
]
```

Assuming such workload file to be named `labels-workload.json`, the bootstrapper can then be invoked as follows:

```
./ontop bootstrap -a -p  labels.properties -b 'http://purl.org/labels/' -m labels.obda -t labels.owl -d labels-dictionary.json -w labels-workload.json
```

where the `-w` parameter specifies our workload file, and the other parameters are the same as the examples above.
