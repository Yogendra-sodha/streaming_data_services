CREATE TABLE checkouts(
    click_id STRING,
    user_id INT,
    product_id STRING,
    product STRING,
    url STRING,
    ip_address STRING,
    datetime_occured TIMESTAMP(3),
    process_time as PROCTIME,
    WATERMARK FOR datetime_occured AS datetime_occured - INTERVAL '15' SECOND
) WITH (
    'connector' = '{{connector}}',
    'topic'='{{topic}}',
    'properties.bootstrap.servers' = '{{bootstrap_servers}}',
    'properties.group.id' = '{{consumer_group_id}}',
    'scan.startup.mode' = '{{scan_startup_mode}}',
    'format' = '{{format}}'
)