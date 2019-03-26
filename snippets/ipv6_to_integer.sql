#maxmind converted dataset compatible

CREATE FUNCTION f_ipv6_aton(VARCHAR)
    RETURNS numeric(38, 0) IMMUTABLE
    as $$
select (
    strtol(SPLIT_PART($1, ':', 1), 16)::numeric(38, 0) * pow(2, 48)::numeric(38, 0) * pow(2, 48)::numeric(38, 0) * pow(2, 16)::numeric(38, 0) + 
    strtol(SPLIT_PART($1, ':', 2), 16)::numeric(38, 0) * pow(2, 48)::numeric(38, 0) * pow(2, 48)::numeric(38, 0) +
    strtol(SPLIT_PART($1, ':', 3), 16)::numeric(38, 0) * pow(2, 48)::numeric(38, 0) * pow(2, 32)::numeric(38, 0) +
    strtol(SPLIT_PART($1, ':', 4), 16)::numeric(38, 0) * pow(2, 48)::numeric(38, 0) * pow(2, 16)::numeric(38, 0) +
    strtol(SPLIT_PART($1, ':', 5), 16)::numeric(38, 0) * pow(2, 48)::numeric(38, 0) +
    strtol(SPLIT_PART($1, ':', 6), 16)::numeric(38, 0) * pow(2, 32)::numeric(38, 0) +
    strtol(SPLIT_PART($1, ':', 7), 16)::numeric(38, 0) * pow(2, 16)::numeric(38, 0) +
    strtol(SPLIT_PART($1, ':', 8), 16)::numeric(38, 0) * pow(2, 0)::numeric(38, 0)
)::numeric(38, 0);
$$ LANGUAGE sql;

select f_ipv6_aton('2001:418:1401:31:6418:4e6e:8974:2ec5');
