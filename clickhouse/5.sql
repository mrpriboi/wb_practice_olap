CREATE TABLE stg.place_log
(
    `shk_id` Int64,

    `employee_id` UInt32,

    `place_cod` UInt64,

    `dt` DateTime64(6),

    `state_id` LowCardinality(String),
    
    `dt_load` DateTime materialized now()

)   
ENGINE = MergeTree()
PARTITION BY toYYYYMMDD(dt)
ORDER BY shk_id
TTL toStartOfDay(dt_load) + toIntervalDay(3)
SETTINGS index_granularity = 8192,
 ttl_only_drop_parts = 1;
 

CREATE TABLE direct_log.Place_buf
(
	`shk_id` Int64,

    `employee_id` UInt32,

    `place_cod` UInt64,

    `dt` DateTime64(6),

    `state_id` LowCardinality(String),
    
    `dt_load` DateTime materialized now()
)
ENGINE = Buffer('stg',
 'place_log',
 16,
 10,
 70,
 10000,
 300000,
 10000000,
 100000000);
