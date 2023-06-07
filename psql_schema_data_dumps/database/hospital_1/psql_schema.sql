-- https://en.wikibooks.org/wiki/sql_exercises/the_hospital
    
    create table if not exists physician (
      employeeid integer not null,
      name varchar(30) not null,
      position varchar(30) not null,
      ssn integer not null,
      constraint pk_physician primary key(employeeid)
    ); 
    
    create table if not exists department (
      departmentid integer not null,
      name varchar(30) not null,
      head integer not null,
      constraint pk_department primary key(departmentid),
      constraint fk_department_physician_employeeid foreign key(head) references physician(employeeid)
    );
    
    
    create table if not exists affiliated_with (
      physician integer not null,
      department integer not null,
      primaryaffiliation boolean not null,
      constraint fk_affiliated_with_physician_employeeid foreign key(physician) references physician(employeeid),
      constraint fk_affiliated_with_department_departmentid foreign key(department) references department(departmentid),
      primary key(physician, department)
    );
    
    create table if not exists procedures (
      code integer primary key not null,
      name varchar(30) not null,
      cost real not null
    );
    
    create table if not exists trained_in (
      physician integer not null,
      treatment integer not null,
      certificationdate timestamp not null,
      certificationexpires timestamp not null,
      constraint fk_trained_in_physician_employeeid foreign key(physician) references physician(employeeid),
      constraint fk_trained_in_procedures_code foreign key(treatment) references procedures(code),
      primary key(physician, treatment)
    );
    
    create table if not exists patient (
      ssn integer primary key not null,
      name varchar(30) not null,
      address varchar(30) not null,
      phone varchar(30) not null,
      insuranceid integer not null,
      pcp integer not null,
      constraint fk_patient_physician_employeeid foreign key(pcp) references physician(employeeid)
    );
    
    create table if not exists nurse (
      employeeid integer primary key not null,
      name varchar(30) not null,
      position varchar(30) not null,
      registered boolean not null,
      ssn integer not null
    );
       create table if not exists appointment (
      appointmentid integer primary key not null,
      patient integer not null,    
      prepnurse integer,
      physician integer not null,
      start timestamp not null,
      "end" timestamp not null,
      examinationroom text not null,
      constraint fk_appointment_patient_ssn foreign key(patient) references patient(ssn),
      constraint fk_appointment_nurse_employeeid foreign key(prepnurse) references nurse(employeeid),
      constraint fk_appointment_physician_employeeid foreign key(physician) references physician(employeeid)
    );
    
    create table if not exists medication (
      code integer primary key not null,
      name varchar(30) not null,
      brand varchar(30) not null,
      description varchar(30) not null
    );
    
    
    create table if not exists prescribes (
      physician integer not null,
      patient integer not null, 
      medication integer not null, 
      date timestamp not null,
      appointment integer,  
      dose varchar(30) not null,
      primary key(physician, patient, medication, date),
      constraint fk_prescribes_physician_employeeid foreign key(physician) references physician(employeeid),
      constraint fk_prescribes_patient_ssn foreign key(patient) references patient(ssn),
      constraint fk_prescribes_medication_code foreign key(medication) references medication(code),
      constraint fk_prescribes_appointment_appointmentid foreign key(appointment) references appointment(appointmentid)
    );
    
    create table if not exists block (
      blockfloor integer not null,
      blockcode integer not null,
      primary key(blockfloor, blockcode)
    ); 
    
    create table if not exists room (
      roomnumber integer primary key not null,
      roomtype varchar(30) not null,
      blockfloor integer not null,  
      blockcode integer not null,  
      unavailable boolean not null,
      constraint fk_room_block_pk foreign key(blockfloor, blockcode) references block(blockfloor, blockcode)
    );
    
    create table if not exists on_call (
      nurse integer not null,
      blockfloor integer not null, 
      blockcode integer not null,
      oncallstart timestamp not null,
      oncallend timestamp not null,
      primary key(nurse, blockfloor, blockcode, oncallstart, oncallend),
      constraint fk_oncall_nurse_employeeid foreign key(nurse) references nurse(employeeid),
      constraint fk_oncall_block_floor foreign key(blockfloor, blockcode) references block(blockfloor, blockcode) 
    );
    
    create table if not exists stay (
      stayid integer primary key not null,
      patient integer not null,
      room integer not null,
      staystart timestamp not null,
      stayend timestamp not null,
      constraint fk_stay_patient_ssn foreign key(patient) references patient(ssn),
      constraint fk_stay_room_number foreign key(room) references room(roomnumber)
    );
    
    create table if not exists undergoes (
      patient integer not null,
      procedures integer not null,
      stay integer not null,
      dateundergoes timestamp not null,
      physician integer not null,
      assistingnurse integer,
      primary key(patient, procedures, stay, dateundergoes),
      constraint fk_undergoes_patient_ssn foreign key(patient) references patient(ssn),
      constraint fk_undergoes_procedures_code foreign key(procedures) references procedures(code),
      constraint fk_undergoes_stay_stayid foreign key(stay) references stay(stayid),
      constraint fk_undergoes_physician_employeeid foreign key(physician) references physician(employeeid),
      constraint fk_undergoes_nurse_employeeid foreign key(assistingnurse) references nurse(employeeid)
    );
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
