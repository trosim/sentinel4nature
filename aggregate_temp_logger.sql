﻿-- Aggregate statistics on temperature logger data

-- Drop views that depend on tables that should be recreated
DROP VIEW IF EXISTS sentinel4nature.temperaturelogger_coredata_days;
DROP VIEW IF EXISTS sentinel4nature.temperaturelogger_coredata_months;
DROP VIEW IF EXISTS sentinel4nature.temperaturelogger_coredata_years;

-- Aggregate by day
DROP TABLE IF EXISTS sentinel4nature."temploggerData_days";
CREATE TABLE sentinel4nature."temploggerData_days" AS
SELECT 
locality
, date_trunc('day', date)::date AS date
, count(temperature_c) AS temperature_c_days_count
, max(temperature_c) AS temperature_c_days_max
, avg(temperature_c) AS temperature_c_days_avg
, min(temperature_c) AS temperature_c_days_min
, stddev_samp(temperature_c) AS temperature_c_days_stddev
, var_samp(temperature_c) AS temperature_c_days_var
, count(temperature_f) AS temperature_f_days_count
, max(temperature_f) AS temperature_f_days_max
, avg(temperature_f) AS temperature_f_days_avg
, min(temperature_f) AS temperature_f_days_min
, stddev_samp(temperature_f) AS temperature_f_days_stddev
, var_samp(temperature_f) AS temperature_f_days_var
, count(humidity_perc) AS humidity_perc_days_count
, max(humidity_perc) AS humidity_perc_days_max
, avg(humidity_perc) AS humidity_perc_days_avg
, min(humidity_perc) AS humidity_perc_days_min
, stddev_samp(humidity_perc) AS humidity_perc_days_stddev
, var_samp(humidity_perc) AS humidity_perc_days_var
, count(dew_point_c) AS dew_point_c_days_count
, max(dew_point_c) AS dew_point_c_days_max
, avg(dew_point_c) AS dew_point_c_days_avg
, min(dew_point_c) AS dew_point_c_days_min
, stddev_samp(dew_point_c) AS dew_point_c_days_stddev
, var_samp(dew_point_c) AS dew_point_c_days_var
, count(dew_point_f) AS dew_point_f_days_count
, max(dew_point_f) AS dew_point_f_days_max
, avg(dew_point_f) AS dew_point_f_days_avg
, min(dew_point_f) AS dew_point_f_days_min
, stddev_samp(dew_point_f) AS dew_point_f_days_stddev
, var_samp(dew_point_f) AS dew_point_f_days_var
  FROM sentinel4nature."temploggerData"
GROUP BY 
locality
, date_trunc('day', date)::date
ORDER BY locality
, date_trunc('day', date)::date;

DROP TABLE IF EXISTS sentinel4nature."temploggerData_months";
CREATE TABLE sentinel4nature."temploggerData_months" AS
SELECT 
locality
, date_trunc('month', date)::date AS date
, array_length(array_agg(DISTINCT date_trunc('day', date)), 1) AS number_of_days
, count(temperature_c) AS temperature_c_months_count
, max(temperature_c) AS temperature_c_months_max
, avg(temperature_c) AS temperature_c_months_avg
, min(temperature_c) AS temperature_c_months_min
, stddev_samp(temperature_c) AS temperature_c_months_stddev
, var_samp(temperature_c) AS temperature_c_months_var
, count(temperature_f) AS temperature_f_months_count
, max(temperature_f) AS temperature_f_months_max
, avg(temperature_f) AS temperature_f_months_avg
, min(temperature_f) AS temperature_f_months_min
, stddev_samp(temperature_f) AS temperature_f_months_stddev
, var_samp(temperature_f) AS temperature_f_months_var
, count(humidity_perc) AS humidity_perc_months_count
, max(humidity_perc) AS humidity_perc_months_max
, avg(humidity_perc) AS humidity_perc_months_avg
, min(humidity_perc) AS humidity_perc_months_min
, stddev_samp(humidity_perc) AS humidity_perc_months_stddev
, var_samp(humidity_perc) AS humidity_perc_months_var
, count(dew_point_c) AS dew_point_c_months_count
, max(dew_point_c) AS dew_point_c_months_max
, avg(dew_point_c) AS dew_point_c_months_avg
, min(dew_point_c) AS dew_point_c_months_min
, stddev_samp(dew_point_c) AS dew_point_c_months_stddev
, var_samp(dew_point_c) AS dew_point_c_months_var
, count(dew_point_f) AS dew_point_f_months_count
, max(dew_point_f) AS dew_point_f_months_max
, avg(dew_point_f) AS dew_point_f_months_avg
, min(dew_point_f) AS dew_point_f_months_min
, stddev_samp(dew_point_f) AS dew_point_f_months_stddev
, var_samp(dew_point_f) AS dew_point_f_months_var
  FROM sentinel4nature."temploggerData"
