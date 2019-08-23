CREATE TABLE country (
    id INT PRIMARY KEY AUTO_INCREMENT,
    shortname CHAR(2),
    name VARCHAR(64) NOT NULL
) ENGINE=INNODB;

CREATE TABLE gender (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(32) NOT NULL
) ENGINE=INNODB;

CREATE TABLE user (
    id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(32) NOT NULL,
    username VARCHAR(16) NOT NULL,
    email VARCHAR(32) NOT NULL,
    password BINARY(60) NOT NULL,
    verified BOOLEAN NOT NULL,
    avatar_url VARCHAR(128) NOT NULL,
    birthdate DATE NOT NULL,
    sign_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    country_id int NOT NULL,
    gender_id int NOT NULL,
    FOREIGN KEY (country_id) 
        REFERENCES country(id),
    FOREIGN KEY (gender_id) 
        REFERENCES gender(id)
) ENGINE=INNODB;

CREATE TABLE role (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(32) NOT NULL,
    description VARCHAR(256),
    parent_id INT,
    FOREIGN KEY (parent_id) 
        REFERENCES role(id)
        ON DELETE CASCADE
) ENGINE=INNODB; 

CREATE TABLE user_role (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    role_id INT NOT NULL,
    FOREIGN KEY (user_id) 
        REFERENCES user(id),
    FOREIGN KEY (role_id) 
        REFERENCES role(id)
) ENGINE=INNODB;

CREATE TABLE category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(32) NOT NULL,
    description VARCHAR(256),
    parent_id INT,
    FOREIGN KEY (parent_id) 
        REFERENCES category(id)
        ON DELETE CASCADE
) ENGINE=INNODB;

CREATE TABLE forum (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(32) NOT NULL,
    description VARCHAR(256),
    category_id INT NOT NULL,
    parent_id INT,
    FOREIGN KEY (parent_id) 
        REFERENCES forum(id),
    FOREIGN KEY (category_id) 
        REFERENCES category(id)
        ON DELETE CASCADE
) ENGINE=INNODB;

CREATE TABLE post (
    id INT PRIMARY KEY AUTO_INCREMENT,
    posted_in TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    posted_by INT NOT NULL,
    title VARCHAR(128) NOT NULL,
    content VARCHAR(2048) NOT NULL,
    forum_id INT NOT NULL,
    FOREIGN KEY (posted_by) 
        REFERENCES user(id),
    FOREIGN KEY (forum_id) 
        REFERENCES forum(id)
) ENGINE=INNODB;

