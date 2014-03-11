INSERT INTO version (table_name, table_version) values ('location','6');
CREATE TABLE location (
    id INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    ruid VARCHAR(64) DEFAULT '' NOT NULL,
    username VARCHAR(64) DEFAULT '' NOT NULL,
    domain VARCHAR(64) DEFAULT NULL,
    contact VARCHAR(255) DEFAULT '' NOT NULL,
    received VARCHAR(128) DEFAULT NULL,
    path VARCHAR(512) DEFAULT NULL,
    expires DATETIME DEFAULT '2030-05-28 21:32:15' NOT NULL,
    q FLOAT(10,2) DEFAULT 1.0 NOT NULL,
    callid VARCHAR(255) DEFAULT 'Default-Call-ID' NOT NULL,
    cseq INT(11) DEFAULT 1 NOT NULL,
    last_modified DATETIME DEFAULT '1900-01-01 00:00:01' NOT NULL,
    flags INT(11) DEFAULT 0 NOT NULL,
    cflags INT(11) DEFAULT 0 NOT NULL,
    user_agent VARCHAR(255) DEFAULT '' NOT NULL,
    socket VARCHAR(64) DEFAULT NULL,
    methods INT(11) DEFAULT NULL,
    instance VARCHAR(255) DEFAULT NULL,
    reg_id INT(11) DEFAULT 0 NOT NULL,
    CONSTRAINT ruid_idx UNIQUE (ruid)
) ENGINE=MyISAM;

CREATE INDEX account_contact_idx ON location (username, domain, contact);
CREATE INDEX expires_idx ON location (expires);

INSERT INTO version (table_name, table_version) values ('location_attrs','1');
CREATE TABLE location_attrs (
    id INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    ruid VARCHAR(64) DEFAULT '' NOT NULL,
    username VARCHAR(64) DEFAULT '' NOT NULL,
    domain VARCHAR(64) DEFAULT NULL,
    aname VARCHAR(64) DEFAULT '' NOT NULL,
    atype INT(11) DEFAULT 0 NOT NULL,
    avalue VARCHAR(255) DEFAULT '' NOT NULL,
    last_modified DATETIME DEFAULT '1900-01-01 00:00:01' NOT NULL
) ENGINE=MyISAM;

CREATE INDEX account_record_idx ON location_attrs (username, domain, ruid);
CREATE INDEX last_modified_idx ON location_attrs (last_modified);