GROUP BY 
locality
, date_trunc('month', date)::date
ORDER BY locality
, date_trunc('month', date)::date;

DROP TABLE IF EXISTS sentinel4nature."temploggerData_years";
CREATE TABLE sentinel4nature."temploggerData_years" AS
SELECT 
locality
, date_trunc('year', date)::date AS date
, array_length(array_agg(DISTINCT date_trunc('day', date)), 1)
, count(temperature_c) AS temperature_c_years_count
, max(temperature_c) AS temperature_c_years_max
, avg(temperature_c) AS temperature_c_years_avg
, min(temperature_c) AS temperature_c_years_min
, stddev_samp(temperature_c) AS temperature_c_years_stddev
, var_samp(temperature_c) AS temperature_c_years_var
, count(temperature_f) AS temperature_f_years_count
, max(temperature_f) AS temperature_f_years_max
, avg(temperature_f) AS temperature_f_years_avg
, min(temperature_f) AS temperature_f_years_min
, stddev_samp(temperature_f) AS temperature_f_years_stddev
, var_samp(temperature_f) AS temperature_f_years_var
, count(humidity_perc) AS humidity_perc_years_count
, max(humidity_perc) AS humidity_perc_years_max
, avg(humidity_perc) AS humidity_perc_years_avg
, min(humidity_perc) AS humidity_perc_years_min
, stddev_samp(humidity_perc) AS humidity_perc_years_stddev
, var_samp(humidity_perc) AS humidity_perc_years_var
, count(dew_point_c) AS dew_point_c_years_count
, max(dew_point_c) AS dew_point_c_years_max
, avg(dew_point_c) AS dew_point_c_years_avg
, min(dew_point_c) AS dew_point_c_years_min
, stddev_samp(dew_point_c) AS dew_point_c_years_stddev
, var_samp(dew_point_c) AS dew_point_c_years_var
, count(dew_point_f) AS dew_point_f_years_count
, max(dew_point_f) AS dew_point_f_years_max
, avg(dew_point_f) AS dew_point_f_years_avg
, min(dew_point_f) AS dew_point_f_years_min
, stddev_samp(dew_point_f) AS dew_point_f_years_stddev
, var_samp(dew_point_f) AS dew_point_f_years_var
  FROM sentinel4nature."temploggerData"
GROUP BY 
locality
, date_trunc('year', date)::date
ORDER BY locality
, date_trunc('year', date)::date;

DROP TABLE IF EXISTS sentinel4nature."temploggerData_snowCover";
CREATE TABLE sentinel4nature."temploggerData_snowCover" AS
SELECT locality, date, snowcover FROM (SELECT * FROM 
(SELECT locality, date, CAST('snow' AS text) AS snowcover, CAST(2 AS smallint) AS order_f FROM sentinel4nature."temploggerData_days" where temperature_c_days_var < 1 AND temperature_c_days_max < 1) AS a 
UNION ALL 
(SELECT locality, date, CAST('snow on' AS text) AS snowcover, CAST(1 AS smallint) AS order_f FROM 
(SELECT locality, date, date AS snow_day, temperature_c_days_var AS temperature_c_days_var_before FROM sentinel4nature."temploggerData_days" where temperature_c_days_var < 1 AND temperature_c_days_max < 1) AS c
NATURAL INNER JOIN 
(SELECT locality, date + 1 AS date, date AS snow_free_day_before, temperature_c_days_var AS temperature_c_days_var_current FROM sentinel4nature."temploggerData_days" WHERE temperature_c_days_var >= 1) AS b)
UNION ALL 
(SELECT locality, date, CAST('snow off' AS text) AS snowcover, CAST(3 AS smallint) AS order_f FROM 
(SELECT locality, date, date AS snow_day, temperature_c_days_var AS temperature_c_days_var_before FROM sentinel4nature."temploggerData_days" where temperature_c_days_var < 1 AND temperature_c_days_max < 1) AS c
NATURAL INNER JOIN 
(SELECT locality, date - 1 AS date, date AS snow_free_day_before, temperature_c_days_var AS temperature_c_days_var_current FROM sentinel4nature."temploggerData_days" WHERE temperature_c_days_var >= 1) AS b)
ORDER BY locality, date, order_f) AS x

-- Extract days with snow cover
SELECT locality, date_trunc('year', date) AS year, count(date) AS snow_days 
FROM sentinel4nature."temploggerData_days" where temperature_c_var < 1 AND temperature_c_max < 1
GROUP BY locality, date_trunc('year', date)
ORDER BY locality, date_trunc('year', date);

