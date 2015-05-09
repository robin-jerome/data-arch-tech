use dataarchtech;

/* Details about the vendor */
CREATE TABLE `vendor_vendor` (
  `uuid` varchar(32) NOT NULL,
  `vendor_type` varchar(255) NOT NULL, /* Either primary, secondary or implementation partner */
  `email` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `address_line1` varchar(255) NOT NULL,
  `address_line2` varchar(255) NOT NULL,
  `address_city` varchar(255) NOT NULL,
  `address_zipcode` varchar(255) NOT NULL,
  `address_state` varchar(255) NOT NULL,
  `address_country` varchar(255) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `email` (`email`),
  KEY `email_index` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/* Details about the job_requirement */
CREATE TABLE `vendor_job_requirement` (
  `uuid` varchar(32) NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `location_city` varchar(255) NOT NULL,
  `location_state` varchar(255) DEFAULT NULL,
  `location_country` varchar(255) NOT NULL,
  `billing` varchar(255) NOT NULL,
  `job_description` text NOT NULL,
  `vendor_uuid` varchar(32) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uuid`),
  CONSTRAINT `vendor_uuid` FOREIGN KEY (`vendor_uuid`) REFERENCES `vendor_vendor` (`uuid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/* Details about the consultant */
CREATE TABLE `consultant_consultant` (
  `uuid` varchar(32) NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `location_city` varchar(255) NOT NULL,
  `location_state` varchar(255) DEFAULT NULL,
  `location_country` varchar(255) NOT NULL,
  `experience_years` int(2) NOT NULL,
  `experience_months` int(2) NOT NULL,
  `primary_skillset` varchar(512) NOT NULL,
  `secondary_skillset` varchar(512) NOT NULL,
  `employment_mode` varchar(255) NOT NULL, /* Either of W2/C2C/1099 */
  `status` varchar(255) NOT NULL, /* Either of H1B/GC/Citizen/OPT/CPT */
  `salary_expectation` varchar(255) NOT NULL, /* hourly rate or full time pkg */
  `salary_expectation_type` varchar(255) NOT NULL, /* full time or per hour */
  `resume` BLOB NOT NULL, /* full time or per hour */
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `email` (`email`),
  KEY `email_index` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
