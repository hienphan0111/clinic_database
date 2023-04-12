/* Create schema table */

-- Create patients table --

create table patients
(
    id int generated always as IDENTITY,
    name varchar(100) not NULL,
    date_of_birth date,
    primary key (id)
);

-- Create medical_histories table --

create table medical_histories
(
    id int generated always as IDENTITY,
    admitted_at TIMESTAMP,
    patient_id INT, 
    status varchar(100),
    constraint fk_patient_id
        foreign key (patient_id)
        references patients(id)
        on delete cascade,
    primary key (id)
);

-- Create invoices table --

create table invoices
(
    id int generated always as identity,
    total_amount decimal,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id INT,
    constraint fk_medical_history
        foreign key (medical_history_id)
        references medical_histories(id)
        on delete cascade,
    primary key (id)
);

create table treatments (
    id int generated always as identity, 
    type varchar(100),
    name varchar(100),
    primary key (id)
);

create table invoice_items
(
    id int generated always as IDENTITY,
    unit_price decimal, 
    quantity int, 
    total_price decimal, 
    invoice_id int, 
    treatment_id int,
    constraint fk_treatment
        foreign key (treatment_id)
        references treatments(id)
        on delete cascade,
    constraint fk_invoice
        foreign key (invoice_id)
        references invoices(id)
        on delete cascade
);

create table medical_histories_treatments (
    medical_id int,
    treatment_id int, 
    constraint fk_medical_id
        foreign key (medical_id)
        references medical_histories(id)
        on delete cascade,
    constraint fk_treatment_id
        foreign key (treatment_id)
        references treatments(id)
        on delete cascade
);

-- create indexes -- 
create index idx_patient_id on medical_histories (patient_id);

create index idx_medical_history_id on invoices (medical_history_id);

create index idx_treatment_id on invoice_items (treatment_id);

create index idx_invoice_id on invoice_items (invoice_id);