-- Extract snow-on and snow-off days
SELECT * FROM (SELECT locality, date, CAST('snow' AS text) AS snowcover FROM sentinel4nature."temploggerData_days" where temperature_c_days_var < 1 AND temperature_c_days_max < 1 LIMIT 10) AS a 
UNION ALL 
(SELECT locality, date, CAST('snow on' AS text) AS snowcover FROM 
(SELECT locality, date, date AS snow_day, temperature_c_days_var AS temperature_c_days_var_before FROM sentinel4nature."temploggerData_days" where temperature_c_days_var < 1 AND temperature_c_days_max < 1) AS c
NATURAL INNER JOIN 
(SELECT locality, date + 1 AS date, date AS snow_free_day_before, temperature_c_days_var AS temperature_c_days_var_current FROM sentinel4nature."temploggerData_days" WHERE temperature_c_days_var >= 1) AS b LIMIT 10)
UNION ALL 
(SELECT locality, date, CAST('snow off' AS text) AS snowcover FROM 
(SELECT locality, date, date AS snow_day, temperature_c_days_var AS temperature_c_days_var_before FROM sentinel4nature."temploggerData_days" where temperature_c_days_var < 1 AND temperature_c_days_max < 1) AS c
NATURAL INNER JOIN 
(SELECT locality, date - 1 AS date, date AS snow_free_day_before, temperature_c_days_var AS temperature_c_days_var_current FROM sentinel4nature."temploggerData_days" WHERE temperature_c_days_var >= 1) AS b LIMIT 10)
-- ON b.locality = c.locality AND c.date = b.date -- LIMIT 10

SELECT locality, date, 
CASE WHEN temperature_c_var < 1 AND temperature_c_max < 1 AND date - 1 THEN True
ELSE False
END AS snow_on_day
SELECT * FROM
(SELECT locality, date, 'snow' as snowcover FROM sentinel4nature."temploggerData_days" where temperature_c_days_var < 1 AND temperature_c_days_max < 1) AS c
LEFT JOIN (SELECT locality, date, True AS snow_on FROM sentinel4nature."temploggerData_days" where temperature_c_days_var >= 1 AND temperature_c_days_max >= 1) AS b WHERE b.locality = c.locality AND c.date = ( b.date - 1 )
LEFT JOIN (SELECT locality, date, True AS snow_off FROM sentinel4nature."temploggerData_days" where temperature_c_days_var >= 1 AND temperature_c_days_max >= 1) AS a WHERE a.locality = c.locality AND c.date = ( a.date - +1 )
--GROUP BY locality, date_trunc('year', date)
ORDER BY locality, date;

-- Create views
CREATE OR REPLACE VIEW sentinel4nature.temperaturelogger_coredata_days AS SELECT locality, date, temperature_c_days_count, temperature_c_days_max, 
       temperature_c_days_avg, temperature_c_days_min, temperature_c_days_stddev, 
       temperature_c_days_var, humidity_perc_days_count, humidity_perc_days_max, 
       humidity_perc_days_avg, humidity_perc_days_min, humidity_perc_days_stddev, 
       humidity_perc_days_var, dew_point_c_days_count, dew_point_c_days_max, 
       dew_point_c_days_avg, dew_point_c_days_min, dew_point_c_days_stddev, 
       dew_point_c_days_var
  FROM sentinel4nature."temploggerData_days" NATURAL LEFT JOIN 
sentinel4nature.temperaturelogger_locations;

CREATE OR REPLACE VIEW sentinel4nature.temperaturelogger_coredata_months AS SELECT locality, date, number_of_days, temperature_c_months_count, temperature_c_months_max, 
       temperature_c_months_avg, temperature_c_months_min, temperature_c_months_stddev, 
       temperature_c_months_var, humidity_perc_months_count, humidity_perc_months_max, 
       humidity_perc_months_avg, humidity_perc_months_min, humidity_perc_months_stddev, 
       humidity_perc_months_var, dew_point_c_months_count, dew_point_c_months_max, 
       dew_point_c_months_avg, dew_point_c_months_min, dew_point_c_months_stddev, 
       dew_point_c_months_var
  FROM sentinel4nature."temploggerData_months" NATURAL LEFT JOIN 
sentinel4nature.temperaturelogger_locations;

CREATE OR REPLACE VIEW sentinel4nature.temperaturelogger_coredata_years AS SELECT locality, date, array_length AS number_of_days, temperature_c_years_count, temperature_c_years_max, 
       temperature_c_years_avg, temperature_c_years_min, temperature_c_years_stddev, 
       temperature_c_years_var, humidity_perc_years_count, humidity_perc_years_max, 
       humidity_perc_years_avg, humidity_perc_years_min, humidity_perc_years_stddev, 
       humidity_perc_years_var, dew_point_c_years_count, dew_point_c_years_max, 
       dew_point_c_years_avg, dew_point_c_years_min, dew_point_c_years_stddev, 
       dew_point_c_years_var
  FROM sentinel4nature."temploggerData_years" NATURAL LEFT JOIN 
sentinel4nature.temperaturelogger_locations;

