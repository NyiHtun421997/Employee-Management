CREATE TABLE exercise.USER (
    USR_ID SERIAL PRIMARY KEY,
    USR_FULL_NAME VARCHAR(60) NOT NULL,
    USR_GANA VARCHAR(60) NOT NULL,
    USR_EMAIL VARCHAR(100) NOT NULL UNIQUE,
    USR_PSWD VARCHAR(100) NOT NULL,
	USR_AGE INTEGER NOT NULL CHECK(USR_AGE >= 0 AND USR_AGE <=200),
    USR_PHONE VARCHAR(15),
    USR_UPDATE_DATE DATE
);

CREATE TABLE exercise.ORDER (
    ORDER_ID SERIAL PRIMARY KEY,
    ORDER_DATE DATE,
    USR_ID INTEGER,
    ORDER_PRICE_TAX NUMERIC(9,2),
    ORDER_PRICE_NO_TAX NUMERIC(9,2),
    ORDER_DEL_FLG BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (USR_ID) REFERENCES exercise.USER(USR_ID),
    CONSTRAINT ORDER_NUMBER UNIQUE (USR_ID, ORDER_DATE)
);