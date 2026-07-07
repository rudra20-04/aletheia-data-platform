/*============================================================
 Project  : E-Commerce Data Warehouse & Business Intelligence
 Author   : Rudra Mahendrabhai Patel
 Database : PostgreSQL
==============================================================*/

/*------------------------------------------------------------
 Drop Existing Schema (Optional)
 Uncomment if rebuilding the warehouse
------------------------------------------------------------*/

/*
DROP SCHEMA IF EXISTS warehouse CASCADE;
*/

/*------------------------------------------------------------
 Create Warehouse Schema
------------------------------------------------------------*/

CREATE SCHEMA IF NOT EXISTS warehouse;

/*------------------------------------------------------------
 Set Search Path
------------------------------------------------------------*/

SET search_path TO warehouse;

/*------------------------------------------------------------
 Verify Schema Creation
------------------------------------------------------------*/

SELECT current_schema();