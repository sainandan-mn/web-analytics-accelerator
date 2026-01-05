SELECT
  event_date,
  event_timestamp,
  user_pseudo_id,
  event_name,
  geo.country AS country,
  ep.key AS param_key,
  ep.value.string_value AS param_value
FROM `project.dataset.events_*`,
UNNEST(event_params) AS ep;
