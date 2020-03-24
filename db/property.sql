  DROP TABLE IF EXISTS property;

  CREATE TABLE property (
    id SERIAL PRIMARY KEY,
    build VARCHAR(255),
    year_built INT,
    number_of_bedrooms INT,
    value INT
  );
