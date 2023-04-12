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