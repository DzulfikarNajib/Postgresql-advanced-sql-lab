-- DCL (Data Control Language)
-- Materi: GRANT dan REVOKE

-- Memberikan hak akses SELECT pada tabel employee ke user1
GRANT SELECT ON employee TO user1@localhost WITH GRANT OPTION;

-- Mencabut hak akses SELECT dari user1
REVOKE SELECT ON employee FROM user1@localhost;

-- Mencabut semua hak akses dari seluruh pengguna (PUBLIC)
REVOKE ALL PRIVILEGES ON employee FROM PUBLIC;
