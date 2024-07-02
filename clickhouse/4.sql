CREATE ROLE readonly;
GRANT SELECT ON *.* TO readonly;

CREATE USER ivanov_r IDENTIFIED WITH sha256_password BY 'ivanov' DEFAULT ROLE readonly;


CREATE ROLE readwrite_stg;
GRANT CREATE, INSERT ON stg.* TO readwrite_stg;


CREATE USER ivanov_rw_stg IDENTIFIED WITH sha256_password BY 'ivanov' DEFAULT ROLE readwrite_stg;