INSERT INTO country (shortname, name) VALUES ('AF', 'Afghanistan');
INSERT INTO country (shortname, name) VALUES ('AL', 'Albania');
INSERT INTO country (shortname, name) VALUES ('DZ', 'Algeria');
INSERT INTO country (shortname, name) VALUES ('DS', 'American Samoa');
INSERT INTO country (shortname, name) VALUES ('AD', 'Andorra');
INSERT INTO country (shortname, name) VALUES ('AO', 'Angola');
INSERT INTO country (shortname, name) VALUES ('AI', 'Anguilla');
INSERT INTO country (shortname, name) VALUES ('AQ', 'Antarctica');
INSERT INTO country (shortname, name) VALUES ('AG', 'Antigua and Barbuda');
INSERT INTO country (shortname, name) VALUES ('AR', 'Argentina');
INSERT INTO country (shortname, name) VALUES ('AM', 'Armenia');
INSERT INTO country (shortname, name) VALUES ('AW', 'Aruba');
INSERT INTO country (shortname, name) VALUES ('AU', 'Australia');
INSERT INTO country (shortname, name) VALUES ('AT', 'Austria');
INSERT INTO country (shortname, name) VALUES ('AZ', 'Azerbaijan');
INSERT INTO country (shortname, name) VALUES ('BS', 'Bahamas');
INSERT INTO country (shortname, name) VALUES ('BH', 'Bahrain');
INSERT INTO country (shortname, name) VALUES ('BD', 'Bangladesh');
INSERT INTO country (shortname, name) VALUES ('BB', 'Barbados');
INSERT INTO country (shortname, name) VALUES ('BY', 'Belarus');
INSERT INTO country (shortname, name) VALUES ('BE', 'Belgium');
INSERT INTO country (shortname, name) VALUES ('BZ', 'Belize');
INSERT INTO country (shortname, name) VALUES ('BJ', 'Benin');
INSERT INTO country (shortname, name) VALUES ('BM', 'Bermuda');
INSERT INTO country (shortname, name) VALUES ('BT', 'Bhutan');
INSERT INTO country (shortname, name) VALUES ('BO', 'Bolivia');
INSERT INTO country (shortname, name) VALUES ('BA', 'Bosnia and Herzegovina');
INSERT INTO country (shortname, name) VALUES ('BW', 'Botswana');
INSERT INTO country (shortname, name) VALUES ('BV', 'Bouvet Island');
INSERT INTO country (shortname, name) VALUES ('BR', 'Brazil');
INSERT INTO country (shortname, name) VALUES ('IO', 'British Indian Ocean Territory');
INSERT INTO country (shortname, name) VALUES ('BN', 'Brunei Darussalam');
INSERT INTO country (shortname, name) VALUES ('BG', 'Bulgaria');
INSERT INTO country (shortname, name) VALUES ('BF', 'Burkina Faso');
INSERT INTO country (shortname, name) VALUES ('BI', 'Burundi');
INSERT INTO country (shortname, name) VALUES ('KH', 'Cambodia');
INSERT INTO country (shortname, name) VALUES ('CM', 'Cameroon');
INSERT INTO country (shortname, name) VALUES ('CA', 'Canada');
INSERT INTO country (shortname, name) VALUES ('CV', 'Cape Verde');
INSERT INTO country (shortname, name) VALUES ('KY', 'Cayman Islands');
INSERT INTO country (shortname, name) VALUES ('CF', 'Central African Republic');
INSERT INTO country (shortname, name) VALUES ('TD', 'Chad');
INSERT INTO country (shortname, name) VALUES ('CL', 'Chile');
INSERT INTO country (shortname, name) VALUES ('CN', 'China');
INSERT INTO country (shortname, name) VALUES ('CX', 'Christmas Island');
INSERT INTO country (shortname, name) VALUES ('CC', 'Cocos (Keeling) Islands');
INSERT INTO country (shortname, name) VALUES ('CO', 'Colombia');
INSERT INTO country (shortname, name) VALUES ('KM', 'Comoros');
INSERT INTO country (shortname, name) VALUES ('CD', 'Democratic Republic of the Congo');
INSERT INTO country (shortname, name) VALUES ('CG', 'Republic of Congo');
INSERT INTO country (shortname, name) VALUES ('CK', 'Cook Islands');
INSERT INTO country (shortname, name) VALUES ('CR', 'Costa Rica');
INSERT INTO country (shortname, name) VALUES ('HR', 'Croatia (Hrvatska)');
INSERT INTO country (shortname, name) VALUES ('CU', 'Cuba');
INSERT INTO country (shortname, name) VALUES ('CY', 'Cyprus');
INSERT INTO country (shortname, name) VALUES ('CZ', 'Czech Republic');
INSERT INTO country (shortname, name) VALUES ('DK', 'Denmark');
INSERT INTO country (shortname, name) VALUES ('DJ', 'Djibouti');
INSERT INTO country (shortname, name) VALUES ('DM', 'Dominica');
INSERT INTO country (shortname, name) VALUES ('DO', 'Dominican Republic');
INSERT INTO country (shortname, name) VALUES ('TP', 'East Timor');
INSERT INTO country (shortname, name) VALUES ('EC', 'Ecuador');
INSERT INTO country (shortname, name) VALUES ('EG', 'Egypt');
INSERT INTO country (shortname, name) VALUES ('SV', 'El Salvador');
INSERT INTO country (shortname, name) VALUES ('GQ', 'Equatorial Guinea');
INSERT INTO country (shortname, name) VALUES ('ER', 'Eritrea');
INSERT INTO country (shortname, name) VALUES ('EE', 'Estonia');
INSERT INTO country (shortname, name) VALUES ('ET', 'Ethiopia');
INSERT INTO country (shortname, name) VALUES ('FK', 'Falkland Islands (Malvinas)');
INSERT INTO country (shortname, name) VALUES ('FO', 'Faroe Islands');
INSERT INTO country (shortname, name) VALUES ('FJ', 'Fiji');
INSERT INTO country (shortname, name) VALUES ('FI', 'Finland');
INSERT INTO country (shortname, name) VALUES ('FR', 'France');
INSERT INTO country (shortname, name) VALUES ('FX', 'France, Metropolitan');
INSERT INTO country (shortname, name) VALUES ('GF', 'French Guiana');
INSERT INTO country (shortname, name) VALUES ('PF', 'French Polynesia');
INSERT INTO country (shortname, name) VALUES ('TF', 'French Southern Territories');
INSERT INTO country (shortname, name) VALUES ('GA', 'Gabon');
INSERT INTO country (shortname, name) VALUES ('GM', 'Gambia');
INSERT INTO country (shortname, name) VALUES ('GE', 'Georgia');
INSERT INTO country (shortname, name) VALUES ('DE', 'Germany');
INSERT INTO country (shortname, name) VALUES ('GH', 'Ghana');
INSERT INTO country (shortname, name) VALUES ('GI', 'Gibraltar');
INSERT INTO country (shortname, name) VALUES ('GK', 'Guernsey');
INSERT INTO country (shortname, name) VALUES ('GR', 'Greece');
INSERT INTO country (shortname, name) VALUES ('GL', 'Greenland');
INSERT INTO country (shortname, name) VALUES ('GD', 'Grenada');
INSERT INTO country (shortname, name) VALUES ('GP', 'Guadeloupe');
INSERT INTO country (shortname, name) VALUES ('GU', 'Guam');
INSERT INTO country (shortname, name) VALUES ('GT', 'Guatemala');
INSERT INTO country (shortname, name) VALUES ('GN', 'Guinea');
INSERT INTO country (shortname, name) VALUES ('GW', 'Guinea-Bissau');
INSERT INTO country (shortname, name) VALUES ('GY', 'Guyana');
INSERT INTO country (shortname, name) VALUES ('HT', 'Haiti');
INSERT INTO country (shortname, name) VALUES ('HM', 'Heard and Mc Donald Islands');
INSERT INTO country (shortname, name) VALUES ('HN', 'Honduras');
INSERT INTO country (shortname, name) VALUES ('HK', 'Hong Kong');
INSERT INTO country (shortname, name) VALUES ('HU', 'Hungary');
INSERT INTO country (shortname, name) VALUES ('IS', 'Iceland');
INSERT INTO country (shortname, name) VALUES ('IN', 'India');
INSERT INTO country (shortname, name) VALUES ('IM', 'Isle of Man');
INSERT INTO country (shortname, name) VALUES ('ID', 'Indonesia');
INSERT INTO country (shortname, name) VALUES ('IR', 'Iran (Islamic Republic of)');
INSERT INTO country (shortname, name) VALUES ('IQ', 'Iraq');
INSERT INTO country (shortname, name) VALUES ('IE', 'Ireland');
INSERT INTO country (shortname, name) VALUES ('IL', 'Israel');
INSERT INTO country (shortname, name) VALUES ('IT', 'Italy');
INSERT INTO country (shortname, name) VALUES ('CI', 'Ivory Coast');
INSERT INTO country (shortname, name) VALUES ('JE', 'Jersey');
INSERT INTO country (shortname, name) VALUES ('JM', 'Jamaica');
INSERT INTO country (shortname, name) VALUES ('JP', 'Japan');
INSERT INTO country (shortname, name) VALUES ('JO', 'Jordan');
INSERT INTO country (shortname, name) VALUES ('KZ', 'Kazakhstan');
INSERT INTO country (shortname, name) VALUES ('KE', 'Kenya');
INSERT INTO country (shortname, name) VALUES ('KI', 'Kiribati');
INSERT INTO country (shortname, name) VALUES ('KP', 'Korea, Democratic People''s Republic of');
INSERT INTO country (shortname, name) VALUES ('KR', 'Korea, Republic of');
INSERT INTO country (shortname, name) VALUES ('XK', 'Kosovo');
INSERT INTO country (shortname, name) VALUES ('KW', 'Kuwait');
INSERT INTO country (shortname, name) VALUES ('KG', 'Kyrgyzstan');
INSERT INTO country (shortname, name) VALUES ('LA', 'Lao People''s Democratic Republic');
INSERT INTO country (shortname, name) VALUES ('LV', 'Latvia');
INSERT INTO country (shortname, name) VALUES ('LB', 'Lebanon');
INSERT INTO country (shortname, name) VALUES ('LS', 'Lesotho');
INSERT INTO country (shortname, name) VALUES ('LR', 'Liberia');
INSERT INTO country (shortname, name) VALUES ('LY', 'Libyan Arab Jamahiriya');
INSERT INTO country (shortname, name) VALUES ('LI', 'Liechtenstein');
INSERT INTO country (shortname, name) VALUES ('LT', 'Lithuania');
INSERT INTO country (shortname, name) VALUES ('LU', 'Luxembourg');
INSERT INTO country (shortname, name) VALUES ('MO', 'Macau');
INSERT INTO country (shortname, name) VALUES ('MK', 'North Macedonia');
INSERT INTO country (shortname, name) VALUES ('MG', 'Madagascar');
INSERT INTO country (shortname, name) VALUES ('MW', 'Malawi');
INSERT INTO country (shortname, name) VALUES ('MY', 'Malaysia');
INSERT INTO country (shortname, name) VALUES ('MV', 'Maldives');
INSERT INTO country (shortname, name) VALUES ('ML', 'Mali');
INSERT INTO country (shortname, name) VALUES ('MT', 'Malta');
INSERT INTO country (shortname, name) VALUES ('MH', 'Marshall Islands');
INSERT INTO country (shortname, name) VALUES ('MQ', 'Martinique');
INSERT INTO country (shortname, name) VALUES ('MR', 'Mauritania');
INSERT INTO country (shortname, name) VALUES ('MU', 'Mauritius');
INSERT INTO country (shortname, name) VALUES ('TY', 'Mayotte');
INSERT INTO country (shortname, name) VALUES ('MX', 'Mexico');
INSERT INTO country (shortname, name) VALUES ('FM', 'Micronesia, Federated States of');
INSERT INTO country (shortname, name) VALUES ('MD', 'Moldova, Republic of');
INSERT INTO country (shortname, name) VALUES ('MC', 'Monaco');
INSERT INTO country (shortname, name) VALUES ('MN', 'Mongolia');
INSERT INTO country (shortname, name) VALUES ('ME', 'Montenegro');
INSERT INTO country (shortname, name) VALUES ('MS', 'Montserrat');
INSERT INTO country (shortname, name) VALUES ('MA', 'Morocco');
INSERT INTO country (shortname, name) VALUES ('MZ', 'Mozambique');
INSERT INTO country (shortname, name) VALUES ('MM', 'Myanmar');
INSERT INTO country (shortname, name) VALUES ('NA', 'Namibia');
INSERT INTO country (shortname, name) VALUES ('NR', 'Nauru');
INSERT INTO country (shortname, name) VALUES ('NP', 'Nepal');
INSERT INTO country (shortname, name) VALUES ('NL', 'Netherlands');
INSERT INTO country (shortname, name) VALUES ('AN', 'Netherlands Antilles');
INSERT INTO country (shortname, name) VALUES ('NC', 'New Caledonia');
INSERT INTO country (shortname, name) VALUES ('NZ', 'New Zealand');
INSERT INTO country (shortname, name) VALUES ('NI', 'Nicaragua');
INSERT INTO country (shortname, name) VALUES ('NE', 'Niger');
INSERT INTO country (shortname, name) VALUES ('NG', 'Nigeria');
INSERT INTO country (shortname, name) VALUES ('NU', 'Niue');
INSERT INTO country (shortname, name) VALUES ('NF', 'Norfolk Island');
INSERT INTO country (shortname, name) VALUES ('MP', 'Northern Mariana Islands');
INSERT INTO country (shortname, name) VALUES ('NO', 'Norway');
INSERT INTO country (shortname, name) VALUES ('OM', 'Oman');
INSERT INTO country (shortname, name) VALUES ('PK', 'Pakistan');
INSERT INTO country (shortname, name) VALUES ('PW', 'Palau');
INSERT INTO country (shortname, name) VALUES ('PS', 'Palestine');
INSERT INTO country (shortname, name) VALUES ('PA', 'Panama');
INSERT INTO country (shortname, name) VALUES ('PG', 'Papua New Guinea');
INSERT INTO country (shortname, name) VALUES ('PY', 'Paraguay');
INSERT INTO country (shortname, name) VALUES ('PE', 'Peru');
INSERT INTO country (shortname, name) VALUES ('PH', 'Philippines');
INSERT INTO country (shortname, name) VALUES ('PN', 'Pitcairn');
INSERT INTO country (shortname, name) VALUES ('PL', 'Poland');
INSERT INTO country (shortname, name) VALUES ('PT', 'Portugal');
INSERT INTO country (shortname, name) VALUES ('PR', 'Puerto Rico');
INSERT INTO country (shortname, name) VALUES ('QA', 'Qatar');
INSERT INTO country (shortname, name) VALUES ('RE', 'Reunion');
INSERT INTO country (shortname, name) VALUES ('RO', 'Romania');
INSERT INTO country (shortname, name) VALUES ('RU', 'Russian Federation');
INSERT INTO country (shortname, name) VALUES ('RW', 'Rwanda');
INSERT INTO country (shortname, name) VALUES ('KN', 'Saint Kitts and Nevis');
INSERT INTO country (shortname, name) VALUES ('LC', 'Saint Lucia');
INSERT INTO country (shortname, name) VALUES ('VC', 'Saint Vincent and the Grenadines');
INSERT INTO country (shortname, name) VALUES ('WS', 'Samoa');
INSERT INTO country (shortname, name) VALUES ('SM', 'San Marino');
INSERT INTO country (shortname, name) VALUES ('ST', 'Sao Tome and Principe');
INSERT INTO country (shortname, name) VALUES ('SA', 'Saudi Arabia');
INSERT INTO country (shortname, name) VALUES ('SN', 'Senegal');
INSERT INTO country (shortname, name) VALUES ('RS', 'Serbia');
INSERT INTO country (shortname, name) VALUES ('SC', 'Seychelles');
INSERT INTO country (shortname, name) VALUES ('SL', 'Sierra Leone');
INSERT INTO country (shortname, name) VALUES ('SG', 'Singapore');
INSERT INTO country (shortname, name) VALUES ('SK', 'Slovakia');
INSERT INTO country (shortname, name) VALUES ('SI', 'Slovenia');
INSERT INTO country (shortname, name) VALUES ('SB', 'Solomon Islands');
INSERT INTO country (shortname, name) VALUES ('SO', 'Somalia');
INSERT INTO country (shortname, name) VALUES ('ZA', 'South Africa');
INSERT INTO country (shortname, name) VALUES ('GS', 'South Georgia South Sandwich Islands');
INSERT INTO country (shortname, name) VALUES ('SS', 'South Sudan');
INSERT INTO country (shortname, name) VALUES ('ES', 'Spain');
INSERT INTO country (shortname, name) VALUES ('LK', 'Sri Lanka');
INSERT INTO country (shortname, name) VALUES ('SH', 'St. Helena');
INSERT INTO country (shortname, name) VALUES ('PM', 'St. Pierre and Miquelon');
INSERT INTO country (shortname, name) VALUES ('SD', 'Sudan');
INSERT INTO country (shortname, name) VALUES ('SR', 'Suriname');
INSERT INTO country (shortname, name) VALUES ('SJ', 'Svalbard and Jan Mayen Islands');
INSERT INTO country (shortname, name) VALUES ('SZ', 'Swaziland');
INSERT INTO country (shortname, name) VALUES ('SE', 'Sweden');
INSERT INTO country (shortname, name) VALUES ('CH', 'Switzerland');
INSERT INTO country (shortname, name) VALUES ('SY', 'Syrian Arab Republic');
INSERT INTO country (shortname, name) VALUES ('TW', 'Taiwan');
INSERT INTO country (shortname, name) VALUES ('TJ', 'Tajikistan');
INSERT INTO country (shortname, name) VALUES ('TZ', 'Tanzania, United Republic of');
INSERT INTO country (shortname, name) VALUES ('TH', 'Thailand');
INSERT INTO country (shortname, name) VALUES ('TG', 'Togo');
INSERT INTO country (shortname, name) VALUES ('TK', 'Tokelau');
INSERT INTO country (shortname, name) VALUES ('TO', 'Tonga');
INSERT INTO country (shortname, name) VALUES ('TT', 'Trinidad and Tobago');
INSERT INTO country (shortname, name) VALUES ('TN', 'Tunisia');
INSERT INTO country (shortname, name) VALUES ('TR', 'Turkey');
INSERT INTO country (shortname, name) VALUES ('TM', 'Turkmenistan');
INSERT INTO country (shortname, name) VALUES ('TC', 'Turks and Caicos Islands');
INSERT INTO country (shortname, name) VALUES ('TV', 'Tuvalu');
INSERT INTO country (shortname, name) VALUES ('UG', 'Uganda');
INSERT INTO country (shortname, name) VALUES ('UA', 'Ukraine');
INSERT INTO country (shortname, name) VALUES ('AE', 'United Arab Emirates');
INSERT INTO country (shortname, name) VALUES ('GB', 'United Kingdom');
INSERT INTO country (shortname, name) VALUES ('US', 'United States');
INSERT INTO country (shortname, name) VALUES ('UM', 'United States minor outlying islands');
INSERT INTO country (shortname, name) VALUES ('UY', 'Uruguay');
INSERT INTO country (shortname, name) VALUES ('UZ', 'Uzbekistan');
INSERT INTO country (shortname, name) VALUES ('VU', 'Vanuatu');
INSERT INTO country (shortname, name) VALUES ('VA', 'Vatican City State');
INSERT INTO country (shortname, name) VALUES ('VE', 'Venezuela');
INSERT INTO country (shortname, name) VALUES ('VN', 'Vietnam');
INSERT INTO country (shortname, name) VALUES ('VG', 'Virgin Islands (British)');
INSERT INTO country (shortname, name) VALUES ('VI', 'Virgin Islands (U.S.)');
INSERT INTO country (shortname, name) VALUES ('WF', 'Wallis and Futuna Islands');
INSERT INTO country (shortname, name) VALUES ('EH', 'Western Sahara');
INSERT INTO country (shortname, name) VALUES ('YE', 'Yemen');
INSERT INTO country (shortname, name) VALUES ('ZM', 'Zambia');
INSERT INTO country (shortname, name) VALUES ('ZW', 'Zimbabwe');