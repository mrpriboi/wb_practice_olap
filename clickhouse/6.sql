CREATE TABLE current.ShkOnPlace
(

    `shk_id` Int64,

    `employee_id` UInt32,

    `place_cod` UInt64,

    `dt` DateTime64(6),

    `state_id` LowCardinality(String),
    
    `dt_load` DateTime materialized now()
)
ENGINE = ReplacingMergeTree(dt)
ORDER BY shk_id
SETTINGS index_granularity = 8192;

CREATE MATERIALIZED VIEW stg.mvSOP_SHKonPlace TO current.ShkOnPlace
(
    `shk_id` Int64,

    `employee_id` UInt32,

    `place_cod` UInt64,

    `dt` DateTime64(6),

    `state_id` LowCardinality(String)
) AS
SELECT
    shk_id,
    employee_id,
    toInt64(place_cod) AS place_cod,
    dt,
    state_id
FROM stg.place_log;
