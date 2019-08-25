CREATE TABLE countries (
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
    countries_id int NOT NULL,
    gender_id int NOT NULL,
    FOREIGN KEY (countries_id) 
        REFERENCES countries(id),
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

INSERT INTO countries (shortname, name) VALUES ('AF', 'Afghanistan');
INSERT INTO countries (shortname, name) VALUES ('AL', 'Albania');
INSERT INTO countries (shortname, name) VALUES ('DZ', 'Algeria');
INSERT INTO countries (shortname, name) VALUES ('DS', 'American Samoa');
INSERT INTO countries (shortname, name) VALUES ('AD', 'Andorra');
INSERT INTO countries (shortname, name) VALUES ('AO', 'Angola');
INSERT INTO countries (shortname, name) VALUES ('AI', 'Anguilla');
INSERT INTO countries (shortname, name) VALUES ('AQ', 'Antarctica');
INSERT INTO countries (shortname, name) VALUES ('AG', 'Antigua and Barbuda');
INSERT INTO countries (shortname, name) VALUES ('AR', 'Argentina');
INSERT INTO countries (shortname, name) VALUES ('AM', 'Armenia');
INSERT INTO countries (shortname, name) VALUES ('AW', 'Aruba');
INSERT INTO countries (shortname, name) VALUES ('AU', 'Australia');
INSERT INTO countries (shortname, name) VALUES ('AT', 'Austria');
INSERT INTO countries (shortname, name) VALUES ('AZ', 'Azerbaijan');
INSERT INTO countries (shortname, name) VALUES ('BS', 'Bahamas');
INSERT INTO countries (shortname, name) VALUES ('BH', 'Bahrain');
INSERT INTO countries (shortname, name) VALUES ('BD', 'Bangladesh');
INSERT INTO countries (shortname, name) VALUES ('BB', 'Barbados');
INSERT INTO countries (shortname, name) VALUES ('BY', 'Belarus');
INSERT INTO countries (shortname, name) VALUES ('BE', 'Belgium');
INSERT INTO countries (shortname, name) VALUES ('BZ', 'Belize');
INSERT INTO countries (shortname, name) VALUES ('BJ', 'Benin');
INSERT INTO countries (shortname, name) VALUES ('BM', 'Bermuda');
INSERT INTO countries (shortname, name) VALUES ('BT', 'Bhutan');
INSERT INTO countries (shortname, name) VALUES ('BO', 'Bolivia');
INSERT INTO countries (shortname, name) VALUES ('BA', 'Bosnia and Herzegovina');
INSERT INTO countries (shortname, name) VALUES ('BW', 'Botswana');
INSERT INTO countries (shortname, name) VALUES ('BV', 'Bouvet Island');
INSERT INTO countries (shortname, name) VALUES ('BR', 'Brazil');
INSERT INTO countries (shortname, name) VALUES ('IO', 'British Indian Ocean Territory');
INSERT INTO countries (shortname, name) VALUES ('BN', 'Brunei Darussalam');
INSERT INTO countries (shortname, name) VALUES ('BG', 'Bulgaria');
INSERT INTO countries (shortname, name) VALUES ('BF', 'Burkina Faso');
INSERT INTO countries (shortname, name) VALUES ('BI', 'Burundi');
INSERT INTO countries (shortname, name) VALUES ('KH', 'Cambodia');
INSERT INTO countries (shortname, name) VALUES ('CM', 'Cameroon');
INSERT INTO countries (shortname, name) VALUES ('CA', 'Canada');
INSERT INTO countries (shortname, name) VALUES ('CV', 'Cape Verde');
INSERT INTO countries (shortname, name) VALUES ('KY', 'Cayman Islands');
INSERT INTO countries (shortname, name) VALUES ('CF', 'Central African Republic');
INSERT INTO countries (shortname, name) VALUES ('TD', 'Chad');
INSERT INTO countries (shortname, name) VALUES ('CL', 'Chile');
INSERT INTO countries (shortname, name) VALUES ('CN', 'China');
INSERT INTO countries (shortname, name) VALUES ('CX', 'Christmas Island');
INSERT INTO countries (shortname, name) VALUES ('CC', 'Cocos (Keeling) Islands');
INSERT INTO countries (shortname, name) VALUES ('CO', 'Colombia');
INSERT INTO countries (shortname, name) VALUES ('KM', 'Comoros');
INSERT INTO countries (shortname, name) VALUES ('CD', 'Democratic Republic of the Congo');
INSERT INTO countries (shortname, name) VALUES ('CG', 'Republic of Congo');
INSERT INTO countries (shortname, name) VALUES ('CK', 'Cook Islands');
INSERT INTO countries (shortname, name) VALUES ('CR', 'Costa Rica');
INSERT INTO countries (shortname, name) VALUES ('HR', 'Croatia (Hrvatska)');
INSERT INTO countries (shortname, name) VALUES ('CU', 'Cuba');
INSERT INTO countries (shortname, name) VALUES ('CY', 'Cyprus');
INSERT INTO countries (shortname, name) VALUES ('CZ', 'Czech Republic');
INSERT INTO countries (shortname, name) VALUES ('DK', 'Denmark');
INSERT INTO countries (shortname, name) VALUES ('DJ', 'Djibouti');
INSERT INTO countries (shortname, name) VALUES ('DM', 'Dominica');
INSERT INTO countries (shortname, name) VALUES ('DO', 'Dominican Republic');
INSERT INTO countries (shortname, name) VALUES ('TP', 'East Timor');
INSERT INTO countries (shortname, name) VALUES ('EC', 'Ecuador');
INSERT INTO countries (shortname, name) VALUES ('EG', 'Egypt');
INSERT INTO countries (shortname, name) VALUES ('SV', 'El Salvador');
INSERT INTO countries (shortname, name) VALUES ('GQ', 'Equatorial Guinea');
INSERT INTO countries (shortname, name) VALUES ('ER', 'Eritrea');
INSERT INTO countries (shortname, name) VALUES ('EE', 'Estonia');
INSERT INTO countries (shortname, name) VALUES ('ET', 'Ethiopia');
INSERT INTO countries (shortname, name) VALUES ('FK', 'Falkland Islands (Malvinas)');
INSERT INTO countries (shortname, name) VALUES ('FO', 'Faroe Islands');
INSERT INTO countries (shortname, name) VALUES ('FJ', 'Fiji');
INSERT INTO countries (shortname, name) VALUES ('FI', 'Finland');
INSERT INTO countries (shortname, name) VALUES ('FR', 'France');
INSERT INTO countries (shortname, name) VALUES ('FX', 'France, Metropolitan');
INSERT INTO countries (shortname, name) VALUES ('GF', 'French Guiana');
INSERT INTO countries (shortname, name) VALUES ('PF', 'French Polynesia');
INSERT INTO countries (shortname, name) VALUES ('TF', 'French Southern Territories');
INSERT INTO countries (shortname, name) VALUES ('GA', 'Gabon');
INSERT INTO countries (shortname, name) VALUES ('GM', 'Gambia');
INSERT INTO countries (shortname, name) VALUES ('GE', 'Georgia');
INSERT INTO countries (shortname, name) VALUES ('DE', 'Germany');
INSERT INTO countries (shortname, name) VALUES ('GH', 'Ghana');
INSERT INTO countries (shortname, name) VALUES ('GI', 'Gibraltar');
INSERT INTO countries (shortname, name) VALUES ('GK', 'Guernsey');
INSERT INTO countries (shortname, name) VALUES ('GR', 'Greece');
INSERT INTO countries (shortname, name) VALUES ('GL', 'Greenland');
INSERT INTO countries (shortname, name) VALUES ('GD', 'Grenada');
INSERT INTO countries (shortname, name) VALUES ('GP', 'Guadeloupe');
INSERT INTO countries (shortname, name) VALUES ('GU', 'Guam');
INSERT INTO countries (shortname, name) VALUES ('GT', 'Guatemala');
INSERT INTO countries (shortname, name) VALUES ('GN', 'Guinea');
INSERT INTO countries (shortname, name) VALUES ('GW', 'Guinea-Bissau');
INSERT INTO countries (shortname, name) VALUES ('GY', 'Guyana');
INSERT INTO countries (shortname, name) VALUES ('HT', 'Haiti');
INSERT INTO countries (shortname, name) VALUES ('HM', 'Heard and Mc Donald Islands');
INSERT INTO countries (shortname, name) VALUES ('HN', 'Honduras');
INSERT INTO countries (shortname, name) VALUES ('HK', 'Hong Kong');
INSERT INTO countries (shortname, name) VALUES ('HU', 'Hungary');
INSERT INTO countries (shortname, name) VALUES ('IS', 'Iceland');
INSERT INTO countries (shortname, name) VALUES ('IN', 'India');
INSERT INTO countries (shortname, name) VALUES ('IM', 'Isle of Man');
INSERT INTO countries (shortname, name) VALUES ('ID', 'Indonesia');
INSERT INTO countries (shortname, name) VALUES ('IR', 'Iran (Islamic Republic of)');
INSERT INTO countries (shortname, name) VALUES ('IQ', 'Iraq');
INSERT INTO countries (shortname, name) VALUES ('IE', 'Ireland');
INSERT INTO countries (shortname, name) VALUES ('IL', 'Israel');
INSERT INTO countries (shortname, name) VALUES ('IT', 'Italy');
INSERT INTO countries (shortname, name) VALUES ('CI', 'Ivory Coast');
INSERT INTO countries (shortname, name) VALUES ('JE', 'Jersey');
INSERT INTO countries (shortname, name) VALUES ('JM', 'Jamaica');
INSERT INTO countries (shortname, name) VALUES ('JP', 'Japan');
INSERT INTO countries (shortname, name) VALUES ('JO', 'Jordan');
INSERT INTO countries (shortname, name) VALUES ('KZ', 'Kazakhstan');
INSERT INTO countries (shortname, name) VALUES ('KE', 'Kenya');
INSERT INTO countries (shortname, name) VALUES ('KI', 'Kiribati');
INSERT INTO countries (shortname, name) VALUES ('KP', 'Korea, Democratic People''s Republic of');
INSERT INTO countries (shortname, name) VALUES ('KR', 'Korea, Republic of');
INSERT INTO countries (shortname, name) VALUES ('XK', 'Kosovo');
INSERT INTO countries (shortname, name) VALUES ('KW', 'Kuwait');
INSERT INTO countries (shortname, name) VALUES ('KG', 'Kyrgyzstan');
INSERT INTO countries (shortname, name) VALUES ('LA', 'Lao People''s Democratic Republic');
INSERT INTO countries (shortname, name) VALUES ('LV', 'Latvia');
INSERT INTO countries (shortname, name) VALUES ('LB', 'Lebanon');
INSERT INTO countries (shortname, name) VALUES ('LS', 'Lesotho');
INSERT INTO countries (shortname, name) VALUES ('LR', 'Liberia');
INSERT INTO countries (shortname, name) VALUES ('LY', 'Libyan Arab Jamahiriya');
INSERT INTO countries (shortname, name) VALUES ('LI', 'Liechtenstein');
INSERT INTO countries (shortname, name) VALUES ('LT', 'Lithuania');
INSERT INTO countries (shortname, name) VALUES ('LU', 'Luxembourg');
INSERT INTO countries (shortname, name) VALUES ('MO', 'Macau');
INSERT INTO countries (shortname, name) VALUES ('MK', 'North Macedonia');
INSERT INTO countries (shortname, name) VALUES ('MG', 'Madagascar');
INSERT INTO countries (shortname, name) VALUES ('MW', 'Malawi');
INSERT INTO countries (shortname, name) VALUES ('MY', 'Malaysia');
INSERT INTO countries (shortname, name) VALUES ('MV', 'Maldives');
INSERT INTO countries (shortname, name) VALUES ('ML', 'Mali');
INSERT INTO countries (shortname, name) VALUES ('MT', 'Malta');
INSERT INTO countries (shortname, name) VALUES ('MH', 'Marshall Islands');
INSERT INTO countries (shortname, name) VALUES ('MQ', 'Martinique');
INSERT INTO countries (shortname, name) VALUES ('MR', 'Mauritania');
INSERT INTO countries (shortname, name) VALUES ('MU', 'Mauritius');
INSERT INTO countries (shortname, name) VALUES ('TY', 'Mayotte');
INSERT INTO countries (shortname, name) VALUES ('MX', 'Mexico');
INSERT INTO countries (shortname, name) VALUES ('FM', 'Micronesia, Federated States of');
INSERT INTO countries (shortname, name) VALUES ('MD', 'Moldova, Republic of');
INSERT INTO countries (shortname, name) VALUES ('MC', 'Monaco');
INSERT INTO countries (shortname, name) VALUES ('MN', 'Mongolia');
INSERT INTO countries (shortname, name) VALUES ('ME', 'Montenegro');
INSERT INTO countries (shortname, name) VALUES ('MS', 'Montserrat');
INSERT INTO countries (shortname, name) VALUES ('MA', 'Morocco');
INSERT INTO countries (shortname, name) VALUES ('MZ', 'Mozambique');
INSERT INTO countries (shortname, name) VALUES ('MM', 'Myanmar');
INSERT INTO countries (shortname, name) VALUES ('NA', 'Namibia');
INSERT INTO countries (shortname, name) VALUES ('NR', 'Nauru');
INSERT INTO countries (shortname, name) VALUES ('NP', 'Nepal');
INSERT INTO countries (shortname, name) VALUES ('NL', 'Netherlands');
INSERT INTO countries (shortname, name) VALUES ('AN', 'Netherlands Antilles');
INSERT INTO countries (shortname, name) VALUES ('NC', 'New Caledonia');
INSERT INTO countries (shortname, name) VALUES ('NZ', 'New Zealand');
INSERT INTO countries (shortname, name) VALUES ('NI', 'Nicaragua');
INSERT INTO countries (shortname, name) VALUES ('NE', 'Niger');
INSERT INTO countries (shortname, name) VALUES ('NG', 'Nigeria');
INSERT INTO countries (shortname, name) VALUES ('NU', 'Niue');
INSERT INTO countries (shortname, name) VALUES ('NF', 'Norfolk Island');
INSERT INTO countries (shortname, name) VALUES ('MP', 'Northern Mariana Islands');
INSERT INTO countries (shortname, name) VALUES ('NO', 'Norway');
INSERT INTO countries (shortname, name) VALUES ('OM', 'Oman');
INSERT INTO countries (shortname, name) VALUES ('PK', 'Pakistan');
INSERT INTO countries (shortname, name) VALUES ('PW', 'Palau');
INSERT INTO countries (shortname, name) VALUES ('PS', 'Palestine');
INSERT INTO countries (shortname, name) VALUES ('PA', 'Panama');
INSERT INTO countries (shortname, name) VALUES ('PG', 'Papua New Guinea');
INSERT INTO countries (shortname, name) VALUES ('PY', 'Paraguay');
INSERT INTO countries (shortname, name) VALUES ('PE', 'Peru');
INSERT INTO countries (shortname, name) VALUES ('PH', 'Philippines');
INSERT INTO countries (shortname, name) VALUES ('PN', 'Pitcairn');
INSERT INTO countries (shortname, name) VALUES ('PL', 'Poland');
INSERT INTO countries (shortname, name) VALUES ('PT', 'Portugal');
INSERT INTO countries (shortname, name) VALUES ('PR', 'Puerto Rico');
INSERT INTO countries (shortname, name) VALUES ('QA', 'Qatar');
INSERT INTO countries (shortname, name) VALUES ('RE', 'Reunion');
INSERT INTO countries (shortname, name) VALUES ('RO', 'Romania');
INSERT INTO countries (shortname, name) VALUES ('RU', 'Russian Federation');
INSERT INTO countries (shortname, name) VALUES ('RW', 'Rwanda');
INSERT INTO countries (shortname, name) VALUES ('KN', 'Saint Kitts and Nevis');
INSERT INTO countries (shortname, name) VALUES ('LC', 'Saint Lucia');
INSERT INTO countries (shortname, name) VALUES ('VC', 'Saint Vincent and the Grenadines');
INSERT INTO countries (shortname, name) VALUES ('WS', 'Samoa');
INSERT INTO countries (shortname, name) VALUES ('SM', 'San Marino');
INSERT INTO countries (shortname, name) VALUES ('ST', 'Sao Tome and Principe');
INSERT INTO countries (shortname, name) VALUES ('SA', 'Saudi Arabia');
INSERT INTO countries (shortname, name) VALUES ('SN', 'Senegal');
INSERT INTO countries (shortname, name) VALUES ('RS', 'Serbia');
INSERT INTO countries (shortname, name) VALUES ('SC', 'Seychelles');
INSERT INTO countries (shortname, name) VALUES ('SL', 'Sierra Leone');
INSERT INTO countries (shortname, name) VALUES ('SG', 'Singapore');
INSERT INTO countries (shortname, name) VALUES ('SK', 'Slovakia');
INSERT INTO countries (shortname, name) VALUES ('SI', 'Slovenia');
INSERT INTO countries (shortname, name) VALUES ('SB', 'Solomon Islands');
INSERT INTO countries (shortname, name) VALUES ('SO', 'Somalia');
INSERT INTO countries (shortname, name) VALUES ('ZA', 'South Africa');
INSERT INTO countries (shortname, name) VALUES ('GS', 'South Georgia South Sandwich Islands');
INSERT INTO countries (shortname, name) VALUES ('SS', 'South Sudan');
INSERT INTO countries (shortname, name) VALUES ('ES', 'Spain');
INSERT INTO countries (shortname, name) VALUES ('LK', 'Sri Lanka');
INSERT INTO countries (shortname, name) VALUES ('SH', 'St. Helena');
INSERT INTO countries (shortname, name) VALUES ('PM', 'St. Pierre and Miquelon');
INSERT INTO countries (shortname, name) VALUES ('SD', 'Sudan');
INSERT INTO countries (shortname, name) VALUES ('SR', 'Suriname');
INSERT INTO countries (shortname, name) VALUES ('SJ', 'Svalbard and Jan Mayen Islands');
INSERT INTO countries (shortname, name) VALUES ('SZ', 'Swaziland');
INSERT INTO countries (shortname, name) VALUES ('SE', 'Sweden');
INSERT INTO countries (shortname, name) VALUES ('CH', 'Switzerland');
INSERT INTO countries (shortname, name) VALUES ('SY', 'Syrian Arab Republic');
INSERT INTO countries (shortname, name) VALUES ('TW', 'Taiwan');
INSERT INTO countries (shortname, name) VALUES ('TJ', 'Tajikistan');
INSERT INTO countries (shortname, name) VALUES ('TZ', 'Tanzania, United Republic of');
INSERT INTO countries (shortname, name) VALUES ('TH', 'Thailand');
INSERT INTO countries (shortname, name) VALUES ('TG', 'Togo');
INSERT INTO countries (shortname, name) VALUES ('TK', 'Tokelau');
INSERT INTO countries (shortname, name) VALUES ('TO', 'Tonga');
INSERT INTO countries (shortname, name) VALUES ('TT', 'Trinidad and Tobago');
INSERT INTO countries (shortname, name) VALUES ('TN', 'Tunisia');
INSERT INTO countries (shortname, name) VALUES ('TR', 'Turkey');
INSERT INTO countries (shortname, name) VALUES ('TM', 'Turkmenistan');
INSERT INTO countries (shortname, name) VALUES ('TC', 'Turks and Caicos Islands');
INSERT INTO countries (shortname, name) VALUES ('TV', 'Tuvalu');
INSERT INTO countries (shortname, name) VALUES ('UG', 'Uganda');
INSERT INTO countries (shortname, name) VALUES ('UA', 'Ukraine');
INSERT INTO countries (shortname, name) VALUES ('AE', 'United Arab Emirates');
INSERT INTO countries (shortname, name) VALUES ('GB', 'United Kingdom');
INSERT INTO countries (shortname, name) VALUES ('US', 'United States');
INSERT INTO countries (shortname, name) VALUES ('UM', 'United States minor outlying islands');
INSERT INTO countries (shortname, name) VALUES ('UY', 'Uruguay');
INSERT INTO countries (shortname, name) VALUES ('UZ', 'Uzbekistan');
INSERT INTO countries (shortname, name) VALUES ('VU', 'Vanuatu');
INSERT INTO countries (shortname, name) VALUES ('VA', 'Vatican City State');
INSERT INTO countries (shortname, name) VALUES ('VE', 'Venezuela');
INSERT INTO countries (shortname, name) VALUES ('VN', 'Vietnam');
INSERT INTO countries (shortname, name) VALUES ('VG', 'Virgin Islands (British)');
INSERT INTO countries (shortname, name) VALUES ('VI', 'Virgin Islands (U.S.)');
INSERT INTO countries (shortname, name) VALUES ('WF', 'Wallis and Futuna Islands');
INSERT INTO countries (shortname, name) VALUES ('EH', 'Western Sahara');
INSERT INTO countries (shortname, name) VALUES ('YE', 'Yemen');
INSERT INTO countries (shortname, name) VALUES ('ZM', 'Zambia');
INSERT INTO countries (shortname, name) VALUES ('ZW', 'Zimbabwe');