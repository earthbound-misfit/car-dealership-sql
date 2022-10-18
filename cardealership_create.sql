CREATE TABLE "Customer" (
  "customer_id" SERIAL,
  "first_name" VARCHAR(150),
  "last_name" VARCHAR(150),
  "phone" VARCHAR(15),
  "address" VARCHAR(150),
  "city" VARCHAR(30),
  "zip" VARCHAR(15),
  PRIMARY KEY ("customer_id")
);

CREATE TABLE "Salesperson" (
  "salesperson_id" SERIAL,
  "first_name" VARCHAR(150),
  "last_name" VARCHAR(150),
  PRIMARY KEY ("salesperson_id")
);

CREATE TABLE "Car" (
  "car_id" SERIAL,
  "vin" Integer,
  "make" VARCHAR(150),
  "model" VARCHAR(150),
  "year" Integer,
  "color" VARCHAR(100),
  "for_sale" Boolean,
  PRIMARY KEY ("car_id")
);

CREATE TABLE "Mechanic" (
  "mechanic_id" SERIAL,
  "first_name" VARCHAR(150),
  "last_name" VARCHAR(150),
  PRIMARY KEY ("mechanic_id")
);

CREATE TABLE "Invoice" (
  "invoice_id" SERIAL,
  "invoice_date" Date,
  "Car ID" Integer,
  "Customer ID" Integer,
  "Salesperson ID" Integer,
  PRIMARY KEY ("invoice_id")
);

CREATE TABLE "Ticket" (
  "ticket_id" SERIAL,
  "date_of_request" Date,
  "customer_id" Integer,
  "car_id" Integer,
  "date_returned" Date,
  PRIMARY KEY ("ticket_id"),
  FOREIGN KEY ("car_id")
  REFERENCES "Car"(car_id),
  foreign key ("customer_id")
  references "Customer"(customer_id)
);

CREATE TABLE "Service" (
  "service_id" SERIAL,
  "service_name" VARCHAR(150),
  PRIMARY KEY ("service_id")
);

CREATE TABLE "Parts" (
  "part_id" SERIAL,
  "part_name" VARCHAR(150),
  "cost_per_unit" numeric(10,2),
  "retail_per_unit" numeric(10,2),
  PRIMARY KEY ("part_id")
);

CREATE TABLE "Parts_Used" (
  "part_used_id" SERIAL,
  "part_id" Integer,
  "ticket_id" Integer,
  "retail_per_unit" numeric(10,2),
  "units_used" Integer,
  PRIMARY KEY ("part_used_id"),
  FOREIGN KEY ("part_id") REFERENCES "Parts"(part_id),
  foreign key ("ticket_id") references "Ticket"(ticket_id)
);

CREATE TABLE "Service_Mechanic" (
  "service_mechanic_id" SERIAL,
  "mechanic_id" Integer,
  "service_id" Integer,
  "ticket_id" Integer,
  "labor_hourly" numeric(10,2),
  PRIMARY KEY ("service_mechanic_id"),
  FOREIGN KEY ("mechanic_id") REFERENCES "Mechanic"(mechanic_id),
  FOREIGN KEY ("service_id") REFERENCES "Service"(service_id),
  FOREIGN KEY ("ticket_id") REFERENCES "Ticket"(ticket_id)
);


