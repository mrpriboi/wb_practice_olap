CREATE USER admin IDENTIFIED WITH sha256_password BY 'admin';
GRANT CURRENT GRANTS ON *.* TO admin WITH GRANT OPTION;
