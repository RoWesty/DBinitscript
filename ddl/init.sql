CREATE TABLE IF NOT EXISTS public.readers(
    id_read serial PRIMARY KEY,
    ФИО varchar(50) not null,
    Телефон bigint,
    Адрес varchar(255)
);

CREATE TABLE IF NOT EXISTS public.staff(
    id_sotrudniki serial PRIMARY KEY,
    ФИО varchar(50) not null,
    Телефон bigint,
    Адрес varchar(255),
    Должность varchar(75)
);

CREATE TABLE IF NOT EXISTS public.operation(
    id_operations serial PRIMARY KEY,
    Дата_выдачи date,
    Дата_возврата date
);

CREATE TABLE IF NOT EXISTS public.house(
    id_house serial PRIMARY KEY,
    Название varchar(255),
    Адрес varchar(255),
    Дата_основания date,
    Индекс bigint
);

CREATE TABLE IF NOT EXISTS public.authors(
    id_author serial PRIMARY KEY,
    ФИО varchar(50) not null,
    Роль varchar(150)
);

CREATE TABLE IF NOT EXISTS public.book(
    id_books serial PRIMARY KEY,
    Название_книги varchar(150),
    Год_издания date,
    Цена money,
    Количество_экземпляров_в_фонде int,
    Количество_страниц int,
    id_house int,
    FOREIGN KEY (id_house) REFERENCES house (id_house) ON DELETE SET NULL
);


CREATE TABLE IF NOT EXISTS public.connectionbooksauthors(
    id_connection serial PRIMARY KEY,
    id_books int,
    id_author int,
    FOREIGN KEY (id_books) REFERENCES book (id_books) ON DELETE CASCADE,
    FOREIGN KEY (id_author) REFERENCES authors (id_author) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS public.formul(
    id_formuls serial PRIMARY KEY,
    id_read int,
    id_operations int,
    id_sotrudniki int,
    id_books int,
    FOREIGN KEY (id_read) REFERENCES readers (id_read) ON DELETE SET NULL,
    FOREIGN KEY (id_operations) REFERENCES operation (id_operations) ON DELETE SET NULL,
    FOREIGN KEY (id_sotrudniki) REFERENCES staff (id_sotrudniki) ON DELETE SET NULL,
    FOREIGN KEY (id_books) REFERENCES book (id_books) ON DELETE SET NULL
);



