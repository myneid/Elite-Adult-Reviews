--next time i will put this in a migration. c'est la vie
alter table `sites` add overall INT(4) NULL;
alter table sites add index (overall);
